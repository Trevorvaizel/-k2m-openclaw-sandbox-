---
tags:
  - type/ops
aliases:
  - Atlas Repair Report 2026-04-11
---

# Atlas Repair Report - 2026-04-11

## Summary
This report records the structural repair and extraction completion pass for the Obsidian atlas.

## Before
- Atlas Markdown files: 63
- Atomic notes: 55
- MOCs: 8
- Dead links found in HOME.md, ATLAS.md, and tlas/**/*.md: 57
- Source coverage: partial; docs/cartographer-mastery/canon/manifesto-sections had 65 directly unrepresented source files
- Taxonomy gaps: stage tags were underspecified; danger/category/mapping tags were missing

## After
- Atlas Markdown files: 535
- Atomic notes: 494
- MOCs: 31
- Coverage ledger rows: 173
- Added category folders for principles, diagnostics, phases, creeds, examples, practices, cases, strategies, paths, metrics, and programs.
- Added completion notes for missing Cartographer source files.
- Added expansion notes for Intelligence, Technologist, and Architecture/Marketing manifesto sections that were not represented by existing force notes.
- Added extraction maps for the Relationship Cartographer's Manifesto and the Statesman's Manifesto.
- Normalized source/canon placement so the manifesto sources and Statesman PDF live under docs/, while root keeps entry/config files.
- Removed empty scratch files from root: connectaddress=127.0.0.1 and untitled canvas placeholders.
- Added [[lattice]] as the concept note behind [[tool-4-lattice-method]].
- Rewrote core MOCs to include how-to-use guidance and tiered mappings.
- Added [[coverage-ledger]] as the source-to-note coverage map.
- Added [[moc-source-memos]], [[source-memo-protocol]], and [[belief-operations-transcript-set]] to govern transcript-derived knowledge.
- Added [[moc-lenses]] and [[mental-models-as-lenses]] to separate mental-model perception frames from the general lattice.
- Expanded the Great Mental Models extraction with lens updates, reusable practices, and case notes across the processed trial transcripts.
- Added scripts/validate-atlas.ps1 for structural validation.

## Validation Gate
Run:

`powershell
.\scripts\validate-atlas.ps1
`

Required pass conditions:
- 0 dead links
- 0 orphan atomic notes
- 0 unknown tags
- 0 coverage ledger issues

Final result:
- Dead links: 0
- Orphan atomic notes: 0
- Unknown tags: 0
- Coverage issues: 0
- Template warnings: 0

## Spot Checks
- Cartographer practice: [[practice-7-lattice-audit]] against [[docs/cartographer-mastery/canon/manifesto-sections/part-ix-practice-7-lattice-audit|source]].
- Cartographer metric: [[metric-5-leverage-point-accuracy]] against [[docs/cartographer-mastery/canon/manifesto-sections/part-xiv-metric-5-leverage-point-accuracy|source]].
- Intelligence non-force section: [[intel-intelligence-the-intelligence-marketing-translation]] against [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|source]].
- Technologist non-force section: [[tech-technologist-phase-6-ongoing-staying-at-the-frontier]] against [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|source]].
- Architecture marketing section: [[architecture-architecture-identity-pressure]] against [[docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework|source]].
- Relationship source family: [[moc-relationship-cartography]] against [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|source]].
- Statesman source family: [[moc-statesman-mastery]] against [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|source]].
- Mapping tiers reviewed and corrected where needed in [[moc-intelligence-expansion]], [[moc-technologist-expansion]], [[moc-cartographer-diagnostics-practices]], [[moc-cartographer-journey]], and [[moc-architecture-belief-forces]].

## Remaining Intentional Work
- Generated extraction notes are concise atlas-layer summaries, not full source reproductions.
- Cross-domain mappings are now labeled as equivalent, analogy, or adjacent where MOCs were rewritten; future notes should follow the same convention.
