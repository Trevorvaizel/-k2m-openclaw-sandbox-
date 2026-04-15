# K2M Skill Architecture
## How The Canonical System Becomes Skills And Workflows

*Status: reconciled against PRD v0.2 - 2026-04-10*

---

## Purpose

This document defines how K2M's canonical belief operations system becomes agent skills and workflows.

The canon still governs belief mechanics.
The PRD governs the skill inventory, runtime architecture, evidence rules, build order, and release gates.

It answers four questions:

1. Which capabilities should become skills?
2. Which ordered sequences should become workflows?
3. What artifacts must each skill or workflow produce?
4. How should the canonical texts be used without bloating the skills?

---

## Governing Rules

### Rule 1

Canonical texts remain doctrine.

They should not be copied wholesale into skills.

### Rule 2

Skills remain thin, procedural, and operational.

They should tell an agent:

- what to do
- when to do it
- what references to load
- what outputs to produce

### Rule 3

Workflows own order.

A skill is a capability.
A workflow is the sequence that turns capabilities into an outcome.

### Rule 4

Templates are first-class assets.

If a workflow always produces the same shape of artifact, that artifact should have a template.

### Rule 5

Every skill must know where to retrieve doctrine from.

Before loading manifesto or transcript material, consult [canon/README.md](./canon/README.md) to choose the smallest relevant subset of the canon.

### Rule 6

Skills must be explicit about implementation state.

If a skill is target architecture but not yet a fully implemented runtime skill, label it as `NOT YET IMPLEMENTED` rather than implying it already exists.

### Rule 7

Every synthesis skill must enforce evidence tiering and disconfirmation.

Belief, topology, and strategy conclusions must carry evidence-tier signals and be reviewable against a separate adversarial pass before promotion toward canonical state.

---

## Runtime Binding

The skill system runs on the PRD's layered runtime:

- Claude Code for cognition and synthesis
- n8n for sensing loops, scheduled collection, webhook triggers, and later distribution automation as target runtime only
- MCP for orchestration glue and typed tool access
- Notion for reviewed maps, memos, evidence, and coverage state
- ClickUp for execution workflows and repair tasks

Current implementation inventory from the repo:

- `tools/k2m_mcp/` already provides live MCP tools for Notion upserts, ClickUp workflow creation, doctrine-scored intelligence collection, and Phase 1 audit/reconcile jobs
- `cis-discord-bot/` already provides the KIRA Discord bot and student-facing runtime surfaces
- full standalone skill packages for the 10 belief-ops skills do **not** yet exist as separate implemented runtime modules

---

## Skill Inventory

| Skill | Implementation status | Purpose | Core inputs | Core outputs |
|---|---|---|---|---|
| `k2m-product-truth` | Target only | Maintain Layer 0 clarity | Product brief, JTBD, playbook, cohort evidence | Product identity, bridge identity, category belief, product belief, payoff line |
| `k2m-belief-audit` | Target only | Map belief architecture for one audience | Audience segment, interviews, comments, market signals | Belief audit in Four Forces form, self-verdicts, failed promises, awareness stage, open loops |
| `k2m-network-topology-audit` | Target only | Map how belief travels | Audience graph, creator ecosystem, share patterns, community signals | Cluster map, maven map, connector map, bridge nodes, threshold bands, cascade risks |
| `k2m-penetration-architecture` | Target only | Turn territory truth into market-entry design | Product truth, belief audit, topology audit | Wedge, category belief system, product belief system, routing plan, beachhead plan |
| `k2m-sales-friction-walk` | Target only | Diagnose commitment friction | Landing pages, DMs, FAQs, funnel data | Trust gradient audit, objection map, friction walk, handoff fixes |
| `k2m-retention-architecture` | Target only | Design identity deepening and first value | Onboarding flow, cohort prompts, community data | First-value threshold, defining moments map, weekly identity progression, dropout interventions |
| `k2m-referral-architecture` | Target only | Turn transformation into advocacy | Artifacts, alumni stories, sharing behavior | Referral story kit, advocacy moments, bridge-crossing assets, weak-tie plan |
| `k2m-live-market-intelligence` | Partial (MCP layer) | Keep the map current | Search, scrape, competitor, first-party, community data | Map update memo, narrative shifts, topology shifts, timing windows, alerts |
| `k2m-system-orchestrator` | Partial (routing/persistence) | Coordinate workflows and borders | Outputs from all other skills | Prioritized backlog, workflow routing, border diagnosis, next-step plan |
| `k2m-authority-intelligence` | Target only | Translate global authority into audience-relevant borrowed credibility | Global authority corpus, audience context, observatory inputs | Authority translation briefs, credibility assets, citation recommendations |

The 10-skill inventory above is the target contract, not a claim that all skills are live.
Current repo implementation is partial: the MCP layer supports pieces of `k2m-live-market-intelligence`, `k2m-system-orchestrator`, and the Notion/ClickUp persistence layer, but the full skill set is still target architecture.

---

## Workflow Inventory

### 1. Phase 0 Product Truth Alignment

**Goal:** Define Layer 0 truth or hypothesis state for all planned audiences before deep student implementation.

**Skills used:**

1. `k2m-product-truth`
2. `k2m-system-orchestrator`

**Required outputs:**

- student Product Truth deep record
- teacher Product Truth hypothesis
- principal Product Truth hypothesis
- B2B Product Truth hypothesis
- cross-audience conflict log

### 2. Beachhead Market Entry

**Goal:** Enter one segment with a mapped belief system, a topology map, and a staged market narrative.

**Skills used:**

1. `k2m-product-truth`
2. `k2m-belief-audit`
3. `k2m-network-topology-audit`
4. `k2m-authority-intelligence`
5. `k2m-penetration-architecture`

**Required outputs:**

- product truth sheet
- audience belief audit
- beachhead belief brief
- network topology audit
- authority translation brief
- wedge
- category belief
- product belief
- threshold-zero node hypothesis
- bridge-node routing plan

### 3. Message Penetration Refresh

**Goal:** Update penetration assets when the map has shifted.

**Skills used:**

1. `k2m-live-market-intelligence`
2. `k2m-belief-audit`
3. `k2m-network-topology-audit`
4. `k2m-authority-intelligence`
5. `k2m-penetration-architecture`

**Required outputs:**

- map update memo
- new language bank
- authority refresh note
- revised wedge
- revised routing plan
- content briefs ready for manual or automated distribution phase

### 4. Sales Repair

**Goal:** Diagnose why belief is not converting into commitment.

**Skills used:**

1. `k2m-sales-friction-walk`
2. `k2m-product-truth`
3. `k2m-system-orchestrator`

**Required outputs:**

- trust gradient audit
- friction walk
- objection map
- promise mismatch diagnosis
- sales-to-onboarding repair plan
- routed product-fix backlog

### 5. Retention Repair

**Goal:** Diagnose why paid or enrolled users are not reaching durable adoption.

**Skills used:**

1. `k2m-retention-architecture`
2. `k2m-sales-friction-walk`
3. `k2m-system-orchestrator`

**Required outputs:**

- first-value threshold
- defining moments map
- retention friction map
- dropout recovery plan
- proof-capture plan

### 6. Retention To Referral Design

**Goal:** Turn satisfaction or completion into advocacy.

**Skills used:**

1. `k2m-retention-architecture`
2. `k2m-referral-architecture`
3. `k2m-network-topology-audit`

**Required outputs:**

- defining moments map
- referral story kit
- shareable proof assets
- weak-tie crossing plan
- referral inputs back into the next penetration cycle

### 7. Live Map Update

**Goal:** Refresh the canonical market map with current evidence.

**Skills used:**

1. `k2m-live-market-intelligence`
2. `k2m-belief-audit`
3. `k2m-network-topology-audit`
4. `k2m-system-orchestrator`

**Required outputs:**

- map update memo
- topology shift memo
- timing window memo
- next action list
- evidence-tier summary
- disconfirmation review note

---

## Workflow To Skill Matrix

| Workflow | Product truth | Belief audit | Topology audit | Penetration | Sales | Retention | Referral | Intelligence | Orchestrator | Authority |
|---|---|---|---|---|---|---|---|---|---|---|
| Phase 0 Product Truth alignment | Yes | No | No | No | No | No | No | No | Yes | No |
| Beachhead market entry | Yes | Yes | Yes | Yes | No | No | No | Optional | Optional | Yes |
| Message penetration refresh | Optional | Yes | Yes | Yes | No | No | No | Yes | Optional | Yes |
| Sales repair | Yes | Optional | Optional | Optional | Yes | Optional | No | Optional | Yes | No |
| Retention repair | Optional | No | Optional | No | Yes | Yes | No | Optional | Yes | No |
| Retention to referral design | Optional | No | Yes | No | No | Yes | Yes | Optional | Optional | No |
| Live map update | Optional | Yes | Yes | No | No | No | No | Yes | Yes | Optional |

---

## Artifact Contracts

Each workflow should end in a specific artifact set.

| Artifact | Owner skill | Primary workflow |
|---|---|---|
| Product Truth hypothesis set | `k2m-product-truth` | Phase 0 Product Truth alignment |
| Product truth sheet | `k2m-product-truth` | Beachhead market entry |
| Belief audit | `k2m-belief-audit` | Beachhead market entry |
| Four Forces belief map | `k2m-belief-audit` | Beachhead market entry |
| Beachhead belief brief | `k2m-belief-audit` | Beachhead market entry |
| Network topology audit | `k2m-network-topology-audit` | Beachhead market entry |
| Authority translation brief | `k2m-authority-intelligence` | Beachhead market entry |
| Trust gradient + friction walk | `k2m-sales-friction-walk` | Sales repair |
| Defining moments map | `k2m-retention-architecture` | Retention repair |
| Referral story kit | `k2m-referral-architecture` | Retention to referral design |
| Border diagnostics dashboard | `k2m-system-orchestrator` | Any workflow |
| Map update memo | `k2m-live-market-intelligence` | Live map update |
| Content brief | `k2m-penetration-architecture` | Message penetration refresh |

---

## How To Use Canonical Texts Inside Skills

Each skill should use the same pattern:

- `SKILL.md` for the operating instructions
- `references/` for selected doctrine excerpts, checklists, and examples
- `assets/` for templates and output scaffolds
- `scripts/` only when deterministic execution is needed

Each skill should also define:

- evidence tier requirements for its outputs
- the required disconfirmation step, if it produces synthesis
- whether the current repo has a live implementation or only a target contract

Example:

`k2m-network-topology-audit/`

- `SKILL.md`
- `references/network-topology.md`
- `references/threshold-cascades.md`
- `assets/topology-audit-template.md`

Do not make one giant skill called `belief-operations`.
That would be hard to trigger, expensive to load, and too vague to compose well.

---

## Build Order

Build the skill layer in the PRD's decided order:

1. `k2m-product-truth` for all audiences at Phase 0, then student deep pass
2. `k2m-belief-audit`
3. `k2m-network-topology-audit`
4. `k2m-authority-intelligence`
5. `k2m-live-market-intelligence`
6. `k2m-penetration-architecture`
7. `k2m-sales-friction-walk`
8. `k2m-retention-architecture`
9. `k2m-referral-architecture`
10. `k2m-system-orchestrator`

This order keeps upstream truth and intelligence stable before downstream execution design, and it matches the student beachhead cascade in the PRD.

---

## Immediate Next Steps

If this architecture is accepted, the first implementation moves are:

1. finish Phase 0 Product Truth coverage for all audiences
2. harden the already-existing MCP surfaces that support live intelligence, audits, and workflow routing
3. scaffold the missing skill packages in the same order as the build sequence above
4. forward-test the student loop until content, friction, retention, and referral outputs are real, not just specified

---

*Use this document to decide what skills to build and how they should compose.*
