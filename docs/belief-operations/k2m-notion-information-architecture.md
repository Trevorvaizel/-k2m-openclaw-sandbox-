# K2M Notion Information Architecture
## Canonical Maps, Reviews, And Decision Records

*Status: reconciled against PRD v0.2 - 2026-04-10*

---

## Purpose

This document defines how Notion should be used inside the K2M belief operations system.

The rule is unchanged:

> **Notion stores maps. ClickUp runs moves.**

So this document covers:

- what information belongs in Notion
- how canonical records should be structured
- which databases should exist
- which properties and relations matter
- how review and approval should work

It does not cover raw scraping storage or task execution.

The canon governs belief doctrine.
The PRD governs what records must exist, what evidence thresholds matter, and what the student beachhead must prove before expansion.

---

## Governing Principles

### 1. Notion is for reviewed knowledge, not raw exhaust

Do not store large volumes of scraped raw data in Notion.

Notion should hold:

- reviewed summaries
- canonical maps
- evidence-backed hypotheses
- approved decisions
- reusable artifacts

Raw records belong in a database or warehouse.

### 2. Canonical and draft records must be separated

Every important record must clearly show whether it is:

- draft
- under review
- approved
- canonical
- needs refresh
- deprecated

### 3. Every canonical statement needs traceable evidence and a separate governance state

No canonical belief statement, topology conclusion, or map-affecting decision should exist without:

- linked evidence
- evidence tier (`E0` to `E4`)
- governance state (`Draft`, `In Review`, `Approved`, `Canonical`, `Needs Refresh`, or `Deprecated`)
- owner
- review date
- next review date

`Canonical` is a governance state, not an evidence tier.
Do not store `E5` in an `Evidence Tier` field.

### 4. Workflow Runs in Notion are mirrors, not execution authorities

Workflow Runs may exist in Notion so maps, memos, artifacts, and border issues can point to real execution.

They are sync summaries of ClickUp execution state.

ClickUp owns:

- assignment
- due dates
- execution status
- closure

Notion may mirror that state for traceability, but it should not author or close a Workflow Run independently.

### 5. Database relations matter more than page prose

The goal is not just to write pages.
The goal is to build an information graph:

- product truth linked to audiences
- audiences linked to belief maps
- belief maps linked to topology maps
- topology maps linked to workflows
- workflows linked to artifacts
- artifacts linked to border issues and map updates

---

## Top-Level Notion Structure

Create one parent page:

- `K2M Belief Operations`

Inside it, keep three layers:

1. **Canonical Maps**
2. **Review Queues**
3. **Reference Libraries**

The databases below should live under that parent.

---

## Core Databases

### 1. Product Truth Registry

**Purpose**

Store the approved Layer 0 truth set for each offer and audience.

**Primary record**

One record per product / audience / offer combination.

**Key properties**

- `Title`
- `Offer`
- `Audience`
- `Geography`
- `Philosophy`
- `Product Kernel`
- `Product Identity`
- `Bridge Identity`
- `Category Belief`
- `Product Belief`
- `Beachhead Payoff`
- `Proof Object`
- `Evidence Basis`
- `Evidence Tier`
- `Governance State`
- `Owner`
- `Reviewer`
- `Approved By`
- `Reviewed On`
- `Next Review`

**Relations**

- related `Audience Segment`
- related `Belief Map`
- related `Topology Map`
- related `Artifact Library`
- related `Map Update Memo`

### 2. Audience Segments

**Purpose**

Keep one normalized record per audience segment.

**Examples**

- Form 4 leavers
- university students
- teachers
- principals
- parents
- early-career professionals

**Key properties**

- `Title`
- `Geography`
- `Primary Trigger Problem`
- `Core Self-Verdict`
- `Awareness Stage`
- `Current Priority`
- `Validation Status`
- `Audience State`
- `Slice Build State`
- `Owner`

**Relations**

- related `Product Truth Registry`
- related `Belief Maps`
- related `Topology Maps`
- related `Timing Window Register`

### 3. Belief Maps

**Purpose**

Store reviewed belief architecture for one audience at one point in time.

**Key properties**

- `Title`
- `Audience`
- `Push`
- `Pull`
- `Anxiety`
- `Habit`
- `Surface Problem`
- `Root Problem`
- `Identity Problem`
- `Self-Verdict`
- `Failed Promises`
- `Open Loops`
- `Awareness Stage`
- `Category Belief Hypothesis`
- `Product Belief Hypothesis`
- `Evidence Basis`
- `Evidence Tier`
- `Governance State`
- `Owner`
- `Reviewer`
- `Reviewed On`
- `Next Review`

**Relations**

- related `Audience Segment`
- related `Map Update Memo`
- related `Evidence Sources`
- related `Workflow Runs`

### 4. Topology Maps

**Purpose**

Store reviewed network topology conclusions for one audience.

**Key properties**

- `Title`
- `Audience`
- `Primary Cluster`
- `Bridge Nodes Summary`
- `Mavens Summary`
- `Connectors Summary`
- `Threshold Bands Summary`
- `Nodes Count or Summary`
- `Bridges Count or Summary`
- `Cascade Path`
- `Main Stall Point`
- `Evidence Basis`
- `Evidence Tier`
- `Governance State`
- `Owner`
- `Reviewer`
- `Reviewed On`
- `Next Review`

**Relations**

- related `Audience Segment`
- related `Node Registry`
- related `Bridge Registry`
- related `Map Update Memo`
- related `Workflow Runs`

### 5. Node Registry

**Purpose**

Store high-value nodes identified in the market.

**Key properties**

- `Name`
- `Node Type`
- `Audience`
- `Primary Cluster`
- `Secondary Cluster`
- `Platform`
- `Credibility Rating`
- `Bridge Potential`
- `Threshold Relevance`
- `Notes`
- `Owner`

**Relations**

- related `Topology Map`
- related `Bridge Registry`
- related `Workflow Runs`

### 6. Bridge Registry

**Purpose**

Store the cluster-to-cluster bridges K2M should care about.

**Key properties**

- `Title`
- `From Cluster`
- `To Cluster`
- `Bridge Node`
- `Why It Matters`
- `Strength`
- `Current Evidence`
- `Next Test`

**Relations**

- related `Node Registry`
- related `Topology Map`

### 7. Timing Window Register

**Purpose**

Track the windows that make messaging or offers more likely to land.

**Key properties**

- `Title`
- `Audience`
- `Window Type`
- `Trigger Event`
- `Window Opens`
- `Window Closes`
- `Confidence`
- `Recommended Action`
- `Governance State`
- `Owner`

**Relations**

- related `Audience Segment`
- related `Map Update Memo`
- related `Workflow Runs`

### 8. Artifact Library

**Purpose**

Store reusable proof objects and transformation evidence.

This library can also hold approved content briefs, referral assets, and product-fix evidence when those outputs need durable retrieval.

**Key properties**

- `Title`
- `Artifact Type`
- `Audience`
- `Territory`
- `Proof Strength`
- `Public Shareable`
- `Usage Notes`
- `Governance State`
- `Owner`

**Relations**

- related `Product Truth Registry`
- related `Workflow Runs`
- related `Border Issue Log`

### 9. Map Update Memos

**Purpose**

Store reviewed updates from the live intelligence layer.

**Key properties**

- `Title`
- `Audience`
- `What Changed`
- `Belief Shift`
- `Topology Shift`
- `Timing Shift`
- `Recommended Update`
- `Evidence Strength`
- `Disconfirmation Summary`
- `External Metric Hypothesis`
- `Governance State`
- `Owner`
- `Reviewed By`
- `Decision Owner`
- `Reviewed On`

**Relations**

- related `Belief Map`
- related `Topology Map`
- related `Timing Window Register`
- related `Evidence Sources`
- related `Workflow Runs`

### 10. Workflow Runs

**Purpose**

Store a synced summary of major workflow executions after the authoritative ClickUp task exists.

These records mirror ClickUp execution state so maps, memos, and artifacts can reference the run without turning Notion into a second execution authority.

**Key properties**

- `Title`
- `ClickUp Task ID`
- `Workflow Type`
- `Audience`
- `Territory`
- `Execution Status`
- `Sync Status`
- `Owner`
- `Reviewer`
- `Decision Owner`
- `Started On`
- `Completed On`
- `Last Synced From ClickUp`
- `Summary`
- `Decision`

**Relations**

- related `Belief Map`
- related `Topology Map`
- related `Map Update Memo`
- related `Artifact Library`
- related `Border Issue Log`

**Authority rule**

Do not close, reopen, or re-stage Workflow Runs from Notion.

If ClickUp and Notion disagree about Workflow Run execution state, ClickUp is authoritative and the Notion record must be re-synced.

### 11. Border Issue Log

**Purpose**

Store reviewed failures at the borders between territories.

**Key properties**

- `Title`
- `Border`
- `Failure Pattern`
- `Current Symptoms`
- `Severity`
- `Owner`
- `Governance State`
- `Detected On`
- `Next Review`

**Relations**

- related `Artifact Library`
- related `Workflow Runs`
- related `Map Update Memo`

### 12. Evidence Sources

**Purpose**

Store reviewed source summaries, not raw source dumps.

**Key properties**

- `Title`
- `Source Type`
- `URL or Identifier`
- `Audience`
- `Date Observed`
- `Signal Class`
- `Summary`
- `Reliability`
- `Evidence Tier`
- `Governance State`
- `Owner`

**Relations**

- related `Belief Map`
- related `Topology Map`
- related `Map Update Memo`

### 13. Coverage Tracker

**Purpose**

Track whether the system is actually current enough to trust.

This is a page or lightweight log updated by the MCP layer, not necessarily a full database.

**Key fields**

- `Build Percent`
- `Coverage Percent`
- `Freshness Percent`
- `Cadence Percent`
- `Summary`
- `Updated On`

`Cadence Percent` measures adherence to required sensing and governance refresh cycles.
It does not mean ClickUp execution stayed busy.

---

## State Models

### Governance State

Use one shared governance vocabulary across reviewed Notion records:

- `Draft`
- `In Review`
- `Approved`
- `Canonical`
- `Deprecated`
- `Needs Refresh`

### Rule

`Approved` means reviewed and accepted for near-term use.
`Canonical` means stable enough to be treated as current source of truth.

Not every approved item should become canonical.

### Evidence Tier

Use evidence tiers separately from governance state:

- `E0`
- `E1`
- `E2`
- `E3`
- `E4`

`Canonical` is not an evidence tier.
Do not encode it as `E5` in an `Evidence Tier` property.

### Workflow Run mirror state

Workflow Runs in Notion do not use governance state as their execution authority.

Use:

- `Execution Status` -> normalized status mirrored from ClickUp
- `Sync Status` -> `Pending Sync`, `In Sync`, or `Drift Detected`

If ClickUp and Notion disagree about Workflow Run closure, ClickUp wins and Notion must be reconciled.

---

## Review Model

### Roles

- `Owner`: person or agent responsible for creating or updating the record
- `Reviewer`: person responsible for checking evidence and coherence
- `Approver`: person authorized to elevate the record to canonical

### Governance re-review cadences

Use the cadence in [k2m-governance-and-map-update-protocol.md](./k2m-governance-and-map-update-protocol.md) as the authority:

- Product truth: quarterly or after material offer change
- Belief maps: monthly for active audiences
- Topology maps: monthly for active beachheads
- Timing windows: weekly during active cycles
- Border issues: weekly while open
- Workflow Runs in Notion: no standalone governance cadence; sync on material ClickUp status change and on closure
- Coverage Tracker: refresh after material governance decisions and after completed runs that change map confidence

### Canonical promotion rule

A record becomes canonical only if:

- evidence is linked
- the evidence tier is appropriate for the claim being made
- owner and reviewer are named
- governance state is `Approved`
- next review date is set

Directional E1-E2 evidence can justify investigation or a draft memo.
Canonical promotion is a governance decision, not an evidence-tier upgrade.
It should generally require reviewed evidence at E3+ and stronger thresholds for Layer 0 changes.

---

## Views To Create

### Product Truth Registry

- `Canonical Only`
- `Needs Refresh`
- `By Audience`

### Belief Maps

- `In Review`
- `Canonical By Audience`
- `Open Loops`

### Topology Maps

- `Bridge Nodes`
- `Threshold Bands`
- `Needs Review`

### Timing Window Register

- `Open Now`
- `Closing Soon`
- `By Audience`

### Border Issue Log

- `Open High Severity`
- `By Border`
- `Needs Review`

### Coverage Tracker

- `Latest Snapshot`
- `Freshness Drift`
- `Cadence Drift`

---

## Templates To Attach

Each database should use the corresponding template from [templates/](./templates/):

- Product truth -> `k2m-product-truth-sheet.md`
- Belief map -> `k2m-belief-audit-template.md`
- Beachhead brief -> `k2m-beachhead-belief-brief-template.md`
- Topology map -> `k2m-network-topology-audit-template.md`
- Border log -> `k2m-border-diagnostics-dashboard.md`

These templates define the content shape.
The Notion databases define the operating graph.

---

## MCP Usage Rules

When agents interact with Notion:

1. Fetch before writing.
2. Update existing canonical records instead of duplicating them unless a new version is truly needed.
3. Never overwrite a canonical statement without linking evidence and leaving a map update memo.
4. Treat Notion as reviewed knowledge, not scratch space.
5. Do not promote E1-E2 directional signals directly into canonical Product Truth or canonical Belief/Topology Maps.
6. Always leave a ClickUp workflow-run task and, for consequential map changes, a Notion map update memo trail.

---

## Implementation State

Supported directly by the current repo-local MCP layer:

- Product Truth
- Belief Maps
- Topology Maps
- Workflow Run mirror upserts
- Evidence Sources
- Map Update Memos
- Coverage Tracker updates

Documented here but not yet clearly implemented as first-class MCP write surfaces:

- Node Registry
- Bridge Registry
- Timing Window Register as a dedicated workflow-managed record

Keep these in the IA because they are structurally correct, but mark them as **NOT YET FULLY IMPLEMENTED** in downstream build planning.

---

## Minimum Viable Setup

If K2M wants the smallest workable Notion setup, start with:

1. Product Truth Registry
2. Audience Segments
3. Belief Maps
4. Topology Maps
5. Evidence Sources
6. Workflow Run mirrors
7. Map Update Memos
8. Coverage Tracker
9. Artifact Library
10. Border Issue Log

That is enough to keep the maps coherent.

---

## Canonical Rule

If a record changes how K2M thinks, speaks, prioritizes, or routes work, it belongs in Notion.

If it is just raw evidence, logs, or high-volume machine output, it does not.

---

*Use this document to build the Notion side of the K2M belief operations system.*
