# K2M Vault Sandbox

This repo stores K2M source material, atlas notes, memory logs, and the automation that keeps the shared Pinecone index in sync.

## Structure

- `docs/` source material and operating documents
- `atlas/` interpretation layer and extracted notes
- `memory/` session notes indexed alongside the vault
- `scripts/index-vault.py` incremental Pinecone sync script

## Pinecone Sync

- GitHub Actions runs `Pinecone Vault Sync` on pushes to `main` when changes touch `docs/**/*.md`, `atlas/**/*.md`, `memory/**/*.md`, `scripts/index-vault.py`, or `.github/workflows/pinecone-vault-sync.yml`.
- The workflow requires the repository secret `PINECONE_API_KEY`.
- The first CI run can be larger because the sync-state cache starts empty. Later runs restore `tmp/pinecone-index-state.json` and stay incremental.
- Local drafts are not sent to Pinecone until they are pushed, unless you run the sync locally.

## Local Commands

- One-off sync: `py -3.12 scripts/index-vault.py`
- Continuous local sync while editing: `py -3.12 scripts/index-vault.py --watch`
