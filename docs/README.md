# Docs Territory Map

`docs/` holds source material and operational documentation. The atlas in `atlas/` is the interpretation layer; do not mix the two.

## Folder Pattern

Use this shape for any territory that can receive source documents, transcripts, or working documents:

```text
docs/<territory>/
  canon/
    manifestos/
    transcripts/
  templates/
  working-notes/
```

Only create the subfolders that the territory actually needs. Canon files are treated as source material. Atlas notes should link back to canon, but canon should not be rewritten just to fit the atlas.

## Transcript Rule

Use `docs/_inbox/transcripts/` only when a transcript has not been assigned to a territory.

Once the territory is known, place it under:

```text
docs/<territory>/canon/transcripts/
```

Then create or update a source memo in:

```text
atlas/source-memos/
```

## Existing Territories

- `cartographer-mastery/` - universal mastery manifesto sections
- `intelligence-cartography/` - intelligence cartographer manifesto
- `technologist-cartography/` - AI and technologist manifesto
- `architecture-marketing/` - architecture industry belief/marketing framework
- `relationship-cartography/` - relationship cartographer manifesto
- `statesman-mastery/` - statesman mastery blueprint
- `belief-operations/` - K2M belief operations operating system and canon
- `mental-models/` - mental-model transcript sets, lenses, and case evidence sources
- `ai-proficiency/` - AI curriculum and proficiency maps
- `invisible-writing/` - invisible writing frameworks

## Agent Rule

Before extracting, identify the source role:

- manifesto or canon source
- transcript or conversation-derived evidence
- operating document
- template or reusable tool
- adjacent reference material

If the role is unclear, keep the file in `_inbox` and do not create atlas notes until it has a source memo or a coverage-ledger row.
