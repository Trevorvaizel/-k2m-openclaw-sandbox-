# K2M Belief Operations Agent Handoff Log

This file is the current-state handoff for agents working on the K2M belief operations system.

Use it to answer:

- what is live now
- what was changed recently
- what is blocked
- what the next agent should do

## Rule

Use this file for current execution state.

Use [evolution-log.yaml](./evolution-log.yaml) for milestone history only.

Do not log speculative ideas here as if they are completed work.

## Update Protocol

- Add the newest session at the top of `Session Log`.
- Log only confirmed repo changes or confirmed live-system changes.
- Include exact task IDs, page titles, list names, or database names where possible.
- Keep next actions concrete and short.

## Current Operating Truth

- Notion is still the canonical map layer.
- ClickUp is still the execution layer.
- The repo-local `k2m-belief-ops` MCP server is now the orchestration layer across ClickUp, Notion, Apify, and Firecrawl.
- MCP is the live orchestration glue across Claude Code, Notion, ClickUp, Apify, and Firecrawl. n8n-driven sensing loops, Telegram triggers, and hosted Railway transport remain target architecture until implemented and verified live.
- The live runtime belief-operations space discovered by the local server is `K2M Marketing Intelligence`.
- `NOTION_API_TOKEN` is now configured and the local K2M server can write to the live Notion workspace.
- The student Facebook gap is no longer open. The stronger current Facebook evidence is `Facebook / YEIYO TV - KCSE 2026 pathway questions from students (direct public comments)`.
- Student audience state is `active`, but the student slice build state is still `phase1_partial`: Product Truth, Belief Map, and Topology Map are approved in Notion, but the linked `Workflow Run` and `Map Update Memo` are not review-closed and the coverage tracker is stale against the current task state.
- `evolution-log.yaml` should record major milestones, not day-to-day operating progress.
- The belief-operations doc suite has been reconciled against PRD v0.2; canon remains philosophy truth, the PRD anchors implementation scope, and this handoff log remains current-state truth.
- Several older docs and runtime claims were overstating completion. Treat older March "complete" claims as superseded unless re-verified against the stricter April standard.
- **Category strategy decided**: import play. "Thinking with AI" category exists globally, is empty in Kenya. K2M becomes the bridge node. Borrow Mollick/Hoffman/Kozyrkov/UNESCO for credibility, own the category belief ("Nobody taught you how to think through uncertainty with AI").
- **Runtime architecture framing corrected**: Claude Code + repo-local MCP + Notion + ClickUp are live layers. n8n sensing, Telegram triggers, and Railway hosting remain target runtime, not current-state truth.
- **Build order decided**: engine first (intelligence), product emerges at sales territory. Same ritual per audience, rotate after student v1 rough-complete. Development via BMAD agentic workflows.
- **10 skills** in the architecture (original 9 + `k2m-authority-intelligence`). The infrastructure layer is partially built already (`k2m-belief-ops` MCP server, KIRA Discord bot, Notion/ClickUp integration), but most named skills do not yet exist as standalone packaged runtime modules. Those still need to be built, and n8n scaffolds can still be forked for plumbing.

## Current Focus

- Close the student intelligence governance chain in live Notion and ClickUp (repair tasks `869ctznm8`, `869ctznma`).
- Use the reconciled docs as the current implementation contract before opening new build work.
- Begin building first skills: `k2m-product-truth`, `k2m-belief-audit`, `k2m-network-topology-audit`, `k2m-authority-intelligence`.
- Run sensing during April KUCCPS window — the belief landscape is hottest now.
- Fork n8n community templates as scaffolds for the sensing/acquisition layer, reshape to K2M's belief-ops taxonomy.
- Development via BMAD agentic workflows: create story → validate → test → review → iterate from reality.

## Session Log

### 2026-04-10 - Architecture package hardening and handoff cleanup

Summary:

- Hardened `_bmad-output/planning-artifacts/architecture.md` so it no longer certifies itself as `READY FOR IMPLEMENTATION`, `High` confidence, or contradiction-free.
- Reframed raw passthrough tools such as `clickup_request` and `notion_request` as admin-only/manual-repair paths rather than normal workflow escape hatches.
- Corrected the architecture package to match the repo more honestly: `tools/k2m_mcp/governance.py` exists, `tools/k2m_mcp/tests/` is a real current test tree, and adjacent slices (`k2m-landing/`, `cis-discord-bot/`) are surfaces/dependencies only when a story explicitly activates them.
- Verified the current control-plane test surface with `.\.venv\Scripts\python.exe -m pytest tools/k2m_mcp/tests -q` -> `10 passed`.
- This cleanup hardens the package, but it does not replace a fresh adversarial re-review against live runtime state.

Repo changes:

- Updated `_bmad-output/planning-artifacts/architecture.md`
- Updated `docs/belief-operations/agent-handoff-log.md`

Next actions:

1. Run a fresh adversarial review against the updated architecture package plus `k2m-runtime-state.md` and this handoff log before treating the package as a readiness signal.
2. Keep raw passthrough request tools admin-only and extend `k2m_*` helpers where operators still need routine write paths.

### 2026-04-10 - Adversarial hardening sweep on secondary docs

Summary:

- Repaired leftover contradictions found after the main PRD v0.2 reconciliation pass.
- Clarified the handoff log so implemented infrastructure is not confused with unbuilt standalone skills.
- Reframed secondary artifacts (`k2m-touchpoint-territory-audit.md`, `k2m-marketing-landscape-process-flow.md`, `k2m-adversarial-review-prompt.md`) as subordinate aids that must inherit PRD v0.2 controls.
- Marked `validation-report-2026-04-09.md` as superseded rather than leaving it in a misleading in-progress state.

Next actions:

1. Use the hardened secondary docs only through the PRD v0.2 and reconciled operating docs.
2. If any of these helper artifacts become active working docs, reconcile them again against live runtime state before reuse.

### 2026-04-10 - PRD v0.2 documentation reconciliation

Summary:

- Reconciled the belief-operations operating docs against `k2m-belief-operations-execution-prd.md` v0.2 without editing canon.
- Corrected stale claims across the docs: 10-skill inventory, Phase 0 Product Truth prerequisite, Four Forces schema, runtime stack, evidence-tier discipline, disconfirmation, external metrics, and the last-mile cascade.
- Updated the docs to distinguish target architecture from what is actually implemented in the repo today.
- Reframed the runtime-state docs to stop overstating completion and to treat student Phase 1 as partially complete unless re-verified live.

Docs reconciled and committed:

- `k2m-belief-operations-os.md`
- `k2m-skill-architecture.md`
- `k2m-live-market-intelligence-os.md`
- `k2m-notion-information-architecture.md`
- `k2m-clickup-workflow-architecture.md`
- `k2m-governance-and-map-update-protocol.md`
- `k2m-expansion-loop-architecture.md`
- `k2m-implementation-sprint-01.md`
- `k2m-tool-operating-contract.md`
- `k2m-runtime-state.md`

Implementation inventory captured in the docs:

- Repo-local MCP server is real and documented as implemented.
- KIRA Discord bot is real and documented as implemented.
- n8n sensing/distribution loops remain target architecture, not verified live runtime.
- Most named belief-ops skills remain target architecture rather than standalone implemented modules.

Next actions:

1. Update this handoff log and `evolution-log.yaml` as the final step of the reconciliation session.
2. Treat the reconciled docs plus the PRD as the source contract for the next implementation tasks.
3. Re-verify the live student slice before claiming the governance chain is closed.

### 2026-04-09 — Party Mode: Belief-Ops Implementation Planning

Summary:

Multi-agent party mode session (PM John, Saga, Victor, Quinn, Freya) to plan full implementation of the belief-operations marketing intelligence system. Three research passes completed. All major strategic and architectural decisions resolved.

#### Category & Market Strategy (DECIDED)

- **Import play**: the "thinking with AI" category exists globally (Mollick, Hoffman, Kozyrkov, Forte, Shipper) but is genuinely **empty in Kenya** — no player occupies "AI as identity transformation" for post-KCSE youth.
- K2M becomes the **bridge node** between global discourse and the Kenyan market. Borrow global authority, own the local position.
- **Category belief** (K2M's to own): "Nobody taught you how to think through uncertainty with AI."
- **Product** (K2M's to ship): identity-safe cohort → proof artifact → decision clarity. No equivalent exists anywhere.
- ALX is complementary, not competitive ("ALX teaches you to USE AI tools; K2M teaches you to THINK with AI").
- Dunford vs Lochhead resolved: neither pure. Dunford applies to product positioning (against ALX, self-study, YouTube tutorials, doing nothing). Lochhead applies to category belief framing (reframing the problem). Both operate at different altitudes.
- Key authorities to cite for borrowed credibility: Ethan Mollick (#1), Cassie Kozyrkov (decision under uncertainty), Reid Hoffman ("Superagency"), UNESCO AI Competency Framework (institutional legitimacy), Tiago Forte (methodological ancestor).

#### Runtime Architecture (DECIDED)

- **Claude Code** = cognition/skills (primary runtime now; OpenClaw evaluated in 4 weeks)
- **n8n** = event loop, sensing, scheduled scrapes, content posting automation, signal ingestion (fork community templates as scaffolds, reshape to K2M's belief-ops taxonomy)
- **MCP** = the glue between ALL technologies — Claude Code, n8n, Notion, ClickUp, Apify, Firecrawl, content platforms. Content production AND distribution will be automated via MCP integrations.
- **Notion** = maps (source of truth for belief maps, topology maps, product truth)
- **ClickUp** = moves (task execution, workflow state)
- Phone triggering via Discord (KIRA) or Telegram (n8n webhook) — requires MCP hosting on Railway
- Reference builders for pipeline patterns: Nick Saraev (practical n8n), Cole Medin (MCP + n8n integration, ottomator-agents GitHub repo), n8n Production AI Playbook
- n8n community has 889 market research templates ready to fork as scaffolds
- Estimated cost: $100-350/month

#### Skill Architecture (DECIDED)

- **10 skills** (original 9 + `k2m-authority-intelligence`):
  1. `k2m-product-truth` — Layer 0 clarity
  2. `k2m-belief-audit` — belief architecture per audience
  3. `k2m-network-topology-audit` — how belief travels
  4. `k2m-penetration-architecture` — wedge, routing, beachhead
  5. `k2m-sales-friction-walk` — commitment friction
  6. `k2m-retention-architecture` — identity deepening
  7. `k2m-referral-architecture` — transformation → advocacy
  8. `k2m-live-market-intelligence` — sensing, refresh
  9. `k2m-system-orchestrator` — cross-territory coordination
  10. `k2m-authority-intelligence` — per-audience authority feed, borrowed credibility, meta-workflow observatory
- The 10-skill inventory is fixed for PRD v0.2. Additions or replacements require an explicit PRD/governance change, not ad hoc expansion in downstream docs.
- Content creation and posting skills to be added as MCP integrations to content platforms are established.

#### Build Order (DECIDED)

- **Engine first, product when we reach the sales territory.** April is for sensing and penetration, not conversion.
- Per audience: Product Truth → Belief Audit + Topology Audit + Authority Intel → Penetration → Sales (live offer emerges HERE) → Retention → Referral → Border Diagnostics.
- **Saga's hybrid build order**: rough v1 of all territories for student audience, then rotate to audience #2 within ~4 weeks while student v2 hardens. Each audience's intelligence informs what that audience's product needs.
- The same ritual runs per audience. Updates cascade: change a belief map, downstream territories inherit.
- Fork scaffolds for technical plumbing, build custom for doctrine and strategy.
- Development uses **BMAD agentic workflows** (create story → validate → test → review cycles).

#### Design Constraints (DECIDED)

- Build custom, iterate from reality — no copying playbooks
- Modular: changes cascade through the system, no manual sync across layers
- Async-safe: skills work via dispatch/remote without live human mid-run
- Disconfirmation sub-skill: every major synthesis output gets adversarial review from a different agent context using fresh external data (anti-sycophancy)
- Kill authority: Trevor has explicit authority to reject/delete any agent output
- External reality metrics: cohort application rate (primary), DM reply rate (secondary)
- Four Forces schema (Moesta): Push/Pull/Anxiety/Habit as the typed belief schema in the MCP server

#### Research Findings (3 passes completed)

Pass 1 — Market intelligence + OpenClaw + masters + invisible forces:
- OpenClaw is real (gateway/workspace/skills/channels model, Discord/Telegram native connectors, ClawHub registry). Evaluate in 4 weeks, not now.
- MCP is the 2026 consensus orchestration substrate (10K+ servers, OAuth 2.1, adopted by OpenAI/Google/Microsoft, donated to Linux Foundation).
- Sycophancy is the #1 technical threat — LLMs structurally over-agree with their owners' doctrine. Cascading sycophancy in multi-agent chains compounds silently. Mitigated by disconfirmation sub-skill + external reality metrics + kill authority.
- Centola's 25% tipping point is conditional on reinforcement density, not reach. K2M's topology audit must model cluster reinforcement, not node count.
- CI programs fail from signal-noise discrimination failure, political capture, and drift governance — not from information scarcity.

Pass 2 — Kenya/EA landscape + global authorities + master workflows + bridge nodes:
- Kenya is **empty** (not sparse) for "thinking with AI as identity transformation." ALX, Moringa, universities all in different lanes.
- Global authority inventory mapped with translation potential per audience.
- Masters' content workflows are surprisingly low-tech (judgment + writing, not pipeline sophistication) — but this is irrelevant to K2M's pipeline design; they're individual creators, K2M is building an organizational intelligence engine.
- No bridge node currently translates Mollick-style discourse into Kenyan youth context. K2M's opportunity: BE the bridge node.

Pass 3 — Automation masters + pipeline architecture:
- Nick Saraev: practical n8n craftsman, lead enrichment patterns, Apify + n8n integration. Philosophy: clear deliverable, hot-button pain point, templateable.
- Cole Medin: MCP + n8n integration with open-source code (ottomator-agents repo). Most technically relevant for K2M's Claude Code ↔ n8n bridge.
- Production pipeline pattern: ACQUIRE → ENRICH → SYNTHESIZE → STORE → SCORE → ROUTE → REVIEW → ACT → REFRESH. Maps directly to the belief-ops operating loop.
- n8n "gatekeeper" multi-agent pattern maps to `k2m-system-orchestrator`.
- Failure modes to design against: alert fatigue (cap 35-40/day), hallucination in synthesis (ground in sources), drift (monitor scraper success rates).

#### Gaps Identified (to address in implementation)

- Student Phase 1 governance still open: repair tasks `869ctznm8`, `869ctznma` unfinished. Close before building forward.
- Signal sources may be thin in Kenya initially — first belief audit likely needs interviews/DMs more than scraping.
- Content production pipeline not yet designed — will be automated via MCP but needs to be built.
- Product modularity (kernel/shell separation for curriculum) still unresolved — blocks teacher and B2B audience products. Schedule within 4-6 weeks.
- MCP server needs hosting (Railway) before phone triggering works.
- KIRA ↔ belief-ops integration not yet specified.

#### Immediate Next Steps

1. Close student Phase 1 governance (repair tasks `869ctznm8`, `869ctznma`)
2. Build first skills: `k2m-product-truth`, `k2m-belief-audit`, `k2m-network-topology-audit`, `k2m-authority-intelligence`
3. Run sensing during April KUCCPS window (belief landscape is hottest now)
4. Build penetration territory for students
5. Development via BMAD agentic workflows: create stories, validate, test, review, iterate from reality

Repo changes:

- Updated `docs/belief-operations/agent-handoff-log.md` (this entry)

### 2026-04-08 - Adversarial Phase 1 re-review against raw live objects

Summary:

- Re-ran the adversarial review against the required repo docs plus raw live Notion pages and ClickUp tasks.
- Confirmed the core student canonical records are real and approved:
  - Product Truth `333b7a9d-6129-8066-977f-e77aa4170435`
  - Belief Map `333b7a9d-6129-81ac-a126-f464e5a31ef3`
  - Topology Map `333b7a9d-6129-8143-8a38-c4d6715f3624`
- Confirmed the closure chain is still open:
  - Workflow Run `333b7a9d-6129-8123-b378-c75d2b6bfdd5` -> `Status = In Progress`, `Owner = empty`, `Completed On = null`
  - Map Update Memo `333b7a9d-6129-818b-af71-c5fa86944289` -> `Status = Draft`, `Owner = empty`, `Reviewed By = empty`
  - ClickUp repair tasks `869cp9tj6`, `869cp9tjb`, `869cp9tj8` remain open in review state
- Confirmed the operating graph is still thin:
  - Product Truth still has empty relations for `Audience Segment`, `Belief Maps`, and `Artifacts`
  - Belief Map `Workflow Runs` relation is empty
  - Topology Map `Nodes`, `Bridges`, and workflow linkage are empty
  - Evidence page `333b7a9d-6129-81e2-b902-c9b46d227b8a` has no owner
  - ClickUp core tasks `869cp7hfu` and `869cp7hg3` still have no custom fields

Repo/runtime changes:

- Updated runtime docs:
  - `docs/belief-operations/agent-handoff-log.md`
  - `docs/belief-operations/evolution-log.yaml`
- Created corrective ClickUp tasks:
  - `869ctznm8` `PHASE 1 REVIEW REPAIR: Close student intelligence governance chain`
  - `869ctznma` `PHASE 1 REVIEW REPAIR: Backfill canonical graph ownership and relations`

Verified:

- Raw Notion fetch confirmed Product Truth / Belief Map / Topology Map are `Approved`.
- Raw Notion fetch also confirmed Workflow Run and Map Update Memo still carry pre-closure state.
- Raw ClickUp fetch confirmed `869cp7hfc`, `869cp7hfu`, and `869cp7hg3` are `complete`, while the repair tasks for intelligence closure remain open.
- The helper audit paths are not sufficient proof of closure by themselves; they pass even while the workflow governance objects remain stale.

Current blocker:

1. Phase 1 is not complete. The student slice is beyond scaffold state, but the live intelligence review/publish chain is still open.
2. The student canonical graph and ClickUp execution metadata are still thinner than the architecture docs claim.

Next actions:

1. Complete `869ctznm8` and close the live intelligence governance chain.
2. Complete `869ctznma` and backfill the missing Notion relations, owners, and ClickUp fields.
3. Refresh the coverage tracker `333b7a9d-6129-8112-84b4-d2672ef05ffb` only after the live object state matches the claim.

### 2026-03-30 - Student Phase 1 review-state completion closed live

Summary:

- Verified the live review schema in Notion and the live list-level status constraints in ClickUp before changing state.
- Advanced the live canonical review fields in Notion:
  - Product Truth `333b7a9d-6129-8066-977f-e77aa4170435` -> `Review State = Approved`
  - Belief Map `333b7a9d-6129-81ac-a126-f464e5a31ef3` -> `Review State = Approved`
  - Topology Map `333b7a9d-6129-8143-8a38-c4d6715f3624` -> `Review State = Approved`
- Added a live review trace on all three Notion pages with page-level comments documenting the review basis and outcome.
- Set Product Truth `Approver` and `Owner` to `k2m Labs` and set `Owner` on the Belief Map and Topology Map.
- Reconciled live ClickUp review state:
  - `869cp7hfc` -> `complete`
  - `869cp7hfc` custom field `Review State` -> `Approved`
  - `869cp7hfu` -> `complete`
  - `869cp7hg3` -> `complete`

Repo/runtime changes:

- Updated runtime docs:
  - `docs/belief-operations/k2m-runtime-state.md`
  - `docs/belief-operations/agent-handoff-log.md`
  - `docs/belief-operations/evolution-log.yaml`

Verified:

- `.\tools\k2m_mcp\run.cmd --self-test` passes with `notion_token: SET`
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py student-phase1-audit` returns `ok: true`
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py phase1-reconcile` returns `verdict: Complete` with `repairs: []`

Current blocker:

1. No Phase 1 blockers remain in the live audit path.

Next actions:

1. Decide whether to promote Product Truth from `Approved` to `Canonical` after a broader governance pass, rather than during Phase 1 closure.
2. Backfill stale task descriptions where they still mention the old `Draft` state so the UI copy matches the live fields.
3. Keep monitoring Facebook group/community surfaces for richer peer-to-peer topology evidence.

### 2026-03-30 - Student Phase 1 reconciled against live Notion and ClickUp

Summary:

- Confirmed `NOTION_API_TOKEN` is live and the repo-local K2M server can now read and write the canonical Notion workspace.
- Added placement-audit and stale-state audit logic to the local runtime so student Phase 1 can be checked directly from code instead of only by manual inspection.
- Ran a latest-only student Facebook pass using newest-first Facebook discovery plus the explicit-URL Facebook Apify actor.
- Verified one stronger public Facebook source with direct student voice:
  - `Facebook / YEIYO TV - KCSE 2026 pathway questions from students (direct public comments)`
  - page id: `333b7a9d-6129-81e2-b902-c9b46d227b8a`
- Reconciled the stale canonical surfaces:
  - Workflow Run `333b7a9d-6129-8123-b378-c75d2b6bfdd5`
  - Map Update Memo `333b7a9d-6129-818b-af71-c5fa86944289`
  - Coverage Tracker `333b7a9d-6129-8112-84b4-d2672ef05ffb`
- Reconciled live ClickUp task states:
  - `869cp7hfc` -> `in progress`
  - `869cp7hfu` -> `in progress`
  - `869cp7hg3` -> `in progress`
  - `869cp9tj6` -> `ready for review`
  - `869cp9tjb` -> `ready for review`
  - `869cp9tj8` -> `ready for review`

Repo/runtime changes:

- Updated modules:
  - `tools/k2m_mcp/intel_layer.py`
  - `tools/k2m_mcp/jobs.py`
  - `tools/k2m_mcp/server.py`
- Updated runtime docs:
  - `docs/belief-operations/k2m-runtime-state.md`
  - `tools/k2m_mcp/README.md`

Verified:

- `.\tools\k2m_mcp\run.cmd --self-test` passes with `notion_token: SET`
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py phase1-reconcile` now returns one repair only:
  - `Product Truth review state is still 'Draft'.`
- Live student latest-pass evidence exists in Notion and is placed in `📚 Evidence Sources`
- Workflow Run, Map Update Memo, and Coverage Tracker now reflect the current student slice rather than the stale pre-social snapshot

Current blocker:

1. Product Truth page `333b7a9d-6129-8066-977f-e77aa4170435` still has `Review State = Draft`, so Phase 1 remains partially complete instead of complete.

Next actions:

1. Assign a reviewer and advance Product Truth review state.
2. Advance Belief Map and Topology Map review states after review.
3. If richer Facebook group evidence is needed later, run the Facebook actor only on explicit public URLs and keep private-group discoveries as watch items rather than counted evidence.

### 2026-03-30 - Doctrine scoring and operating contract added to the universal MCP layer

Summary:

- Added doctrine-derived signal scoring for belief audits and topology audits under `tools/k2m_mcp/signal_rules.py`.
- Added optional Tavily support plus a collector registry so new providers are added through one extension path instead of ad hoc code.
- Added an operating-contract layer so agents can query what each tool is for, what it should look for, and what write checklist it must follow.
- Propagated the same doctrine and execution checklists into newly generated ClickUp task descriptions and newly generated Notion record bodies.
- Hardened `k2m_intel_run_map_update` so it skips Notion writes cleanly when `NOTION_API_TOKEN` is missing instead of failing mid-run.

Repo/runtime changes:

- New modules:
  - `tools/k2m_mcp/signal_rules.py`
  - `tools/k2m_mcp/operating_contract.py`
- Updated modules:
  - `tools/k2m_mcp/common.py`
  - `tools/k2m_mcp/intel_layer.py`
  - `tools/k2m_mcp/server.py`
  - `tools/k2m_mcp/jobs.py`
  - `tools/k2m_mcp/README.md`
- Updated runtime docs:
  - `docs/belief-operations/k2m-runtime-state.md`
  - `docs/belief-operations/k2m-tool-operating-contract.md`

Verified:

- `compileall` passes for `tools/k2m_mcp`
- `.\tools\k2m_mcp\run.cmd --self-test` passes
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py collectors` runs
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py audit-targets student` runs
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py operating-contract` runs
- a live `run_audience_collection('student', limit=1)` pass now returns doctrine signal coverage and missing audit targets
- `format_k2m_task_description(...)` now renders execution and doctrine sections
- `notion_contract_sections('evidence_source', 'student')` now builds canonical checklist blocks for generated records

Current blockers:

1. `NOTION_API_TOKEN` is still empty in `.env.mcp`, so the reviewed Notion write path remains inactive.
2. `TAVILY_API_KEY` is still missing, so the Tavily discovery and site-map layer is coded but inactive.
3. Topology scoring is still heuristic. It is stronger than before, but not a full graph-analysis system.
4. Older ClickUp tasks and older Notion records are not yet backfilled with the new checklist sections.

Next actions:

1. Add `NOTION_API_TOKEN` and `TAVILY_API_KEY`.
2. Move the same doctrine checklists into ClickUp task templates and Notion record templates so internal operators see them in the UI as well as through MCP.
3. Run the teacher, student, and B2B map-update flows with real target URLs and reviewed evidence writing enabled.

### 2026-03-30 - Universal MCP layer implemented for Codex and Claude Code

Summary:

- Replaced the minimal local MCP wrapper with a modular K2M orchestration server under `tools/k2m_mcp`.
- Added K2M-specific Notion write and discovery tools using a dedicated `NOTION_API_TOKEN` path.
- Added ClickUp runtime helpers for task listing, task search, live status discovery, and status-normalized task closing.
- Added audience-specific intelligence collection tools for student, teacher, and B2B slices plus a shared end-to-end `k2m_intel_run_map_update`.
- Added a shared CLI runner `tools/k2m_mcp/jobs.py` so CLI jobs and MCP tools use the same logic.
- Updated project-scoped MCP config so the repo now declares both the local `k2m-belief-ops` server and the official Notion MCP.
- Added runtime visibility documentation in `docs/belief-operations/k2m-runtime-state.md`.

Repo/runtime changes:

- Local MCP modules created:
  - `tools/k2m_mcp/common.py`
  - `tools/k2m_mcp/clickup_layer.py`
  - `tools/k2m_mcp/notion_layer.py`
  - `tools/k2m_mcp/intel_layer.py`
  - `tools/k2m_mcp/jobs.py`
- Existing local MCP entrypoint replaced:
  - `tools/k2m_mcp/server.py`
- Project MCP config updated:
  - `.mcp.json` now includes local `k2m-belief-ops` and remote `notion`
- Env contract updated:
  - `.env.mcp.example` now includes `NOTION_API_TOKEN`, `K2M_NOTION_HUB_TITLE`, and `K2M_DEFAULT_GEOGRAPHY`
- Runtime visibility docs updated:
  - `docs/belief-operations/k2m-runtime-state.md`
  - `docs/belief-operations/README.md`

Verified:

- `compileall` passes for `tools/k2m_mcp`
- `.\tools\k2m_mcp\run.cmd --self-test` passes
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py phase1-status` runs
- `.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py phase1-reconcile` runs
- non-writing student collection pass through Firecrawl discovery succeeds

Current blockers:

1. `NOTION_API_TOKEN` is still empty in `.env.mcp`, so the new K2M Notion write path is not active yet.
2. Social comment collection still needs concrete target URLs when a platform actor cannot infer the right public post/thread.
3. The intelligence layer is structurally operational but still not fully driven by doctrine-derived signal rules.

Next actions:

1. Add the Notion integration token and share the `K2M Belief Operations` page with that integration.
2. Encode doctrine-derived signal rules so collection is scored against belief, identity, topology, trust, timing, and proof criteria.
3. Use the new `k2m_intel_run_map_update` and `k2m_notion_*` tools to complete the remaining student, teacher, and B2B evidence gaps.

### 2026-03-30 - Second intelligence pass: E3 upgrade, multi-audience crawls, Apify + Firecrawl production

Summary:

- Ran Apify TikTok Comments Scraper (actor `BDec00yAmCm1QbMEI`) on 3 Leah Sagini KUCCPS videos — returned 90 real student voice comments.
- Ran Apify YouTube Comments Scraper (actor `streamers~youtube-comments-scraper`) on 3 KCSE 2025 result videos — low comment count (news videos), not useful.
- Ran Firecrawl on Rest of World teacher shortage AI article, Citizen Digital 722K article, Tuko Nandwa Isaac influencer article.
- Ran WebSearch + WebFetch for teacher and B2B audience signals.
- Created 6 new Evidence Source records in Notion (total in set: 9 — see below).
- Upgraded Product Truth Registry Evidence Tier: E2 Repeated → E3 Reviewed Pattern.
- Playwright used to navigate YouTube and TikTok directly to extract real URLs for Apify runs.

Key intelligence findings (second pass):

- **E3 confirmed for student beachhead:** 90 TikTok comments from real Form 4 leavers contain direct self-verdicts: "Niko confused nisaidie", "sijui kabisa", "Nataka mentor", "nime kosa course". Grade anxiety from C+, B-, D+ students. 2021 leaver who missed entry due to fees — direct evidence of the long untraced tail.
- **Teacher audience signal (E2):** Kenyan teachers self-teaching AI, only a handful experimenting. 65% schools no internet. Teacher quote: "AI is a good tool but we cannot rely on it 100%." Teacher identity barrier ("AI is something others use, not me") is present but not yet confirmed at E3.
- **B2B audience signal (E2):** SAP Africa 2025 — all orgs expect AI skills gap; 90% report negative impacts; training frequency up but budget declined. No direct worker voice yet.
- **Topology data confirmed (hard data):** Citizen Digital: 722,511 of 993,226 candidates (72.8%) missed university entry in 2025. Slightly worse than 2024 (719,110). Beachhead segment is structurally stable and worsening year on year.
- **Influencer node topology:** Leah Sagini (TikTok, 40.6K followers, 1.4M likes) = trusted advisor node for Form 4 leavers in course decision window. Nandwa Isaac (Facebook) = community support node for D/E grade students. Both are active K2M-adjacent topology nodes.
- **AI is absent from student comments:** None of the 90 TikTok comments mention AI. This confirms K2M's intervention targets upstream decision confusion, not AI adoption directly. The Leah Sagini AI-replacing-careers framing is creator voice, not yet organic student voice.

Notion records created (this session):

- Evidence Source 5 — Leah Sagini TikTok/Tuko (Social): https://www.notion.so/333b7a9d61298197a04ec9e4ac1d0cb6
- Evidence Source 6 — EducationNews Form 4 Emotions (Website): https://www.notion.so/333b7a9d612981c4b323c8674cbdc88b
- Evidence Source 7 — Rest of World Teacher AI Adoption (Website): https://www.notion.so/333b7a9d61298131af82f21b9496775b
- Evidence Source 8 — SAP Africa B2B AI Skills Gap (Website): https://www.notion.so/333b7a9d612981058f25d76524f0819d
- Evidence Source 9 — TikTok Comments Leah Sagini (Community, E3): https://www.notion.so/333b7a9d612981aabb44d8a7094fc8ac
- Evidence Source 10 — Citizen Digital 722K Hard Data (Website): https://www.notion.so/333b7a9d61298105a111df2a45014285
- Evidence Source 11 — Nandwa Isaac Facebook D/E Students (Social): https://www.notion.so/333b7a9d612981bab57feba9405852c9

Apify run IDs (for reference):

- YouTube comments attempt 1 (search URLs, no results): Run `JpTxVnx2MgrY3XiMN`
- YouTube comments attempt 2 (3 KCSE news videos, minimal results): Run `9LUZhadPMAXutomEh`
- TikTok comments (Leah Sagini, 90 results, E3): Run `fnkThHs3NtFuuJXht`, Dataset `VGNcs9eyCueEpjJfq`
- Facebook comments (Citizen TV post, mostly spam): Run `ZSNqa9FywF3EJoSd9`

Current Phase 1 truth table (updated):

| Component | Status |
|---|---|
| Product truth | E3 Reviewed Pattern — student beachhead. Teacher and B2B at E2. |
| ClickUp execution | partially operational — tasks assigned, in progress |
| Notion canonical layer | operational — 11 Evidence Sources, 1 Workflow Run, 1 Map Update Memo, Product Truth populated |
| Live intelligence loop | partially operational — 2 cycles run manually, not on recurring cadence |
| Coverage tracking | operational |

What still requires manual action:

1. Assign a named reviewer (≠ Trevor Richard) to task 869cp7hfc and advance Review State Draft → Approved.
2. Close fix tasks 869cp9tj6, 869cp9tj8, 869cp9tjb manually (status API mismatch).
3. Put intelligence cycle on weekly recurring cadence.
4. Run Facebook comments on a better post (Facebook group for KCSE 2025 candidates has richer student voice — find group URL and run Apify actor `us5srxAYnsrkgUv2v`).
5. Find direct teacher voice source for E3 on teacher segment (self-verdict: "my students are ahead of me" not yet captured in direct voice).
6. Find direct employee/worker voice for E3 on B2B segment.

Next agent should read:

1. This handoff log
2. Coverage tracker: https://www.notion.so/333b7a9d6129811284b4d2672ef05ffb
3. TikTok E3 source (90 student comments): https://www.notion.so/333b7a9d612981aabb44d8a7094fc8ac
4. Product Truth (now E3): https://www.notion.so/333b7a9d61298066977fe77aa4170435

### 2026-03-30 - First intelligence cycle + Notion/ClickUp production population

Summary:

- Ran 5 WebSearch discovery queries + 2 WebFetch extractions against the student beachhead.
- Populated all Notion databases that were previously blank.
- Updated ClickUp task states to reflect actual progress.

Notion records created:

- Product Truth Registry record FULLY POPULATED: https://www.notion.so/333b7a9d61298066977fe77aa4170435
  - All 7 canonical statements, Evidence Tier = E2, Review State = Draft, Next Review = 2026-04-06
- Evidence Source 1 — Career Guidance Failure (Qazini): https://www.notion.so/333b7a9d612981abac45dc005e262216
- Evidence Source 2 — Post-KCSE Passivity Gap (EducationNews): https://www.notion.so/333b7a9d612981048292d1656fc2e972
- Evidence Source 3 — KUCCPS Dropout 700k+ (gov data): https://www.notion.so/333b7a9d61298154a1fbf493bfab65ab
- Evidence Source 4 — Competitor Landscape Tool-first: https://www.notion.so/333b7a9d61298167bb8bf53682a442c6
- Map Update Memo — First Signal Pass: https://www.notion.so/333b7a9d6129818baf71c5fa86944289
- Workflow Run — Beachhead Market Entry: https://www.notion.so/333b7a9d61298123b378c75d2b6bfdd5
- Coverage Tracker page: https://www.notion.so/333b7a9d6129811284b4d2672ef05ffb

ClickUp changes:

- Task 869cp7hfc: status → In Progress. Description updated with Notion links and corroboration summary.
- Subtask 869cp9q7x (Publish to Notion): closed.
- Tasks 869cp7hfu and 869cp7hg3: assigned to Trevor Richard, descriptions updated with topology priority (untraced 700k C–E segment).
- Fix tasks 869cp9thv, 869cp9tj6, 869cp9tj8: descriptions updated with completion notes and Notion links (mark closed manually — status API mismatch).
- Border list Truth→Territory added to 05 Border Repairs: list 901216747417.

Key intelligence finding:

700,000+ Form 4 leavers with grades C–E are untraced by government and unreachable through institutional channels. This is the largest beachhead segment. Topology audit must start here, not with the university-track C+ population.

Current Phase 1 truth table (updated):

| Component | Status |
|---|---|
| Product truth | partially operational — Draft, awaiting human review/approval |
| ClickUp execution | partially operational — tasks assigned, in progress, linked to Notion |
| Notion canonical layer | partially operational — Product Truth, 4 Evidence Sources, 1 Workflow Run, 1 Map Update Memo populated |
| Live intelligence loop | partially operational — first cycle complete, not yet on recurring cadence |
| Coverage tracking | operational — Notion page live |

What still requires manual action:

1. Assign a named reviewer (≠ Trevor Richard) to task 869cp7hfc and advance Review State to Approved.
2. Close fix tasks 869cp9tj6, 869cp9tj8, 869cp9tjb manually (status API mismatch).
3. Run Apify + Firecrawl second intelligence pass to find community/social source with direct student voice (upgrades E2 → E3). API keys now available.
4. Run belief audit (869cp7hfu) and topology audit (869cp7hg3).

Next agent should read:

1. This handoff log
2. Coverage tracker: https://www.notion.so/333b7a9d6129811284b4d2672ef05ffb
3. Map Update Memo: https://www.notion.so/333b7a9d6129818baf71c5fa86944289

### 2026-03-30 - Adversarial Phase 1 review executed

Summary:

- Ran full adversarial review against Phase 1 requirements using live MCP inspection of ClickUp and Notion.
- Phase 1 verdict: **Not complete.**

Live system findings:

- Notion Product Truth Registry record exists but every field is blank (title only, no canonical statements, no owner, no evidence tier, no review dates, no page body).
- Notion Workflow Runs: 0 records.
- Notion Evidence Sources: 0 records.
- Notion Map Update Memos: 0 records.
- Notion Border Issue Log: 0 records.
- ClickUp K2M Marketing Intelligence space: 4 tasks total, all "to do", 3 with no assignee.
- ClickUp 06 Live Intelligence folder: 0 tasks. No intelligence cycle has run.
- No marketing-intelligence coverage tracker exists anywhere.
- 05 Border Repairs was missing the Truth-Territory Border list (now created: list `901216747417`).

Corrective ClickUp tasks created:

- `869cp9thv` — Populate Notion Product Truth Registry record (Product Truth Updates)
- `869cp9tj6` — Run first live intelligence cycle (Map Update Runs)
- `869cp9tj8` — Build marketing-intelligence coverage tracker (Workflow Maintenance)
- `869cp9tjb` — Seed first Workflow Run record in Notion (Review Queue)

Claims downgraded by this review:

- "Seeded the first Notion record" → record exists with title only; all fields are blank.
- "Live system hardening" → initial scaffolding and configuration; no content in any live system.
- `notion_bootstrap: status: completed` in evolution-log → changed to `schema-created`; databases exist but are empty.

Current Phase 1 truth table:

| Component | Status |
|---|---|
| Product truth | scaffold only |
| ClickUp execution | scaffold only |
| Notion canonical layer | scaffold only |
| Live intelligence loop | absent |
| Coverage tracking | absent |

Next actions:

1. Complete `869cp9thv`: populate all fields in the Notion Product Truth Registry record.
2. Complete `869cp9tj6`: run one Tavily discovery query, create Evidence Source and Map Update Memo records.
3. Complete `869cp9tjb`: create Workflow Run record in Notion linked to Product Truth record.
4. Complete `869cp9tj8`: create the coverage tracker page.
5. Advance ClickUp task `869cp7hfc` through review (Draft → In Review → Approved) once Notion record is populated and a named reviewer is assigned.

### 2026-03-30 - Adversarial review prompt and Sprint 01 added

Summary:

- Added a reusable adversarial-review prompt so agents can test whether Phase 1 is actually complete.
- Condensed the broad belief-operations design into one first implementation sprint.

Artifacts created:

- `docs/belief-operations/k2m-adversarial-review-prompt.md`
- `docs/belief-operations/k2m-implementation-sprint-01.md`

What changed in the operating model:

- Agents now have one explicit prompt for stress-testing system maturity.
- Agents now have one explicit Sprint 01 that pulls across product truth, live intelligence, Notion, ClickUp, governance, and coverage tracking.

Recommended next action:

1. Run one adversarial review against Sprint 01 instead of debating completion abstractly.

### 2026-03-30 - Live system verification and handoff ledger added

Summary:

- Verified live ClickUp and Notion access through MCP.
- Confirmed that deeper ClickUp configuration still requires UI automation.
- Created this handoff ledger so future agents can see the current operating state without guessing.

Live systems touched:

- ClickUp workspace: `K2M Internal OS`
- ClickUp folder/list: `00 Upstream Truth > Product Truth Updates`
- ClickUp task: `869cp7hfc` `Lock Product Truth - Student Beachhead (Layer 0)`
- Notion database: `Product Truth Registry`
- Notion record: `Student Beachhead - Layer 0 Product Truth`

Confirmed state:

- ClickUp MCP can read, search, and update live tasks and lists.
- The currently loaded ClickUp MCP surface does not cover deeper schema/view/dashboard setup.
- Notion MCP can fetch and inspect the live database schema and views.
- The currently loaded Notion MCP surface is reliable for fetch/search/query, but live record editing may still require UI work depending on the tool namespace loaded in-session.

Live changes already made:

- Added `Review State` and `Next Review` to the live ClickUp working slice.
- Set `Review State` to `Draft` on task `869cp7hfc`.
- Set `Next Review` to `2026-04-06` on task `869cp7hfc`.
- Assigned task `869cp7hfc` to Trevor Richard.
- Created subtask `869cp9q7j` `Fill Product Truth Sheet template`
- Created subtask `869cp9q7x` `Publish to Notion Product Truth Registry`
- Created subtask `869cp9q8h` `Review bridge identity for teacher audience`
- Created subtask `869cp9q93` `Review bridge identity for B2B audience`
- Seeded the first Notion record in `Product Truth Registry`: `Student Beachhead - Layer 0 Product Truth`

Known gaps:

- The belief-operations ClickUp layer is still structurally thin compared with the mature CRM area.
- The Notion databases exist, but most operating records are still missing.
- Marketing-intelligence completion is not yet tracked with one live scorecard.
- `Workflow Runs`, `Map Update Memos`, `Evidence Sources`, and `Border Issue Log` need first real records.

Next actions:

1. Build a live marketing-intelligence coverage tracker.
2. Normalize `06 Live Intelligence` into a real execution surface.
3. Seed the first `Workflow Run`, `Map Update Memo`, and `Evidence Source`.
4. Replicate the anchor-task pattern beyond product truth into the next active workflow.

## What The Next Agent Should Read

1. [README.md](./README.md)
2. [k2m-belief-operations-os.md](./k2m-belief-operations-os.md)
3. [k2m-implementation-sprint-01.md](./k2m-implementation-sprint-01.md)
4. [k2m-adversarial-review-prompt.md](./k2m-adversarial-review-prompt.md)
5. [k2m-live-market-intelligence-os.md](./k2m-live-market-intelligence-os.md)
6. [k2m-clickup-workflow-architecture.md](./k2m-clickup-workflow-architecture.md)
7. this handoff log
