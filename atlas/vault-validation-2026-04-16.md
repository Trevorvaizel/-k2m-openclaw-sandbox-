---
type: ops
created: 2026-04-16
tags:
  - type/ops
---

# Vault Validation Report — 2026-04-16

**Atoms validated:** `the-seven-gaps.md`, `the-make-os.md`, `audit-agent-spec.md`, `belief-firmware-map.md`
**Validator:** Klause (subagent, vault quality gate)

---

## Per-Atom Scores

### 1. The Seven Gaps (`the-seven-gaps.md`)

| Criterion | Score | Notes |
|-----------|-------|-------|
| Frontmatter completeness | 9/10 | Has tags, aliases, created date. Clean YAML. Missing `type` tag — uses `type/atomic` which is correct. Actually this IS present. Full marks minus one: no `status` tag. |
| Bidirectional links | 7/10 | 8 wikilinks. 2 broken: `the-domain-cartographers-manifesto.md` and `k2m-layer4-product-brief.md` don't exist in atlas/. |
| Definition clarity | 10/10 | Precise. "7 precise gaps between the shipped system and the Clarity Company vision." Unambiguous. |
| Structural coherence | 10/10 | Two Rivers → 7 Gaps → Priority Order → Deeper Pattern. Excellent flow. |
| Cross-references (MOCs) | 0/10 | **Not referenced in any MOC.** Orphan. |
| Redundancy | 8/10 | Minimal. Gap descriptions are self-contained but naturally reference each other. Slight overlap with Gap 6 content and Make OS — but that's the point (Make OS closes Gap 6). |
| Orphan check | 0/10 | **ORPHAN** — no MOC entry found. |
| Tag consistency | 7/10 | `category/collision`, `force/practitioner-transformation`, `force/tacit-to-explicit` — none of these exist in vault-taxonomy.md. `category/collision` is not a valid category tag. Custom tags not in taxonomy. |

**Total: 51/80**

**Issues:**
- 2 broken wikilinks
- Orphaned (no MOC entry)
- 3 tags not in taxonomy (`category/collision`, `force/practitioner-transformation`, `force/tacit-to-explicit`)

---

### 2. The Make OS (`the-make-os.md`)

| Criterion | Score | Notes |
|-----------|-------|-------|
| Frontmatter completeness | 9/10 | Clean YAML, tags, aliases, created date. No status tag. |
| Bidirectional links | 8/10 | 7 wikilinks. 1 broken: `k2m-layer4-product-brief.md`. |
| Definition clarity | 10/10 | "The transmission between the collision engine (research) and the revenue engine (marketing)." Crisp. |
| Structural coherence | 9/10 | 5-stage pipeline → cron architecture → revenue connection. Logical. Slightly long — the cron YAML blocks are implementation details that could live in a separate spec. |
| Cross-references (MOCs) | 0/10 | **Not referenced in any MOC.** Orphan. |
| Redundancy | 8/10 | Good. Links to seven-gaps for Gap 6 instead of re-explaining. Revenue connection repeats Koe's flywheel but in service of the pipeline, so acceptable. |
| Orphan check | 0/10 | **ORPHAN** — no MOC entry found. |
| Tag consistency | 7/10 | `category/system` and `domain/content` not in taxonomy. |

**Total: 51/80**

**Issues:**
- 1 broken wikilink
- Orphaned
- 2 tags not in taxonomy

---

### 3. Audit Agent Spec (`audit-agent-spec.md`)

| Criterion | Score | Notes |
|-----------|-------|-------|
| Frontmatter completeness | 8/10 | Has tags, aliases, created date, status/draft. Uses `type/spec` — not a valid type in taxonomy. `domain/agent-design` not in taxonomy. |
| Bidirectional links | 3/10 | **No wikilinks at all.** References the seven-gaps, belief firmware, and other atoms by name but never uses `[[]]` syntax. |
| Definition clarity | 10/10 | "Surfaces belief firmware — where beliefs came from, who installed them, what they were designed to protect, whether they're still true." Precise. |
| Structural coherence | 10/10 | 10 sections + appendices. Flows from decision → purpose → timing → flow → prompt → integration → safety → context → artifact → appendices. Excellent spec structure. |
| Cross-references (MOCs) | 0/10 | **Not referenced in any MOC.** Orphan. |
| Redundancy | 8/10 | The safety section overlaps with system prompt safety rules, but this is appropriate for a spec — implementation vs. prompt separation. |
| Orphan check | 0/10 | **ORPHAN** — no MOC entry found. |
| Tag consistency | 6/10 | `type/spec`, `category/product`, `domain/agent-design` — `type/spec` and `domain/agent-design` not in taxonomy. `status/draft` has no taxonomy entry but is useful operational metadata. |

**Total: 45/80**

**Issues:**
- **Zero wikilinks** — biggest structural gap. Must add `[[]]` links to: the-seven-gaps, belief-firmware-map, the-clarity-company, agm-belief-revision, firmware-written-in-paper, k2m-layer4-product-brief, belief-audit-tool, cis-agent-orchestration
- Orphaned
- 2+ tags not in taxonomy

---

### 4. Belief Firmware Map (`belief-firmware-map.md`)

| Criterion | Score | Notes |
|-----------|-------|-------|
| Frontmatter completeness | 8/10 | Tags, aliases, created date. `concept/belief-firmware` and `concept/belief-artifact` — `belief-firmware` not in taxonomy (taxonomy has `concept/belief-artifact` and `concept/belief-gap` and `concept/belief-operations`). |
| Bidirectional links | 8/10 | 7 wikilinks. 1 broken: `k2m-layer4-product-brief.md`. |
| Definition clarity | 9/10 | "A structured reference for building context engine responses." Clear but the Definition is actually in "How to Use This Document" — there's no formal ## Definition section header. |
| Structural coherence | 10/10 | 7 artifacts, each with consistent sub-structure. Cross-artifact patterns at the end. Implementation notes. Excellent. |
| Cross-references (MOCs) | 0/10 | **Not referenced in any MOC.** Orphan. |
| Redundancy | 8/10 | Some overlap with `kenyan-student-belief-artifacts` and `firmware-written-in-paper`, but this atom is the engineering-grade reference while those are conceptual. Appropriate layering. |
| Orphan check | 0/10 | **ORPHAN** — no MOC entry found. |
| Tag consistency | 7/10 | `category/reference` not in taxonomy. `concept/belief-firmware` not in taxonomy. |

**Total: 50/80**

**Issues:**
- 1 broken wikilink
- No formal `## Definition` section header
- Orphaned
- 2 tags not in taxonomy

---

## Summary of Findings

### Broken Wikilinks

| Link | Referenced by |
|------|--------------|
| `[[the-domain-cartographers-manifesto]]` | the-seven-gaps |
| `[[k2m-layer4-product-brief]]` | the-seven-gaps, the-make-os, belief-firmware-map |

### Missing Wikilinks (atoms that should link but don't)

| Atom | Missing links |
|------|--------------|
| `audit-agent-spec` | ALL — zero wikilinks. Must link to: the-seven-gaps, belief-firmware-map, the-clarity-company, agm-belief-revision, firmware-written-in-paper, belief-audit-tool, cis-agent-orchestration |

### Orphaned Atoms (not in any MOC)

**ALL 4 atoms are orphaned.** None appear in any MOC.

Recommended MOC placements:
- `the-seven-gaps` → `moc-k2m-product.md` (primary), `moc-marketing-belief-operations.md` (secondary)
- `the-make-os` → `moc-k2m-product.md` (primary), `moc-marketing-belief-operations.md` (secondary)
- `audit-agent-spec` → `moc-k2m-product.md` (primary)
- `belief-firmware-map` → `moc-k2m-product.md` (primary), `moc-marketing-belief-operations.md` (secondary)

### Tags Not in Taxonomy

| Tag | Used by | Action |
|-----|---------|--------|
| `category/collision` | the-seven-gaps | Add to taxonomy OR change to `category/concept` |
| `category/system` | the-make-os | Add to taxonomy OR change to `category/instrument` |
| `category/reference` | belief-firmware-map | Add to taxonomy OR change to `category/concept` |
| `category/product` | audit-agent-spec | Add to taxonomy |
| `domain/agent-design` | audit-agent-spec | Add to taxonomy |
| `domain/content` | the-make-os | Add to taxonomy |
| `force/practitioner-transformation` | the-seven-gaps | Add to taxonomy as a force tag |
| `force/tacit-to-explicit` | the-seven-gaps | Add to taxonomy as a force tag |
| `concept/belief-firmware` | belief-firmware-map | Add to taxonomy |
| `type/spec` | audit-agent-spec | Add to taxonomy |
| `status/draft` | audit-agent-spec | Add as operational tag |

### Structural Issues

1. **audit-agent-spec has zero wikilinks** — the most critical fix. A spec for the 5th CIS agent must reference the seven gaps (Gap 3), belief firmware map, belief revision, and other product atoms.
2. **k2m-layer4-product-brief.md doesn't exist** — referenced by 3 of 4 atoms. Either create it or confirm the correct filename (possible `K2M product kernel.md`?).
3. **the-domain-cartographers-manifesto.md doesn't exist** — check if this is `the-cartographers-operating-system.md` or another file.

---

## Recommended Fixes (Prioritized)

### P0 — Critical (breaks lattice integrity)

1. **Add wikilinks to audit-agent-spec.md** — add `## Connections` section with `[[]]` links to: the-seven-gaps, belief-firmware-map, the-clarity-company, agm-belief-revision, firmware-written-in-paper, belief-audit-tool, cis-agent-orchestration, kenyan-student-belief-artifacts
2. **Resolve k2m-layer4-product-brief** — create the file OR update all 3 referencing atoms to point to the correct file (possibly `K2M product kernel.md`)
3. **Resolve the-domain-cartographers-manifesto** — confirm correct filename in atlas/ and update the-seven-gaps link

### P1 — Important (orphan recovery)

4. **Add all 4 atoms to moc-k2m-product.md** — these are all K2M product atoms
5. **Add belief-firmware-map to moc-marketing-belief-operations.md** — belief operations relevance
6. **Add the-seven-gaps and the-make-os to moc-marketing-belief-operations.md** — marketing/belief intersection

### P2 — Hygiene (taxonomy alignment)

7. **Update vault-taxonomy.md** with new tags that are legitimately needed: `category/collision`, `type/spec`, `concept/belief-firmware`, `domain/agent-design`, `domain/content`, `force/practitioner-transformation`, `force/tacit-to-explicit`
8. **Add `## Definition` section header** to belief-firmware-map.md (currently uses "How to Use This Document" instead)
9. **Audit audit-agent-spec tags** — `type/spec` should be added to taxonomy; `domain/agent-design` is a legitimate new domain

---

*Validation complete. All 4 atoms are structurally sound in content but all are orphaned from the MOC lattice and have taxonomy drift. The wikilink gap in audit-agent-spec is the most urgent fix.*
