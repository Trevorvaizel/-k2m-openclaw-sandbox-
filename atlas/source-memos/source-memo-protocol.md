---
tags:
  - type/ops
  - category/source-memo
aliases:
  - Source Memo Protocol
  - Transcript Extraction Protocol
---

# Source Memo Protocol

> Use source memos to keep transcript conversations from polluting canon while still letting them update the atlas.

## Why This Layer Exists
Transcripts are territory contact, not automatic doctrine. They often contain examples, revisions, repetitions, contradictions, and half-formed language. A source memo turns that raw conversation into a reviewed extraction decision before any atomic note is created or changed.

## Intake Path
1. Raw unassigned transcripts land in `docs/_inbox/transcripts/`.
2. Assigned transcript sets move under `docs/<territory>/canon/transcripts/`.
3. The agent creates or updates one source memo under `atlas/source-memos/`.
4. The agent updates [[coverage-ledger]] with the transcript rows.
5. The agent runs `scripts/validate-atlas.ps1`.

## Source Memo Template
Every `type/source-memo` note must include:

- `## Source`
- `## Parent Territory`
- `## Role`
- `## New Knowledge`
- `## Extraction Decision`
- `## Extraction Targets`
- `## Related`

## Role Vocabulary
- Derivation: the transcript expands or explains an existing manifesto.
- Evidence: the transcript provides examples, cases, or observed language.
- Extension: the transcript introduces a new concept not yet represented.
- Challenge: the transcript contradicts or weakens an existing atlas claim.
- Repetition: the transcript restates existing material without adding a new extraction target.
- Lens support: the transcript introduces or clarifies a reusable mental model that changes how the user sees multiple existing notes.

## Extraction Rules
- Do not make a transcript canonical by default.
- Do not create atomic notes for every phrase.
- Extract only when the transcript adds a durable concept, a useful diagnostic, a named mechanism, a case, a contradiction, or a stronger source-grounded example.
- Link transcript-derived notes back to the source memo and the raw transcript.
- Prefer updating an existing note when the transcript clarifies a known concept.
- Create a new note only when the concept has a stable name, a distinct mechanism, and a use case that is not already covered.
- Route mental models to `atlas/lenses/` when their main job is perception: how the user should see a territory before applying concepts, tools, or manifesto claims.

## Failure Modes
- Transcript flood: every sentence becomes a note.
- Canon drift: a conversational aside silently rewrites the manifesto.
- Lattice overload: weak analogies get linked because they sound related.
- Lens inflation: every passing book/model reference becomes a lens note even when it does not change interpretation.
- Hidden backlog: transcripts enter the vault without ledger rows.

## Related
- [[moc-source-memos]]
- [[moc-lenses]]
- [[coverage-ledger]]
- [[danger-lattice-overload]]
