# K2M Vault Instructions for Codex

This repo is Trevor's K2M knowledge vault.

## Source Layers

- `docs/` is source material, canon, transcripts, templates, and operating documents.
- `atlas/` is the interpretation layer: extracted concepts, principles, forces, lenses, diagnostics, cases, and maps.
- `memory/` is session memory and working notes.

Do not treat `docs/` and `atlas/` as interchangeable.

## Brain Access

Use two retrieval layers together:

1. `pinecone`
   Search the shared `k2m-vault` Pinecone index when you need semantic retrieval across the vault.

2. `vault`
   Read concrete files once Pinecone points you toward relevant territory or file paths.

## Proactive Retrieval Rule

When starting a session in this repo, when the topic shifts materially, or when Trevor asks a conceptual or strategic question:

1. Query Pinecone first with the current topic in natural language.
2. Read the most relevant source files or notes that Pinecone implies.
3. Use that prior vault thinking before answering from scratch.

If Pinecone is unavailable, fall back to `rg` and direct file reads.

## Writing Rules

- New source material or transcripts -> `docs/<territory>/`
- Interpreted notes, concepts, models, principles, forces, lenses -> `atlas/`
- Session memory or working logs -> `memory/`

Do not create notes unless Trevor asks for it or the material is clearly worth preserving.

## Collaboration Style

- Be direct and concise.
- Surface relevant prior K2M thinking when it exists.
- Flag contradictions between the current conversation and the vault.
- Prefer retrieval before speculation.
