# Product Requirements Document - K2M Belief Operations Execution System

**Status:** Draft 0.2  
**Author:** K2M  
**Date:** 2026-04-09  
**Last Edited:** 2026-04-10  
**Edit History:** v0.2 — adversarial review rewrite anchoring PRD to decided strategy, runtime architecture, skill inventory, and external success metrics; v0.2.1 — blocker-remediation pass separating live vs target runtime, tightening governance vocabulary, and correcting scope/maturity language

---

## 1. Executive Summary

K2M is executing an import play: the "thinking with AI" category exists globally (Mollick, Hoffman, Kozyrkov, UNESCO) but is genuinely empty in Kenya. No player occupies "AI as identity transformation" for post-KCSE youth. K2M becomes the bridge node between global discourse and the Kenyan market.

**Category belief** (K2M's to own): "Nobody taught you how to think through uncertainty with AI."

**Product** (K2M's to ship): identity-safe cohort → proof artifact → decision clarity. No equivalent exists in Kenya.

To own this position, K2M needs an internal operating product that turns belief architecture into repeatable market action — not campaigns or content plans, but a system that senses what an audience believes, maps how that belief travels, and routes execution against reality.

> **The K2M Belief Operations Execution System is the internal intelligence engine that moves one audience from product truth through belief audit, topology mapping, penetration, sales, retention, and referral — then repeats that loop reliably for the next audience.**

The target system is organized around 10 custom skills on Claude Code (cognition) + MCP (orchestration glue) + Notion (maps) + ClickUp (moves), with n8n reserved for target sensing/event-loop automation. The repo currently contains only partial MCP support and no standalone skill packages.

The MVP is the **student beachhead in Kenya**, timed to the April 2026 KUCCPS window when student belief signals are hottest.

Teacher, principal, and B2B audiences are expansion releases gated by evidence, operating maturity, and successful completion of the student loop.

---

## 2. Problem

K2M has strong doctrine, a partial live student slice in Notion and ClickUp, and a local MCP orchestration layer. What it lacks:

1. **No single product contract.** The operational loop is described across 8+ documents. Agents and operators infer what to do next instead of following a defined path.
2. **Documentation theater risk.** The system could produce increasingly polished documents while the actual operating loop remains broken.
3. **Premature expansion risk.** Without explicit gates, audience expansion could begin before the student loop is genuinely repeatable.
4. **Student audience is live, but the student slice is still in review closure.** April 8 re-review confirmed: Product Truth relations empty, Belief Map workflow linkage empty, Topology Map nodes/bridges empty, Workflow Run and Map Update Memo unclosed, Evidence page unowned, ClickUp tasks missing custom fields.

---

## 3. Product Definition

### 3.1 Product Name

K2M Belief Operations Execution System

### 3.2 Product Type

Internal intelligence engine for belief sensing, territory mapping, execution routing, and governance. Not a dashboard or CRM — a system that thinks about markets.

### 3.3 Live Runtime

This is the authoritative live runtime for MVP work. If another document describes more than this, treat the extra layer as target architecture until it is verified.

| Layer | Technology | Role |
|-------|-----------|------|
| Operator clients | Claude Code, Codex | Human/agent operator surfaces bound to the same repo and control-plane contract |
| Control plane | repo-local MCP (`tools/k2m_mcp`) | Shared orchestration and tool surface for belief-ops work |
| Maps | Notion | Reviewed maps, memos, evidence, and governance state |
| Moves | ClickUp | Execution tasks, review queues, and repair workflows |
| Collection providers | Apify, Firecrawl, optional Tavily | Candidate signal collection routed through MCP tools |

Phone triggering is not part of live runtime. Hosted MCP is not part of live runtime. n8n is not part of live runtime.

### 3.4 Target Runtime

| Layer | Technology | Role |
|-------|-----------|------|
| Sensing automation | n8n | Scheduled scrapes, signal ingestion, webhook triggers, and later distribution automation |
| Phone triggering | Discord KIRA / Telegram webhook | Remote trigger surfaces for future sensing and distribution loops |
| Hosting | Railway | Target hosting for the MCP server and related runtime glue |
| Packaged skills | 10 named skill packages | Future packaged runtime modules for the canonical skill inventory |

Reference builders for pipeline patterns: Nick Saraev (practical n8n), Cole Medin (MCP + n8n integration, ottomator-agents repo). Fork scaffolds for plumbing, build custom for doctrine and strategy.

### 3.5 Authoritative Vocabulary

The following terms are authoritative across the belief-operations stack:

| Term | Values | Meaning |
|------|--------|---------|
| `evidence_tier` | `E0`, `E1`, `E2`, `E3`, `E4` | Evidence strength only. Canonical status is separate. |
| `review_state` | `draft`, `in_review`, `approved` | Human review lifecycle for governed records. |
| `canonical_state` | `candidate`, `canonical`, `deprecated` | Governance outcome for reviewed records after review. |
| `audience_state` | `hypothesis`, `researching`, `activation_ready`, `active`, `expansion_ready`, `dormant`, `retired` | Market lifecycle axis for an audience. |
| `slice_build_state` | `not_started`, `phase0_incomplete`, `phase0_complete`, `phase1_partial`, `phase1_complete` | Implementation axis for one audience slice. |

`audience_state` and `slice_build_state` are separate axes. Do not compress them into phrases like "partially complete." An audience can be `active` while its slice is still `phase1_partial`.

### 3.6 Product Thesis

If K2M can run one reviewed, repeatable audience loop from Layer 0 truth through live intelligence, canonical map updates, and downstream execution, then K2M can expand to new audiences without reinventing the process each time.

### 3.7 Canonical Product Outcome

The system must allow K2M to answer, at any point:

- what is true for the current audience
- what changed recently
- what work should happen next
- what remains stale, weak, or unproven

---

## 4. Goals

### 4.1 Primary Goals

1. Make the student audience loop genuinely repeatable end-to-end: product truth → belief audit → topology audit → penetration → sales → retention → referral → border diagnostics.
2. Build and validate the 10-skill target inventory as the system's executable spine.
3. Connect product truth, belief maps, topology maps, and evidence into one operating graph in Notion with full relations.
4. Route approved map changes into ClickUp execution tasks without inventing workflow mid-run.
5. Make coverage, freshness, and cadence visible at a glance. Make governance debt impossible to hide.
6. Prove the loop is reusable before expanding to teachers, principals, or B2B.

### 4.2 Non-Goals

- Full rollout across all audiences simultaneously
- Complete automation of data collection or distribution (human review remains the gate)
- Public-facing marketing campaign plan (that's a downstream output of penetration architecture)
- Final product design for teacher, principal, or B2B offers
- Building every content-production workflow now (content MCP integrations come after sensing is operational)

---

## 5. Why Now

1. **KUCCPS timing window.** April 2026 placement results create peak student anxiety. Belief signals are hottest now — sensing and penetration work is time-sensitive.
2. **Enough structure to drift.** The system has enough doctrine that operating without a PRD becomes a real execution risk: overbuild architecture, under-close workflows, expand before the loop is stable.
3. **Partial student slice demands closure, not expansion.** The April 8 re-review proved the student governance chain is still open. Building forward without closing backward compounds governance debt.

---

## 5A. Skill Architecture

The target system is organized around 10 skills. Each skill is a discrete capability with defined inputs, outputs, and doctrine references. Skills are the target contract — they are what the system is supposed to do, not just what it stores.

| # | Skill | Purpose | Core Inputs | Core Outputs |
|---|-------|---------|-------------|-------------|
| 1 | `k2m-product-truth` | Lock Layer 0 clarity for one audience | Product brief, JTBD, cohort evidence | Product identity, bridge identity, category belief, product belief, payoff line |
| 2 | `k2m-belief-audit` | Map belief architecture per audience | Audience segment, interviews, comments, market signals | Belief audit (Four Forces schema), self-verdicts, failed promises, awareness stage, open loops |
| 3 | `k2m-network-topology-audit` | Map how belief travels | Audience graph, creator ecosystem, share patterns, community signals | Cluster map, maven map, connector map, bridge nodes, threshold bands, cascade risks |
| 4 | `k2m-penetration-architecture` | Turn territory truth into market-entry design | Product truth, belief audit, topology audit | Wedge, category belief system, product belief system, routing plan, beachhead plan |
| 5 | `k2m-sales-friction-walk` | Diagnose commitment friction | Landing pages, DMs, FAQs, funnel data | Trust gradient audit, objection map, friction walk, handoff fixes |
| 6 | `k2m-retention-architecture` | Design identity deepening and first value | Onboarding flow, cohort prompts, community data | First-value threshold, defining moments map, weekly identity progression, dropout interventions |
| 7 | `k2m-referral-architecture` | Turn transformation into advocacy | Artifacts, alumni stories, sharing behavior | Referral story kit, advocacy moments, bridge-crossing assets, weak-tie plan |
| 8 | `k2m-live-market-intelligence` | Keep the map current | Search, scrape, competitor, first-party, community data | Map update memo, narrative shifts, topology shifts, timing windows, alerts |
| 9 | `k2m-system-orchestrator` | Coordinate workflows and borders | Outputs from all other skills | Prioritized backlog, workflow routing, border diagnosis, next-step plan |
| 10 | `k2m-authority-intelligence` | Per-audience authority feed and borrowed credibility | Global authority corpus, audience context, meta-workflow observatory | Authority translation briefs, credibility assets, citation recommendations |

### Skill Design Constraints

- **Skills are built when the build order reaches their territory, not before.** The inventory above defines the target architecture. Each skill is created, validated, and tested as its phase begins — not as a batch upfront.
- The 10-skill inventory above is the target implementation contract for PRD v0.2. Any change to that inventory requires an explicit PRD/governance update rather than silent drift.
- Content creation and posting skills will be added as MCP integrations to content platforms are established.
- Fork n8n community templates as scaffolds for sensing/acquisition plumbing. Reshape to K2M's belief-ops taxonomy.
- All skills must be async-safe: operable via dispatch/remote without live human mid-run.
- Every skill reads current state from Notion at invocation time. No cached stale state.

### Belief Data Model: Four Forces Schema (Moesta)

Every belief audit output uses the Four Forces schema as the typed belief structure:

| Force | Definition | Example (Student) |
|-------|-----------|-------------------|
| **Push** | Pain with current state driving change | "I finished KCSE and have no idea what to do next" |
| **Pull** | Attraction toward the new state | "People who think with AI seem to have clarity I don't" |
| **Anxiety** | Fear of the new state | "What if I'm not smart enough for AI?" |
| **Habit** | Comfort with the current state | "Everyone around me is just applying to university, so I will too" |

This schema is enforced in the MCP server's typed belief objects and in every belief map produced by `k2m-belief-audit`.

---

## 6. Users And Jobs

### 6.1 Primary Internal Users

#### System Orchestrator

Needs to know:

- which audience is active
- which workflow is currently running
- what is blocked
- which downstream tasks must be created or updated

#### Product Truth Architect / PM

Needs to:

- lock Layer 0 truth for an active audience
- distinguish fixed truths from hypotheses
- prevent downstream work from drifting off product truth

#### Belief Cartographer / Research Operator

Needs to:

- collect live signals
- produce evidence-backed belief updates
- publish reviewed belief and topology objects

#### Reviewer / Governance Owner

Needs to:

- verify evidence quality
- approve or reject canonical changes
- close stale governance objects

#### Execution Operator

Needs to:

- see what actions are required because the map changed
- run workflow tasks in ClickUp
- trace work back to a Notion record or memo

### 6.2 Secondary Subjects

These are the market audiences the system maps and serves:

- students
- teachers
- principals / school leaders
- B2B teams and organizations

The MVP only operationalizes the first.

---

## 7. Product Principles

1. Truth before tactics. Product truth before territory truth. Territory truth before message optimization.
2. Notion stores maps. ClickUp runs moves. MCP glues everything.
3. No canonical statement without linked evidence, ownership, and review dates.
4. Do not activate the next audience before the current audience loop is truly repeatable.
5. Human review remains required before canonical updates. Agent confidence is not evidence.
6. Build custom, iterate from reality. Research is input, not a playbook to copy. Masters are references, not templates.
7. Fork scaffolds for plumbing, build custom for doctrine and strategy. n8n templates are plumbing. The belief-ops taxonomy is doctrine.
8. Disconfirmation before canonical promotion. Every major synthesis output gets adversarial review from a different agent context.
9. Modular cascade: when a belief map updates, downstream territories inherit. No manual sync across layers.
10. Kill authority: Trevor can reject or delete any agent output at any time.
11. External reality is the final judge. If cohort application rate and DM reply rate don't move, the system is producing elegant nonsense.

---

## 8. Current-State Baseline (As Of April 8, 2026 Re-Review)

**What exists:**
- Student Product Truth `333b7a9d-...0435` — Approved, but Audience Segment / Belief Maps / Artifacts relations empty
- Student Belief Map `333b7a9d-...31ef3` — Approved, but Workflow Runs relation empty
- Student Topology Map `333b7a9d-...3624` — Approved, but Nodes / Bridges / workflow linkage empty
- Evidence Source (YEIYO TV) `333b7a9d-...7b8a` — exists, no owner
- Local MCP server operational with Notion and ClickUp access
- Coverage tracker exists but stale against live state

**What is broken:**
- Workflow Run `333b7a9d-...bfdd5` — Status=In Progress, Owner=empty, Completed On=null
- Map Update Memo `333b7a9d-...4289` — Status=Draft, Owner=empty, Reviewed By=empty
- ClickUp repair tasks `869ctznm8`, `869ctznma` remain open
- ClickUp core tasks `869cp7hfu`, `869cp7hg3` have no custom fields

**What does not exist yet:**
- No standalone skill packages exist yet. Current runtime capability lives in partial MCP helpers, not packaged skills.
- No n8n sensing pipelines are live
- No penetration, sales, retention, or referral territories
- Teacher, principal, and B2B audience models are hypotheses, not operating releases

**State summary:**
- Student: `audience_state = active`, `slice_build_state = phase1_partial`
- Teacher, principal, B2B: `audience_state = hypothesis`, `slice_build_state = phase0_incomplete` or `not_started`

This PRD defines the product that moves the student slice from `phase1_partial` to `phase1_complete`, then allows the next audience to move from `activation_ready` into `active` once its own Phase 0 truth and activation gates are met.

---

## 9. MVP Scope

### 9.1 MVP Audience

Student beachhead, Kenya.

### 9.2 MVP Promise

One operator or agent should be able to run the student belief-operations loop from upstream truth through reviewed evidence, canonical map updates, and execution follow-up without inventing missing process during the run.

### 9.3 MVP Includes

- Layer 0 product truth management for the active audience
- audience activation and scoping
- live intelligence collection workflow
- evidence-source review and publication
- belief-map and topology-map publishing
- ClickUp execution routing
- coverage and freshness tracking
- governance closure and border diagnostics
- content production pipeline definition (FR13) — at minimum, the path from insight to content brief to published piece
- product friction mapping against existing K2M surfaces (FR14) — at minimum, one friction walk of the student journey
- distribution via existing channels (FR16 Phase 1 — manual publish, map-grounded briefs)

### 9.4 MVP Excludes

- full multi-audience concurrency
- fully automated social discovery for every platform
- full retention and referral operations (these territories are reached after sales, per build order)
- automated content distribution (FR16 Phase 2/3)
- comprehensive authority/content distribution automation

---

## 10. Functional Requirements

### FR1. Product Truth Control (`k2m-product-truth`)

One active Layer 0 truth set per audience / offer / geography combination. Downstream workflows cannot outrun the current truth state.

Required fields per Product Truth record:

- philosophy, product kernel, product identity, bridge identity
- category belief, product belief, audience-specific payoff
- proof object, `evidence_tier` (per governance protocol tier E0-E4)
- owner, reviewer, approver, reviewed-on, next-review
- linked relations: Audience Segment, Belief Maps, Topology Maps, Artifacts

**Acceptance criteria**

- Student Product Truth record `333b7a9d-6129-8066-977f-e77aa4170435` has all required fields populated (currently: Audience Segment, Belief Maps, and Artifacts relations are empty — must be backfilled).
- Owner and approver are explicitly set (not "empty" or "k2m Labs" placeholder).
- No skill downstream of Product Truth can invoke without first verifying `review_state = approved`; promotion to canonical state requires separate governance approval.

### FR2. Audience Activation And Scope Control

Each audience carries two explicit states:

- `audience_state`: `hypothesis` -> `researching` -> `activation_ready` -> `active` -> `expansion_ready` -> `dormant` -> `retired`
- `slice_build_state`: `not_started` -> `phase0_incomplete` -> `phase0_complete` -> `phase1_partial` -> `phase1_complete`

Each audience record includes: trigger problem, self-verdict, validation status, geography, current priority, linked truth and territory objects, plus both state markers.

**Acceptance criteria**

- All four audiences (student, teacher, principal, B2B) have Product Truth records by end of Phase 0. Student is the active beachhead. Others are documented hypotheses.
- Student remains `audience_state = active` while its `slice_build_state` stays `phase1_partial` until open relations, review metadata, and workflow closures are completed.
- Teacher, principal, and B2B remain `audience_state = hypothesis` and `slice_build_state = phase0_incomplete` or `not_started` until Phase 0 truth is materially established.
- Promotion from `researching` to `activation_ready` requires: direct self-verdict evidence at E3+, completed Product Truth, and first belief and topology objects.
- Promotion from `activation_ready` to `active` requires Trevor approval plus a valid Phase 0 truth package.
- Promotion from `phase1_partial` to `phase1_complete` requires one review-closed end-to-end loop with governance debt surfaced and resolved.
- Promotion from `active` to `expansion_ready` requires repeated passes without hidden governance debt and explicit approval to open the next audience.
- No audience can reach `active` by agent decision alone — requires Trevor's explicit approval (kill authority).
- Cross-audience Product Truth conflicts surfaced in Phase 0 are documented as open questions, not silently ignored.

### FR3. Belief Audit (`k2m-belief-audit`)

Produces the belief architecture for one audience using the Four Forces schema:

| Output | Schema |
|--------|--------|
| Belief Map | Push, Pull, Anxiety, Habit forces per audience segment |
| Self-verdicts | What the audience says about itself in its own language |
| Failed promises | What prior solutions promised and didn't deliver |
| Awareness stage | Where the audience sits on problem/solution awareness |
| Open loops | Unresolved questions the audience is actively carrying |

Evidence requirements: every belief statement must link to at least one source at E2 or above. E1 anecdotes are input signals, not map-ready conclusions.

**Acceptance criteria**

- Student belief map `333b7a9d-6129-81ac-a126-f464e5a31ef3` has Four Forces populated with source links.
- Each belief statement references the evidence tier of its strongest supporting source.
- Belief map `Workflow Runs` relation is populated (currently empty — must be backfilled).

### FR4. Topology Audit (`k2m-network-topology-audit`)

Maps how belief travels through the audience's network. Outputs:

- Cluster map (who talks to whom)
- Maven map (who the audience trusts)
- Connector map (who bridges clusters)
- Bridge nodes (where K2M can insert)
- Threshold bands (Centola's 25% tipping point — conditional on reinforcement density, not reach)
- Cascade risks (where belief change could stall or backfire)

**Acceptance criteria**

- Student topology map `333b7a9d-6129-8143-8a38-c4d6715f3624` has Nodes, Bridges, and workflow linkage populated (currently all empty).
- At least one bridge node identified for K2M's insertion point.
- Topology conclusions distinguish between scraped signals (E1-E2) and reviewed patterns (E3+).

### FR5. Live Intelligence Workflow (`k2m-live-market-intelligence`)

Repeatable discovery-to-review loop: discover → capture → normalize → infer → review → publish.

Produces: Evidence Sources, Workflow Runs, Map Update Memos, audience language banks, timing window alerts.

The sensing layer is target runtime on n8n (scheduled scrapes, Apify actors, webhook ingestion). Synthesis runs on Claude Code via MCP. Review is human-gated.

**Acceptance criteria**

- A workflow run can be created, owned, reviewed, and closed in one session.
- Evidence records link to the belief/topology outputs they support.
- Map Update Memo `333b7a9d-6129-818b-af71-c5fa86944289` can be advanced from `Draft` to `Approved` with owner and reviewer set (currently: Status=Draft, Owner=empty, Reviewed By=empty).
- Workflow Run `333b7a9d-6129-8123-b378-c75d2b6bfdd5` can be closed with completion metadata (currently: Status=In Progress, Owner=empty, Completed On=null).
- Evidence page `333b7a9d-6129-81e2-b902-c9b46d227b8a` has an assigned owner (currently empty).

### FR6. Authority Intelligence (`k2m-authority-intelligence`)

Per-audience authority feed for borrowed credibility. Translates global authority discourse into audience-appropriate language.

Primary authorities for student audience: Ethan Mollick (#1), Cassie Kozyrkov (decision under uncertainty), Reid Hoffman ("Superagency"), UNESCO AI Competency Framework (institutional legitimacy), Tiago Forte (methodological ancestor).

Outputs: authority translation briefs, credibility citation recommendations, meta-workflow observatory signals.

**Acceptance criteria**

- At least 3 authority sources mapped to student audience with translation notes.
- Each authority citation includes: original claim, K2M translation, audience relevance, evidence tier.
- ALX positioning is documented: "ALX teaches USE, K2M teaches THINK" — complementary, not competitive.

### FR7. Penetration Architecture (`k2m-penetration-architecture`)

Turns territory truth into market-entry design. Consumes outputs from product truth, belief audit, topology audit, and authority intelligence.

Outputs: wedge definition, category belief system, product belief system, routing plan, beachhead plan.

**Acceptance criteria**

- Student penetration architecture references specific belief map forces and topology bridge nodes.
- Wedge definition is testable: can be expressed as a single sentence a student would recognize as their problem.
- Routing plan specifies which topology entry points K2M will use first.

### FR8. Canonical Territory Object Publishing

Publishes and updates: Audience Segments, Belief Maps, Topology Maps, Timing Windows, Artifact Library entries, Border Issues.

Each object carries: status (per governance states in FR11), owner, review date, next review date, evidence linkage.

**Acceptance criteria**

- Student belief map answers "what does this audience believe now" with Four Forces structure.
- Student topology map answers "how is that belief moving now" with node/bridge structure.
- Every map conclusion traces to reviewed evidence at E2+.

### FR9. Execution Routing To ClickUp

Approved map changes become ClickUp tasks. Tasks link back to Notion records. No free-floating tasks.

Each task requires: owner, reviewer, task-type label, linked Notion record, status progression (draft → in progress → ready for review → complete).

**Acceptance criteria**

- ClickUp tasks `869cp7hfu` and `869cp7hg3` have custom fields populated (currently empty).
- Every strategic task links to a Notion record, memo, or artifact.
- Ownerless strategic tasks surface as governance debt in the coverage tracker.

### FR10. Coverage, Freshness, And Cadence Visibility

Exposes per audience: Build %, Coverage %, Freshness %, Cadence %.

Coverage tracker `333b7a9d-6129-8112-84b4-d2672ef05ffb` reflects actual live object state, not stale closure claims.

**Acceptance criteria**

- An operator can look once and see what is built, stale, and missing for the student audience.
- Tracker auto-detects: records past review date, records with empty owners, records with broken Notion relations.
- Tracker only updates after live object state matches claim (per April 8 re-review finding).

### FR11. Governance And Review Closure

Use the authoritative vocabulary in Section 3.5. Do not collapse `review_state`, `canonical_state`, and `evidence_tier` into one field.

Evidence tier enforcement per governance protocol:

- Product truth change: minimum E3 + one E4, or two independent E4 signals
- Belief map change: minimum E3 with reviewed source links
- Topology map change: minimum E3 with cluster-level corroboration
- Canonical promotion: requires `review_state = approved`, a recorded disconfirmation pass, named decision authority, and explicit `canonical_state = canonical`

**Acceptance criteria**

- Workflow Runs and Map Update Memos cannot remain half-closed >7 days without surfacing as governance debt.
- Every canonical statement has owner, reviewer, next-review, evidence tier, review state, and canonical state.
- Repair tasks `869ctznm8` and `869ctznma` demonstrate the governance closure workflow works end-to-end.

### FR12. Border Diagnostics (`k2m-system-orchestrator`)

Detects failures between territories: product truth → territory truth, penetration → sales, sales → retention, retention → referral, referral → penetration.

Each border issue: severity, symptoms, linked workflow/artifact, owner, next review.

**Acceptance criteria**

- Border issues created from real workflow failures, not hypothetical risk lists.
- Border repairs assigned and tracked in ClickUp with linked Notion context.

### FR13. Content Production Pipeline (Last-Mile Cascade)

Intelligence without distribution is a journal. The system must cascade from map insight to published content in a student's feed.

**When the system reaches the penetration territory, the following must be determined:**

- What are K2M's active distribution channels? (Discord, Instagram, TikTok, WhatsApp, landing page, other)
- What content formats work on each channel for the student audience?
- Who or what produces the content? (human, Claude draft → human edit, automated via MCP)
- What is the production path from belief map insight → content brief → draft → review → publish?
- What tools are in the content stack? (Canva, Figma, Claude, video tools, other)

**The content production loop must follow this chain:**

1. Belief map or topology map produces an insight (e.g., "students respond to X language," "this bridge node amplifies on Instagram")
2. Insight becomes a **content brief** — specific audience, specific belief force to address, specific channel, specific format
3. Brief becomes a **draft** — produced by human or agent, references belief language directly
4. Draft passes **review** — checked against product truth (does this align with category belief?) and belief map (does this use the audience's actual language?)
5. Approved draft is **published** to the target channel
6. **Signal feedback** — engagement, DM replies, comments feed back into the next sensing cycle

Each content piece must trace back to a specific belief map entry or topology insight. Content disconnected from the map is unrouted activity.

**Acceptance criteria (to be validated when penetration territory is reached)**

- A content brief can be generated from a belief map entry without inventing the format mid-run.
- Published content links back to the map insight and evidence that justified it.
- Engagement signals from published content feed back into the next intelligence cycle.
- Content production does not depend on one person's memory of what the map says — the brief carries the context.

### FR14. Product Friction Cascade (Brownfield Execution)

K2M is a brownfield project. KIRA exists. The Discord server exists. A cohort application flow may exist. Content calendars exist. When the system reaches the sales territory, it inspects existing product surfaces — not just the market — without assuming belief-ops owns those surfaces.

FR14 is an inspection-and-routing requirement, not an ownership transfer. `k2m-landing`, `cis-discord-bot`, forms, onboarding flows, and other product surfaces remain owned by their existing implementation slices. Belief-ops diagnoses friction, links it to evidence, and routes fixes back to the correct owner system.

**When the system reaches the sales territory, the following must be determined:**

- What is the student-facing product surface today? (Discord bot, landing page, application form, cohort onboarding, other)
- Where does a student GO when penetration content reaches them? What's the conversion path?
- What existing product surfaces need friction mapping? (application flow, onboarding, first-value experience, community entry)
- Which surface owner receives the fix? (GitHub issue in the owning repo, ClickUp operational task, content pipeline change, or a combination)

**The friction-to-fix loop:**

1. `k2m-sales-friction-walk` audits the actual student journey through K2M's existing product surfaces
2. Friction findings produce typed outputs: trust gradient issues, objection points, handoff failures, UX friction, technical bugs
3. **UX/operational friction** → ClickUp task linked to the friction finding
4. **Technical/codebase friction** → GitHub issue linked to the friction finding (e.g., "KIRA doesn't respond to X," "application form drops off at step 3," "onboarding flow asks too many questions")
5. Fixes are verified against the original friction finding — did the fix actually reduce the friction?
6. Updated friction map feeds back into the next sales territory review

**Two execution surfaces, not one:**

| Friction Type | Execution Surface | Example |
|--------------|-------------------|---------|
| Market/operational | ClickUp | "Students don't trust the offer — need social proof on landing page" |
| Product/codebase | GitHub Issues | "KIRA response latency >5s on pathway questions" |
| Content/messaging | Content production pipeline (FR13) | "Application CTA uses language students don't recognize" |

**Acceptance criteria (to be validated when sales territory is reached)**

- The friction walk audits real product surfaces, not hypothetical ones, and does not transfer ownership of those surfaces to belief-ops.
- Each friction finding specifies which existing team or execution surface owns the fix in ClickUp, GitHub, or the content pipeline.
- GitHub issues created from friction findings link back to the belief-ops evidence that surfaced them.
- Product fixes are re-audited in the next friction walk cycle — no fix-and-forget.

### FR15. Retention And Referral Cascade

When the system reaches retention and referral territories, the last-mile cascade must extend beyond content and product fixes into identity deepening and advocacy.

**When the system reaches the retention territory, the following must be determined:**

- What does the student's first-value experience look like today? How long before a student gets proof that K2M works for them?
- What are the defining moments in the cohort journey? Where does identity shift happen?
- What community surfaces exist? (Discord channels, WhatsApp groups, peer cohort spaces)
- What dropout signals are detectable? Where do students disengage?

**When the system reaches the referral territory, the following must be determined:**

- What proof artifacts do students produce during the cohort? (Projects, reflections, portfolio pieces, public posts)
- Which artifacts are shareable? Which moments trigger organic advocacy?
- What channels do students use to share with peers? (WhatsApp status, Instagram stories, TikTok, word of mouth)
- What referral mechanisms exist or need building? (Referral codes, alumni ambassador programs, peer invite flows)

**The retention-to-referral chain:**

1. `k2m-retention-architecture` maps: first-value threshold → defining moments → weekly identity progression → dropout interventions
2. Retention insights feed into product fixes (FR14) — "the week 3 prompt doesn't land, students disengage here"
3. `k2m-referral-architecture` identifies: which transformation moments produce shareable artifacts, which advocacy moments can be amplified
4. Referral insights feed into content production (FR13) — student-generated proof artifacts become the most credible penetration content for the next cohort
5. The referral loop closes back into penetration — transformed students are the strongest signal source for the next belief audit

**Acceptance criteria (to be validated when retention/referral territories are reached)**

- Retention architecture is tested against real cohort data, not hypothetical journey maps.
- Dropout interventions are triggered by actual signals, not scheduled check-ins.
- Referral story kits are built from real student artifacts and language, not marketing copy.
- The referral → penetration loop is explicit: student proof feeds the next belief audit and content cycle.

### FR16. Distribution Automation (Progressive)

Content distribution starts manual and progressively automates as channels and formats stabilize.

**Phase 1 (MVP):** Manual publish. Operator takes approved content brief, produces content, posts to channels. The system's job is to ensure the brief exists and is map-grounded.

**Phase 2 (Post-MVP):** Semi-automated. n8n workflows handle scheduling, cross-posting, and format adaptation. Human reviews before publish.

**Phase 3 (Scale):** MCP-integrated. Content production and distribution triggered by map changes. Human review remains the gate for message-level content. Operational posts (reminders, community updates) can auto-publish.

**Acceptance criteria**

- Phase 1 is sufficient for MVP. Do not build Phase 2/3 automation before Phase 1 produces content that moves external metrics.
- Each phase gate requires evidence that the previous phase works (content produced, engagement measured, insights fed back).
- Automation increases leverage, not complexity. If automated content performs worse than manual content, revert.

### FR17. Agent-Compatible Operation

Operable by humans and agents without hidden conversational context. Stable artifact shapes, naming, and required metadata.

MCP tools and BMAD workflows run against the same contract. The operating contract layer (`tools/k2m_mcp/operating_contract.py`) defines what each tool does, what it looks for, and what write checklist it must follow.

**Acceptance criteria**

- An agent can determine what to read, update, and produce from repo + live systems alone.
- No skill depends on memory of a prior session.
- Agent outputs are subject to disconfirmation review (see NFR 11.7).
- Content production (FR13), friction fixes (FR14), and distribution (FR16) are operable by agents following the same contract.

---

## 11. Non-Functional Requirements

### 11.1 Traceability

Every major output traces from: source evidence → reviewed memo → canonical object → execution task. No output exists without this chain.

### 11.2 Reviewability

Weak evidence, missing owners, stale records, and unclosed governance states are visible by default — not hidden behind passing audit scripts.

### 11.3 Low-Invention Operation

Operators do not invent workflow structure during a live run. Every skill defines its inputs, outputs, and next steps.

### 11.4 Async-Safe Operation

Agent-driven and human-driven updates work across sessions without relying on one continuous interactive thread. Every skill reads current state from Notion at invocation time.

### 11.5 Portability

Operable across Codex, Claude Code, and future orchestrators through MCP and repo-local documentation. No vendor lock-in on the cognition layer.

### 11.6 Lean Automation

Automation reduces coordination cost, not obscures truth. Human review remains the final gate for canonical change. Cap alert volume at 35-40/day to prevent alert fatigue.

### 11.7 Disconfirmation And Anti-Sycophancy

**This is the #1 technical threat to the system.** LLMs structurally over-agree with their owners' doctrine. Cascading sycophancy in multi-agent chains compounds silently — each agent reinforces the previous agent's conclusions without fresh external grounding.

Mitigations (all required, not optional):

1. **Disconfirmation sub-skill**: every major synthesis output gets adversarial review from a different agent context using fresh external data. The reviewing agent must not share conversation history with the producing agent.
2. **External reality metrics**: cohort application rate and DM reply rate (§13.1) are the ultimate sycophancy detectors — if the market doesn't move, the internal maps are wrong regardless of how coherent they look.
3. **Kill authority**: Trevor has explicit authority to reject or delete any agent output. Agent confidence is not evidence.
4. **Evidence tier enforcement**: no claim reaches canonical state without passing through reviewed evidence stages. Agent assertions start at E0.
5. **Hallucination grounding**: synthesis skills must ground conclusions in source links. Unsourced inferences are flagged, not published.

### 11.8 Modular Cascade

When a belief map updates, downstream territories (penetration, sales, retention, referral) inherit the change. No manual sync across layers. One update propagates. Skills read from Notion at invocation time, never cache stale state.

---

## 12. User Journeys

### Journey 1. KUCCPS Window Sensing Pass (Live Intelligence)

The KUCCPS placement results drop in April. Student anxiety peaks. Belief signals are hottest now.

1. In the live runtime, an operator triggers `k2m-live-market-intelligence` through MCP. In the target runtime, n8n can schedule the same sensing pass. Either way, the pass must inspect YEIYO TV comments, student Facebook groups, X/Twitter KCSE threads, and Reddit Kenya or whatever current sources replace them.
2. Raw signals land in Evidence Sources via MCP. Each source is tagged with platform, date, audience segment, and signal type (belief shift, language shift, topology shift, timing window).
3. Operator reviews raw signals. E1 anecdotes are kept as input but not promoted. Repeated patterns across 3+ sources become E2.
4. Operator drafts a Map Update Memo linking evidence to specific Four Forces shifts: "Push force strengthened — students expressing panic about placement uncertainty."
5. Disconfirmation agent reviews the memo against fresh external data from a different search context. Flags anything that looks like confirmation bias.
6. Trevor reviews and approves or rejects. Approved memo updates the belief map and topology map in Notion.
7. Workflow Run is closed with completion metadata. Coverage tracker refreshes.

### Journey 2. Belief Map Contradicts Product Truth

Intelligence reveals students don't care about "thinking with AI" — they care about "getting a job." The Pull force K2M assumed is weaker than expected.

1. Belief audit surfaces the contradiction: Pull force evidence is E1 (anecdotal), not E3 (reviewed pattern).
2. `k2m-system-orchestrator` flags a border issue: product truth → territory truth mismatch, severity High.
3. PM re-examines Product Truth. Options: (a) the belief map evidence is thin and needs more sensing, (b) the product truth needs revision.
4. If (b): Product Truth change requires E3 + one E4 per governance protocol. PM gathers first-party evidence (DM conversations, cohort application language).
5. Trevor approves or rejects the truth revision. If approved, downstream territories (penetration, sales) inherit the updated truth automatically via cascade.

### Journey 3. Thin Topology Evidence In Kenya

The topology audit attempts to map how student belief travels, but Kenyan digital signals are sparse. Facebook groups are private. X/Twitter volume is low.

1. `k2m-network-topology-audit` runs and produces a partial map: cluster structure is visible but bridge nodes are uncertain.
2. Operator tags topology conclusions with evidence tier: E1 for inferred connections, E2 for observed public interactions.
3. System flags: topology map has <50% of nodes at E2+. Coverage tracker shows Freshness % dropping.
4. Operator creates a sensing task: run DM-based interviews with 5 students to map their actual information sources (who do they follow? who do they ask?).
5. First-party interview signals upgrade topology evidence to E3-E4. Map updates with stronger bridge node identification.
6. Penetration architecture now has reliable entry points instead of guesses.

### Journey 4. Prepare Teacher Audience For Activation

Student loop is stable. K2M considers expanding to teachers.

1. Teacher audience record exists as `hypothesis` with no product truth.
2. PM defines teacher trigger problem hypothesis: "I know AI matters but I don't know how to teach with it responsibly."
3. Operator runs first sensing pass for teacher audience — different signal sources (education forums, ministry of education channels, teacher WhatsApp groups via proxied signals).
4. Evidence must independently reach E3 for teacher self-verdict before activation. Student evidence does NOT transfer — different audience, different beliefs.
5. Once teacher Product Truth, first belief map, and first topology map exist with E2+ evidence: teacher can be promoted from `hypothesis` to `researching`.
6. Promotion to `active` requires Trevor's approval + completed Product Truth + evidence that the student operating loop is genuinely repeatable (not just completed once).

---

## 13. Success Metrics

### 13.1 External Reality Metrics (Primary)

These are the only metrics that prove the system is working in the market, not just internally consistent:

| Metric | Definition | Target (MVP) |
|--------|-----------|-------------|
| **Cohort application rate** | Students who apply to K2M cohort after exposure to penetration content | Primary success metric — baseline TBD from first penetration pass |
| **DM reply rate** | Students who respond to direct outreach rooted in belief-ops intelligence | Secondary — measures whether belief language resonates |

If these metrics don't move, the system is producing elegant nonsense regardless of internal health scores.

### 13.2 MVP Operational Metrics

- Student Product Truth record locked and usable with all relations populated
- One student workflow run completed and review-closed end-to-end
- At least one reviewed evidence packet published without inventing process
- Student belief and topology objects linked, owned, and fresh
- Coverage tracker reflects actual current state (validated against live Notion/ClickUp, not cached claims)
- Downstream ClickUp tasks created and completed from map changes

### 13.3 System Health Metrics

- % of active records with owner and reviewer
- % of active records with next-review date
- % of stale records past review date (>7 days = governance debt)
- Workflow completion rate (started vs. review-closed)
- Review turnaround time (draft → approved)
- Border issues opened vs. closed
- Disconfirmation reviews completed per synthesis cycle (target: 100% of major outputs)

---

## 14. Release Model

### Release 1. Student Beachhead MVP

Goal:

Prove one repeatable end-to-end operating loop for the student audience in Kenya.

Exit criteria:

- Layer 0 truth locked
- workflow run closed
- map update memo closed
- evidence packet published
- belief map and topology map linked and current
- coverage tracker current
- execution tasks routed and reviewed

### Release 2. Teacher Audience

Goal:

Reuse the same operating ritual for teachers without assuming the student shell transfers unchanged.

Entry criteria:

- Release 1 is repeatable, not just completed once
- teacher bridge identity and self-verdict have direct evidence
- first teacher belief and topology objects exist
- modularity assumptions from the student offer are reviewed

### Release 3. School Leadership Audience

Goal:

Extend the system to principals / school leaders once institutional timing, decision authority, and trust gradients are better understood.

Entry criteria:

- teacher slice yields reusable institutional insight
- leadership-specific trigger problems and proof paths are evidence-backed

### Release 4. B2B Audience

Goal:

Translate the operating loop into organizational AI adoption and decision-quality contexts.

Entry criteria:

- direct worker or team evidence exists
- product shell assumptions for organizational use are explicit
- authority and proof objects are defined for B2B trust layers

---

## 15. MVP Build Order (Decided)

The build follows the decided territory sequence per audience. This is not a flat priority list — it is an ordered path where each territory depends on the outputs of the previous one.

### Phase 0: Product Truth For All Audiences (Before Implementation)

Product Truth is not implementation — it is product definition. Layer 0 clarity must be established for ALL planned audiences before deep implementation begins on any of them. This prevents discovering fundamental product-truth conflicts mid-build.

| Audience | Product Truth Scope | Gate |
|----------|-------------------|------|
| **Students** (post-KCSE, Kenya) | Full Layer 0: philosophy, product kernel, product identity, bridge identity, category belief, product belief, payoff, proof object | Review state Approved, all relations populated |
| **Teachers** | Layer 0 hypothesis: trigger problem, self-verdict hypothesis, bridge identity hypothesis, product belief hypothesis | Hypotheses documented with whatever evidence exists (E1-E2 acceptable at this stage) |
| **Principals / School Leaders** | Layer 0 hypothesis: trigger problem, institutional decision dynamics, trust gradient hypothesis | Hypotheses documented |
| **B2B Teams / Organizations** | Layer 0 hypothesis: organizational trigger, decision authority map, product shell assumptions | Hypotheses documented |

Phase 0 does NOT mean full implementation for all audiences. It means: define what is true (or hypothesized) about each audience's relationship to K2M's product before going deep on any one of them. This surfaces cross-audience conflicts early — e.g., does the student product kernel transfer to teachers, or does K2M need separate kernels?

### Student Beachhead Build Sequence (Post Phase 0)

| Phase | Territory | Skill(s) | Last-Mile Cascade | Gate to Next |
|-------|-----------|----------|-------------------|-------------|
| 1 | **Product Truth (student deep pass)** | `k2m-product-truth` | — | Student Layer 0 locked with all relations populated, review state Approved, cross-audience conflicts from Phase 0 noted |
| 2 | **Intelligence Territories** (parallel) | `k2m-belief-audit` + `k2m-network-topology-audit` + `k2m-authority-intelligence` + `k2m-live-market-intelligence` | — | Belief map + topology map + authority briefs produced with E2+ evidence, workflow run closed |
| 3 | **Penetration** | `k2m-penetration-architecture` | **Determine:** active distribution channels, content formats, production path, content stack. **Produce:** first content briefs from map insights, first published content (FR13) | Wedge defined, routing plan specifies entry points, first content published and engagement measured |
| 4 | **Sales** | `k2m-sales-friction-walk` | **Determine:** student-facing product surfaces, conversion path, where fixes are tracked. **Produce:** friction map of existing K2M product, GitHub issues for codebase fixes, ClickUp tasks for operational fixes (FR14) | Student-facing surface exists, friction walk completed, product fixes in flight |
| 5 | **Retention** | `k2m-retention-architecture` | **Determine:** first-value experience, defining moments, community surfaces, dropout signals. **Produce:** retention interventions, product fixes for week-by-week cohort journey (FR15) | First-value threshold defined, dropout interventions triggered by real signals |
| 6 | **Referral** | `k2m-referral-architecture` | **Determine:** shareable artifacts, advocacy moments, peer channels, referral mechanisms. **Produce:** referral story kits from real student proof, referral content feeds back into penetration (FR15) | Referral → penetration loop closed: student proof artifacts feed next belief audit |
| 7 | **Border Diagnostics** | `k2m-system-orchestrator` | Audit all cascade boundaries: map → content, friction → fix, retention → referral → penetration | Cross-territory failures logged and repaired |

### Hybrid Build Strategy (Saga's)

Rough v1 of all territories for student audience, then rotate to audience #2 within ~4 weeks while student v2 hardens. Each audience's intelligence informs what that audience's product needs.

### Should Have Soon After Student MVP

- Stronger first-party signal logging (DMs, cohort conversations, application patterns)
- Recurring intelligence cadence (n8n scheduled sensing loops)
- Border repair automation
- Content creation and posting skills via MCP integrations

### Later Expansion

- Multi-audience concurrent operation
- Phone-triggered workflows (Discord KIRA / Telegram webhook)
- Advanced topology scoring and graph analysis
- OpenClaw evaluation (4 weeks from April 9, 2026)

---

## 16. Risks And Constraints

### 16.1 Product Risks

- expanding to new audiences before the student loop is stable
- treating documentation completeness as runtime maturity
- collapsing philosophy, category belief, and product belief into one layer

### 16.2 Market Risks

- Kenyan signal density may be thinner than expected in some audiences
- student evidence may not transfer cleanly to teachers or B2B
- timing windows may close faster than governance cycles

### 16.3 Execution Risks

- workflow objects remain half-closed
- coverage tracker drifts from live truth
- ClickUp and Notion relations stay thinner than the architecture requires
- automation increases complexity before the core ritual is stable

### 16.4 Technical Risks

- Cascading sycophancy in multi-agent chains (mitigated by NFR 11.7, but remains the #1 technical threat)
- Alert fatigue if n8n sensing pipelines over-fire (cap at 35-40/day)
- Hallucination in synthesis: Claude may infer belief patterns that don't exist in source data (mitigated by evidence tier enforcement)
- MCP server needs Railway hosting before phone triggering works
- Topology inference is weaker than a full graph-analysis system — sufficient for MVP, not for scale

---

## 17. Dependencies

The MVP depends on:

- the Layer 4 product brief
- the belief-operations OS
- live intelligence architecture
- Notion information architecture
- ClickUp workflow architecture
- governance and map-update protocol
- repo-local MCP server
- active Notion and ClickUp access

---

## 18. Open Questions

1. What exact evidence threshold upgrades a student slice from `approved` to `canonical`? (FR11 defines the tiers, but the promotion trigger needs explicit definition per territory.)
2. How much of the current cohort product shell (curriculum, prompts, community structure) is invariant across audiences vs. audience-specific? This blocks teacher and B2B product design. (Scheduled for resolution within 4-6 weeks per party mode.)
3. Which first-party signals (DM conversations, cohort behavior, application language) should become mandatory before teacher or B2B activation?
4. What is the minimum viable sensing coverage for Kenya when public digital signals are thin? At what point does the system switch from scraping to interview-based intelligence?
5. How should the system handle contradictions between skill outputs — e.g., belief audit says one thing, topology audit implies another?
6. What is the operating cost ceiling? Estimated $100-350/month — at what point does sensing automation need to justify its cost against manual intelligence gathering?

---

## 19. Recommended Next Documents

After this PRD, K2M should produce:

1. an epics-and-stories document derived from this PRD
2. a release plan for Student Release 1
3. an audience activation checklist for Teacher Release 2

---

## 20. Canonical Requirement Statement

> **K2M must be able to run one reviewed, repeatable belief-operations loop for the student audience — from product truth through belief audit, topology mapping, penetration, sales, retention, and referral — using the 10-skill target stack on Claude Code + MCP, with n8n reserved for target sensing and distribution, cascading intelligence all the way to published content in a student's feed, friction fixes on the existing product surfaces, and referral loops that feed the next cycle. The system produces intelligence that moves cohort application rate and DM reply rate. Only then does the same ritual expand to the next audience.**
