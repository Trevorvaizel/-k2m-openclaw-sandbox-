# K2M ClickUp Workflow Architecture
## Execution Layer For Belief Operations

*Status: reconciled against PRD v0.2 - 2026-04-10*

---

## Purpose

This document defines how ClickUp should be used inside the K2M belief operations system.

The rule remains:

> **Notion stores maps. ClickUp runs moves.**

So this document covers:

- how work should be organized in ClickUp
- how workflows become task structures
- which statuses and fields should exist
- how work should move between strategy, review, and execution

The canon still governs belief doctrine.
The PRD governs build order, evidence discipline, the 10-skill surface, and what downstream work must exist after a map change.

---

## Governing Principles

### 1. ClickUp is for action, not doctrine

Do not treat ClickUp as the place where the canonical truth lives.

ClickUp should hold:

- tasks
- workflow runs
- experiments
- fixes
- handoffs
- reviews

ClickUp is authoritative for Workflow Run execution state, assignment, due dates, and closure.
Notion may mirror that state for traceability, but it does not override it.

### 2. Every task should point back to the map

Every serious ClickUp task should link to:

- a Notion record
- a template artifact
- or a reviewed memo

No free-floating execution.

### 3. Workflow templates matter more than individual tasks

The system will scale only if recurring work becomes task templates and workflow templates.

### 4. Border failures need owners

If a border issue is detected, it should become a task sequence with explicit ownership.

### 5. ClickUp must carry the last-mile cascade

Map changes are not complete when the memo is written.
ClickUp must route the downstream work for:

- content production and publishing
- product friction fixes
- retention interventions
- referral asset production

### 6. Disconfirmation is a required handoff check, not a substitute for governance

If a ClickUp task can change Notion maps or product truth, it must include a disconfirmation step before governance handoff.

Passing disconfirmation does not make the change canonical.
The Decision Owner still accepts or rejects the change through the governance path.

---

## Proposed ClickUp Structure

This section describes the target ClickUp structure the docs should converge toward.
Current runtime truth for the live space name still belongs to `k2m-runtime-state.md` and `agent-handoff-log.md`.

Use one Space:

- `K2M Belief Operations`

Inside that space, create these Folders:

1. `00 Upstream Truth`
2. `01 Penetration`
3. `02 Sales`
4. `03 Retention`
5. `04 Referral`
6. `05 Border Repairs`
7. `06 Live Intelligence`
8. `07 Governance`

---

## Folder Design

### 00 Upstream Truth

Purpose:

- work related to product truth and territory truth before execution begins

Lists:

- `Product Truth Updates`
- `Belief Audits`
- `Topology Audits`
- `Authority Translation`

### 01 Penetration

Purpose:

- category belief, wedge, beachhead, and routing work

Lists:

- `Beachhead Entry`
- `Message Refresh`
- `Content Routing`
- `Content Production`

### 02 Sales

Purpose:

- trust verification, friction diagnosis, conversion improvements

Lists:

- `Sales Repairs`
- `Trust Gradient Audits`
- `Handoff Fixes`
- `Product Friction Fixes`

### 03 Retention

Purpose:

- onboarding, first-value, defining moments, identity deepening

Lists:

- `Retention Repairs`
- `Defining Moments`
- `Community Depth`

### 04 Referral

Purpose:

- advocacy, alumni proof, weak-tie assets, bridge-crossing design

Lists:

- `Referral Design`
- `Alumni Amplification`
- `Proof Asset Production`

### 05 Border Repairs

Purpose:

- concentrated work on failures between territories

Lists:

- `P-S Border`
- `S-R Border`
- `R-Rf Border`
- `Rf-P Border`
- `Truth-Territory Border`

### 06 Live Intelligence

Purpose:

- recurring sensing and map-refresh work

Lists:

- `Source Monitoring`
- `Map Update Runs`
- `Timing Alerts`
- `Coverage Tracking`

### 07 Governance

Purpose:

- reviews, approvals, schema changes, workflow maintenance

Lists:

- `Review Queue`
- `Canonical Change Requests`
- `Workflow Maintenance`

---

## Task Types

Use a custom field `Task Type` with values:

- `Workflow Run`
- `Audit`
- `Research Spike`
- `Asset Build`
- `Border Fix`
- `Review`
- `Map Update`
- `Experiment`
- `Maintenance`
- `Canonical Change Request`

This keeps reporting sane across folders.

---

## Standard Execution Status Model

Use a normalized execution status model across most lists.
Raw list-level statuses may vary, but live-status normalization should map them into:

- `Intake`
- `Scoped`
- `In Progress`
- `Blocked`
- `Awaiting Review`
- `Ready For Governance`
- `Complete`
- `Ready To Publish`
- `Published`
- `Archived`

### Rule

`Awaiting Review` means the work product is ready for operator or reviewer inspection inside the execution lane.
`Ready For Governance` means the task has the memo links, evidence bundle, and disconfirmation notes required to submit a map-affecting change for canonical review.
`Complete` means the execution authority has closed the task or Workflow Run.
`Published` is a list-specific extension for content or distribution tasks that actually shipped to a live surface.

Not all tasks reach `Published`.
Notion governance states such as `Approved` and `Canonical` do not replace ClickUp execution closure.

---

## Required Custom Fields

Every core list should include:

- `Audience`
- `Geography`
- `Territory`
- `Workflow`
- `Task Type`
- `Priority`
- `Owner`
- `Reviewer`
- `Notion Record`
- `Template Used`
- `Evidence Basis`
- `Evidence Tier`
- `Timing Window`
- `Map Update Required`
- `Border`
- `Decision Owner`
- `External Metric`

Optional fields for certain lists:

- `Cluster`
- `Bridge Node`
- `Threshold Band`
- `Offer`
- `Campaign`
- `Disconfirmation Linked`

---

## Workflow Templates

### 1. Beachhead Market Entry

Subtasks:

1. lock product truth
2. run belief audit
3. run topology audit
4. produce authority translation brief
5. define wedge
6. define category belief
7. define product belief
8. define routing plan
9. create first content briefs
10. run disconfirmation and execution review for any map-affecting claims
11. submit map-affecting outputs for governance decision and sync linked Notion records

### 2. Phase 0 Product Truth Alignment

Subtasks:

1. define student Product Truth deep record
2. define teacher Product Truth hypothesis
3. define principal Product Truth hypothesis
4. define B2B Product Truth hypothesis
5. log cross-audience conflicts
6. review and route open questions

### 3. Message Penetration Refresh

Subtasks:

1. run live market update
2. inspect language shifts
3. inspect topology shifts
4. inspect authority shifts
5. revise wedge
6. revise message routing
7. create revised content briefs
8. publish revised assets

### 4. Sales Repair

Subtasks:

1. fetch current offer and product truth
2. run trust gradient audit
3. run friction walk
4. map objections
5. diagnose handoff mismatch
6. route product and operational repairs
7. publish approved fixes

### 5. Retention Repair

Subtasks:

1. inspect first-value threshold
2. inspect onboarding friction
3. map defining moments
4. diagnose dropout points
5. propose recovery actions
6. capture proof and artifact requirements
7. publish approved changes

### 6. Retention To Referral Design

Subtasks:

1. identify peak experiences
2. identify proof objects
3. build referral story kit
4. map weak-tie crossings
5. produce share assets
6. route proof back into penetration
7. publish approved assets

### 7. Live Map Update

Subtasks:

1. collect current signals
2. summarize shifts
3. prepare memo
4. run disconfirmation review
5. submit memo, evidence bundle, and recommended change for governance review
6. on decision, update Notion and sync the Workflow Run mirror
7. create downstream tasks if needed

---

## Automation Rules

These are the minimum useful automations.

### Rule 1

If a `Map Update` task reaches `Ready For Governance` and `Map Update Required = Yes`, verify:

- the linked Notion memo exists
- the disconfirmation notes are attached or linked
- the impacted territories are named

Only after the Decision Owner records the governance decision should the canonical Notion record be updated and downstream execution tasks be opened.

### Rule 2

If a `Border Fix` task is created at high priority, automatically:

- assign reviewer
- link the relevant border dashboard entry
- create due date inside one review cycle

### Rule 3

If a Workflow Run reaches `Complete` or equivalent normalized closure state, ensure:

- the corresponding Notion Workflow Run mirror is linked and synced
- outputs are attached
- downstream handoff task is created if required
- any map-affecting decision is linked to the related memo or governance task

### Rule 4

If a timing window is near closing, escalate related tasks by:

- priority increase
- due date pull-forward
- reviewer notification

---

## Ownership Model

Every workflow run needs:

- one `Owner`
- one `Reviewer`
- one `Decision Owner`
- one evidence-tier field value

### Rule

Do not allow strategy tasks to stay ownerless in ClickUp.
An orphaned task is a silent system failure.

---

## Workflow Run Authority Boundary

Workflow Run tasks in ClickUp are the authoritative execution records.

- start, assignee, due date, status transitions, and closure are changed in ClickUp
- Notion Workflow Run records are sync summaries only
- if ClickUp and Notion disagree about Workflow Run closure, ClickUp wins and Notion must be re-synced

---

## Execution Review Cadence

Use these as queue and handoff cadences inside ClickUp.
They do not replace Notion governance re-review cadences or canonical decision authority.

- workflow runs: review per run; close when execution review and any required governance handoff are complete
- live intelligence tasks: weekly during active sensing loops
- border repairs: weekly while open
- product truth update tasks: within the current governance cycle or immediately after a material offer change
- workflow maintenance: monthly
- canonical change requests: create on demand; due date must land inside the next governance window owned by the Decision Owner

---

## ClickUp To Notion Sync And Governance Handoff Rules

### ClickUp -> Notion

Create or update Notion when:

- a Workflow Run changes material execution state or reaches `Complete`; sync the Notion Workflow Run mirror from ClickUp
- a memo has completed disconfirmation and the Decision Owner has approved a map change
- a new artifact becomes reusable
- a coverage snapshot is refreshed

### Notion -> ClickUp

Create ClickUp work when:

- a map update changes a belief statement
- a border issue becomes high severity
- a timing window opens
- a canonical record is marked `Needs Refresh`
- content production is required for a new wedge or shift
- product friction requires a fix on a live surface

---

## Reporting Views

Create these ClickUp dashboard views:

- `Open High Priority`
- `By Territory`
- `By Audience`
- `By Border`
- `Timing Window Sensitive`
- `Awaiting Review`
- `Published This Cycle`
- `External Metric Impact`

---

## Implementation State

Supported directly by the current repo-local MCP layer:

- discovery of live ClickUp structure
- workflow-run task creation from canonical templates
- border-fix task creation
- canonical change request creation
- live status normalization

Current live gap:

- some existing student tasks still lack the intended custom-field completeness
- the docs should treat the custom-field model as target architecture with partial live adoption, not as fully enforced reality

---

## Minimum Viable Setup

If K2M wants the smallest useful ClickUp implementation, start with:

1. Space: normalize the live execution space toward `K2M Belief Operations` if and when the runtime rename is actually performed; until then, defer to runtime-state docs for the live space name
2. Folders:
   - `00 Upstream Truth`
   - `01 Penetration`
   - `02 Sales`
   - `03 Retention`
   - `04 Referral`
   - `05 Border Repairs`
   - `06 Live Intelligence`
   - `07 Governance`
3. Standard statuses with live-status normalization
4. Required custom fields, knowing some are still not fully enforced on legacy tasks
5. Workflow templates for:
   - Phase 0 Product Truth Alignment
   - Beachhead Market Entry
   - Sales Repair
   - Live Map Update

That is enough to begin running the system.

---

## Canonical Rule

If Notion answers "what is true right now?",
ClickUp answers "what are we doing next because of that truth?"

If a ClickUp structure does not help answer that question, it is probably unnecessary.

---

*Use this document to build the execution layer for K2M belief operations.*
