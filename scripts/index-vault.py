"""
Incremental vault sync for Pinecone.

This script walks selected vault folders, chunks Markdown files, and upserts only
new or changed files into the existing Pinecone index. It also deletes stale
vectors when files are removed or shrink.

Examples:
  py scripts/index-vault.py
  py scripts/index-vault.py --watch
  py scripts/index-vault.py --watch --poll-seconds 30
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import sys
import time
from pathlib import Path

try:
    from pinecone import Pinecone
except ImportError:
    print("Installing pinecone...")
    os.system(f"{sys.executable} -m pip install pinecone")
    from pinecone import Pinecone


VAULT_ROOT = Path(__file__).resolve().parent.parent
INDEX_NAME = "k2m-vault"
FOLDERS = ("docs", "atlas", "memory")
CHUNK_SIZE = 800
CHUNK_OVERLAP = 100
NAMESPACE = "vault"
UPSERT_BATCH_SIZE = 40
UPSERT_DELAY_SECONDS = 6.0
DELETE_BATCH_SIZE = 500
DEFAULT_POLL_SECONDS = 20
STATE_PATH = VAULT_ROOT / "tmp" / "pinecone-index-state.json"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Incrementally sync the vault to Pinecone.")
    parser.add_argument(
        "--bootstrap-state",
        action="store_true",
        help="Write the local state file from current vault files without touching Pinecone.",
    )
    parser.add_argument("--watch", action="store_true", help="Keep polling for changes and sync automatically.")
    parser.add_argument(
        "--poll-seconds",
        type=float,
        default=DEFAULT_POLL_SECONDS,
        help=f"Polling interval for --watch mode. Default: {DEFAULT_POLL_SECONDS}.",
    )
    parser.add_argument(
        "--state-path",
        type=Path,
        default=STATE_PATH,
        help=f"Local sync state file. Default: {STATE_PATH.relative_to(VAULT_ROOT)}",
    )
    parser.add_argument(
        "--batch-size",
        type=int,
        default=UPSERT_BATCH_SIZE,
        help=f"Upsert batch size. Default: {UPSERT_BATCH_SIZE}.",
    )
    parser.add_argument(
        "--batch-delay",
        type=float,
        default=UPSERT_DELAY_SECONDS,
        help=f"Delay between upsert batches in seconds. Default: {UPSERT_DELAY_SECONDS}.",
    )
    return parser.parse_args()


def load_api_key() -> str:
    api_key = os.environ.get("PINECONE_API_KEY")
    if api_key:
        return api_key

    mcp_path = Path.home() / ".claude" / "mcp.json"
    if mcp_path.exists():
        data = json.loads(mcp_path.read_text(encoding="utf-8"))
        api_key = data.get("mcpServers", {}).get("pinecone", {}).get("env", {}).get("PINECONE_API_KEY")
        if api_key:
            return api_key

    print("ERROR: PINECONE_API_KEY not found. Set it as an environment variable.")
    sys.exit(1)


def chunk_text(text: str, size: int = CHUNK_SIZE, overlap: int = CHUNK_OVERLAP) -> list[str]:
    chunks: list[str] = []
    start = 0
    while start < len(text):
        end = start + size
        chunks.append(text[start:end])
        start += size - overlap
    return chunks


def make_id(path: str, chunk_idx: int) -> str:
    return hashlib.md5(f"{path}::{chunk_idx}".encode("utf-8")).hexdigest()


def content_hash(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()


def relative(path: Path) -> str:
    return str(path.relative_to(VAULT_ROOT)).replace("\\", "/")


def ensure_parent_dir(path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)


def current_config_signature() -> dict[str, object]:
    return {
        "index_name": INDEX_NAME,
        "namespace": NAMESPACE,
        "folders": list(FOLDERS),
        "chunk_size": CHUNK_SIZE,
        "chunk_overlap": CHUNK_OVERLAP,
    }


def load_state(path: Path) -> dict[str, object]:
    if not path.exists():
        return {"config": current_config_signature(), "files": {}}

    data = json.loads(path.read_text(encoding="utf-8"))
    if "files" not in data or not isinstance(data["files"], dict):
        data["files"] = {}
    if "config" not in data or not isinstance(data["config"], dict):
        data["config"] = {}
    return data


def save_state(path: Path, state: dict[str, object]) -> None:
    ensure_parent_dir(path)
    path.write_text(json.dumps(state, indent=2, sort_keys=True), encoding="utf-8")


def scan_files() -> dict[str, dict[str, object]]:
    manifest: dict[str, dict[str, object]] = {}

    for folder in FOLDERS:
        folder_path = VAULT_ROOT / folder
        if not folder_path.exists():
            continue

        for md_file in sorted(folder_path.rglob("*.md")):
            text = md_file.read_text(encoding="utf-8", errors="ignore").strip()
            if len(text) < 50:
                continue

            rel = relative(md_file)
            chunks = chunk_text(text)
            manifest[rel] = {
                "source": rel,
                "folder": folder,
                "filename": md_file.name,
                "content_hash": content_hash(text),
                "chunk_ids": [make_id(rel, i) for i in range(len(chunks))],
                "records": [
                    {
                        "_id": make_id(rel, i),
                        "content": chunk,
                        "source": rel,
                        "folder": folder,
                        "chunk": i,
                        "total_chunks": len(chunks),
                        "filename": md_file.name,
                    }
                    for i, chunk in enumerate(chunks)
                ],
            }

    return manifest


def bootstrap_state(state_path: Path) -> None:
    current_manifest = scan_files()
    state_files: dict[str, dict[str, object]] = {}
    for source, entry in current_manifest.items():
        state_files[source] = {
            "folder": entry["folder"],
            "filename": entry["filename"],
            "content_hash": entry["content_hash"],
            "chunk_ids": entry["chunk_ids"],
        }

    save_state(state_path, {"config": current_config_signature(), "files": state_files})
    print(
        "Bootstrapped local sync state from the current vault snapshot. "
        f"Tracked {len(state_files)} files at {state_path}."
    )


def batches(items: list[object], batch_size: int) -> list[list[object]]:
    return [items[i : i + batch_size] for i in range(0, len(items), batch_size)]


def delete_ids(index, ids: list[str]) -> None:
    if not ids:
        return

    for batch_num, batch in enumerate(batches(ids, DELETE_BATCH_SIZE), start=1):
        index.delete(ids=batch, namespace=NAMESPACE)
        print(f"  Deleted batch {batch_num} ({len(batch)} ids)")


def upsert_records(index, records: list[dict[str, object]], batch_size: int, batch_delay: float) -> None:
    if not records:
        return

    total_batches = (len(records) + batch_size - 1) // batch_size
    for batch_num, batch in enumerate(batches(records, batch_size), start=1):
        index.upsert_records(NAMESPACE, batch)
        print(f"  Upsert batch {batch_num}/{total_batches} ({len(batch)} records)")
        if batch_num < total_batches and batch_delay > 0:
            time.sleep(batch_delay)


def build_plan(previous_state: dict[str, object], current_manifest: dict[str, dict[str, object]]) -> tuple[list[str], list[str], list[dict[str, object]], dict[str, object]]:
    previous_files: dict[str, dict[str, object]] = previous_state.get("files", {})  # type: ignore[assignment]
    previous_config = previous_state.get("config", {})
    config_changed = previous_config != current_config_signature()

    changed_sources: list[str] = []
    deleted_sources: list[str] = []
    ids_to_delete: list[str] = []
    records_to_upsert: list[dict[str, object]] = []

    if config_changed:
        print("Config changed since the last sync. Replacing previously indexed file records.")

    current_sources = set(current_manifest.keys())
    previous_sources = set(previous_files.keys())

    for source in sorted(previous_sources - current_sources):
        deleted_sources.append(source)
        ids_to_delete.extend(previous_files[source].get("chunk_ids", []))

    for source in sorted(current_sources):
        current_entry = current_manifest[source]
        previous_entry = previous_files.get(source)
        if config_changed or previous_entry is None or previous_entry.get("content_hash") != current_entry["content_hash"]:
            changed_sources.append(source)
            if previous_entry:
                ids_to_delete.extend(previous_entry.get("chunk_ids", []))
            records_to_upsert.extend(current_entry["records"])  # type: ignore[arg-type]

    next_state_files: dict[str, dict[str, object]] = {}
    for source, entry in current_manifest.items():
        next_state_files[source] = {
            "folder": entry["folder"],
            "filename": entry["filename"],
            "content_hash": entry["content_hash"],
            "chunk_ids": entry["chunk_ids"],
        }

    next_state = {"config": current_config_signature(), "files": next_state_files}
    return changed_sources, deleted_sources, records_to_upsert, {"state": next_state, "ids_to_delete": ids_to_delete}


def sync_once(index, state_path: Path, batch_size: int, batch_delay: float) -> bool:
    previous_state = load_state(state_path)
    current_manifest = scan_files()
    changed_sources, deleted_sources, records_to_upsert, sync_payload = build_plan(previous_state, current_manifest)
    ids_to_delete: list[str] = sync_payload["ids_to_delete"]  # type: ignore[assignment]
    next_state: dict[str, object] = sync_payload["state"]  # type: ignore[assignment]

    if not changed_sources and not deleted_sources:
        print("Vault already in sync.")
        return False

    print(f"Changed/new files: {len(changed_sources)}")
    for source in changed_sources[:10]:
        print(f"  + {source}")
    if len(changed_sources) > 10:
        print(f"  ... {len(changed_sources) - 10} more")

    print(f"Deleted files: {len(deleted_sources)}")
    for source in deleted_sources[:10]:
        print(f"  - {source}")
    if len(deleted_sources) > 10:
        print(f"  ... {len(deleted_sources) - 10} more")

    print(f"Stale ids to delete: {len(ids_to_delete)}")
    delete_ids(index, ids_to_delete)

    print(f"Records to upsert: {len(records_to_upsert)}")
    upsert_records(index, records_to_upsert, batch_size=batch_size, batch_delay=batch_delay)

    save_state(state_path, next_state)
    stats = index.describe_index_stats()
    total = stats.get("total_vector_count", "?")
    print(f"Sync complete. Pinecone now reports {total} vectors.")
    return True


def watch(index, args: argparse.Namespace) -> None:
    print(f"Watching {', '.join(FOLDERS)} every {args.poll_seconds} seconds. Press Ctrl+C to stop.")
    while True:
        print("\n--- Sync cycle ---")
        sync_once(index, args.state_path, args.batch_size, args.batch_delay)
        time.sleep(args.poll_seconds)


def main() -> None:
    args = parse_args()
    if args.bootstrap_state:
        bootstrap_state(args.state_path)
        return

    api_key = load_api_key()
    pc = Pinecone(api_key=api_key)
    index = pc.Index(INDEX_NAME)

    try:
        if args.watch:
            watch(index, args)
        else:
            sync_once(index, args.state_path, args.batch_size, args.batch_delay)
    except KeyboardInterrupt:
        print("\nStopped.")


if __name__ == "__main__":
    main()
