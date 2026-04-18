#!/usr/bin/env python3
from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path
from typing import Any
import tomllib

from mcp.server.fastmcp import FastMCP


ROOT = Path(__file__).resolve().parents[2]
INDEX_NAME = "k2m-vault"
NAMESPACE = "vault"
DEFAULT_TOP_K = 6
INTERNAL_FETCH_K = 16
RERANK_MODEL = "bge-reranker-v2-m3"
RERANK_TOP_N = 8


def load_json_file(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def ensure_pinecone():
    try:
        from pinecone import Pinecone
    except ImportError:
        subprocess.check_call([sys.executable, "-m", "pip", "install", "pinecone>=8.0.0"])
        from pinecone import Pinecone
    return Pinecone


def load_api_key() -> str:
    import os

    api_key = os.environ.get("PINECONE_API_KEY")
    if api_key:
        return api_key

    claude_mcp = Path.home() / ".claude" / "mcp.json"
    if claude_mcp.exists():
        data = load_json_file(claude_mcp)
        api_key = data.get("mcpServers", {}).get("pinecone", {}).get("env", {}).get("PINECONE_API_KEY")
        if api_key:
            return api_key

    codex_config = Path.home() / ".codex" / "config.toml"
    if codex_config.exists():
        data = tomllib.loads(codex_config.read_text(encoding="utf-8"))
        api_key = (
            data.get("mcp_servers", {})
            .get("pinecone", {})
            .get("env", {})
            .get("PINECONE_API_KEY")
        )
        if api_key:
            return api_key

    raise RuntimeError(
        "PINECONE_API_KEY is not configured. Set the environment variable or add it to "
        "~/.claude/mcp.json or ~/.codex/config.toml under the pinecone MCP server env."
    )


def get_index():
    Pinecone = ensure_pinecone()
    pc = Pinecone(api_key=load_api_key(), source_tag="k2m_brain_mcp")
    return pc.Index(INDEX_NAME)


def normalize_hit(hit: dict[str, Any]) -> dict[str, Any]:
    fields = hit.get("fields", {}) or {}
    text = fields.get("content", "")
    return {
        "id": hit.get("_id"),
        "score": hit.get("_score"),
        "source": fields.get("source"),
        "folder": fields.get("folder"),
        "filename": fields.get("filename"),
        "chunk": fields.get("chunk"),
        "total_chunks": fields.get("total_chunks"),
        "content": text,
    }


def post_filter_hits(
    hits: list[dict[str, Any]],
    folders: list[str] | None = None,
    source_contains: str | None = None,
    top_k: int = DEFAULT_TOP_K,
) -> list[dict[str, Any]]:
    normalized = [normalize_hit(hit) for hit in hits]
    if folders:
        allowed = {folder.strip().lower() for folder in folders if folder.strip()}
        normalized = [hit for hit in normalized if str(hit.get("folder", "")).lower() in allowed]
    if source_contains:
        needle = source_contains.lower()
        normalized = [hit for hit in normalized if needle in str(hit.get("source", "")).lower()]
    return normalized[:top_k]


def search_k2m_vault_impl(
    query: str,
    top_k: int = DEFAULT_TOP_K,
    folders: list[str] | None = None,
    source_contains: str | None = None,
    rerank: bool = True,
) -> dict[str, Any]:
    index = get_index()
    search_payload: dict[str, Any] = {
        "top_k": max(top_k, INTERNAL_FETCH_K),
        "inputs": {"text": query},
    }
    rerank_payload: dict[str, Any] | None = None
    if rerank:
        rerank_payload = {
            "model": RERANK_MODEL,
            "top_n": max(top_k, min(RERANK_TOP_N, INTERNAL_FETCH_K)),
            "rank_fields": ["content"],
        }

    response = index.search(namespace=NAMESPACE, query=search_payload, rerank=rerank_payload)
    if hasattr(response, "to_dict"):
        response_data = response.to_dict()
    elif isinstance(response, dict):
        response_data = response
    else:
        response_data = {}
    result = response_data.get("result", {}) if isinstance(response_data, dict) else {}
    hits = result.get("hits", []) if isinstance(result, dict) else []
    filtered_hits = post_filter_hits(hits, folders=folders, source_contains=source_contains, top_k=top_k)
    return {
        "index": INDEX_NAME,
        "namespace": NAMESPACE,
        "query": query,
        "top_k": top_k,
        "folders": folders or [],
        "source_contains": source_contains,
        "hit_count": len(filtered_hits),
        "hits": filtered_hits,
    }


mcp = FastMCP(
    name="k2m-brain",
    instructions=(
        "Deterministic semantic retrieval for Trevor's K2M vault. "
        "This server is bound to the Pinecone index 'k2m-vault' and namespace 'vault'."
    ),
    json_response=True,
)


@mcp.tool(
    name="search_k2m_vault",
    description=(
        "Search Trevor's K2M Pinecone vault using the fixed 'k2m-vault' index and "
        "'vault' namespace. Prefer this over generic Pinecone tools when retrieving K2M knowledge."
    ),
)
def search_k2m_vault_tool(
    query: str,
    top_k: int = DEFAULT_TOP_K,
    folders: list[str] | None = None,
    source_contains: str | None = None,
    rerank: bool = True,
) -> dict[str, Any]:
    return search_k2m_vault_impl(
        query=query,
        top_k=top_k,
        folders=folders,
        source_contains=source_contains,
        rerank=rerank,
    )


def self_test() -> dict[str, Any]:
    return {
        "server": "k2m-brain",
        "repo_root": str(ROOT),
        "index": INDEX_NAME,
        "namespace": NAMESPACE,
        "tool_names": ["search_k2m_vault"],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="K2M brain MCP server")
    parser.add_argument("--self-test", action="store_true", help="Print config and exit.")
    parser.add_argument("--query", type=str, help="Run a direct search and print JSON instead of starting MCP.")
    parser.add_argument("--top-k", type=int, default=DEFAULT_TOP_K, help=f"Number of hits to return. Default: {DEFAULT_TOP_K}.")
    parser.add_argument("--source-contains", type=str, default=None, help="Restrict results to source paths containing this string.")
    parser.add_argument("--folders", nargs="*", default=None, help="Restrict results to one or more top-level folders such as docs atlas memory.")
    parser.add_argument("--no-rerank", action="store_true", help="Disable reranking.")
    args = parser.parse_args()

    if args.self_test:
        print(json.dumps(self_test(), indent=2))
        return 0

    if args.query:
        result = search_k2m_vault_impl(
            query=args.query,
            top_k=args.top_k,
            folders=args.folders,
            source_contains=args.source_contains,
            rerank=not args.no_rerank,
        )
        print(json.dumps(result, indent=2))
        return 0

    mcp.run(transport="stdio")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
