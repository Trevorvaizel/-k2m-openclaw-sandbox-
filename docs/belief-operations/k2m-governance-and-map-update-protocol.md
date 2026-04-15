# K2M Governance And Map Update Protocol
## Evidence, Authority, And Canonical Change Control

*Status: reconciled against PRD v0.2 - 2026-04-10*

---

## Purpose

This document defines how K2M should govern changes to its belief maps, topology maps, product truth, and operating doctrine.

The goal is simple:

- keep the maps current
- prevent random AI-session drift
- make evidence thresholds explicit
- make update authority explicit

This protocol now explicitly includes:

- disconfirmation before canonical promotion
- external market metrics as the final reality check
- kill authority for final human override

This document is authoritative for review cadence and canonical promotion rules. Downstream docs must reference it rather than redefining governance state or cadence.

---

## Governing Principle

No doctrine should become canonical because one person had a persuasive thought.

Canonical changes require:

- evidence
- review
- named authority
- versioned change records
- disconfirmation for major synthesis outputs

---

## What This Protocol Governs

Use this protocol for changes to:

- Layer 0 product truth
- Layer 1 belief maps
- Layer 1 topology maps
- timing-window maps
- workflow doctrine
- reusable proof and artifact standards

Do not use this protocol for:

- routine execution tasks
- raw data collection
- disposable brainstorming notes

---

## Evidence Tiers

Use one evidence vocabulary across the system.

| Tier | Name | Definition | Canonical weight |
|---|---|---|---|
| `E0` | Assertion | unsupported opinion or single-session synthesis | none |
| `E1` | Anecdotal signal | one-off anecdote, isolated quote, single raw source | weak |
| `E2` | Repeated signal | multiple similar observations across separate sources or sessions | moderate |
| `E3` | Reviewed pattern | repeated signal with reviewed source links and coherent interpretation | strong |
| `E4` | First-party confirmation | confirmed through K2M first-party behavior, conversion, retention, or referral evidence | very strong |

### Rule

`E5` is not a raw evidence tier.
Canonical state is a governance outcome, not an evidence grade.

## Governance And Canonical States

Use these states for reviewed records.

| State type | Values | Meaning |
|-----------|--------|---------|
| `review_state` | `draft`, `in_review`, `approved` | Review lifecycle for a record under governance |
| `canonical_state` | `candidate`, `canonical`, `deprecated` | Promotion outcome for a reviewed record |

Rules:

- `review_state` advances forward only.
- `canonical_state` is set only after review and disconfirmation pass.
- `canonical_state = canonical` does not replace evidence tiering.
- Downstream docs must not reuse `E5` to mean canonical state.

---

## Minimum Evidence Required By Change Type

### Product truth change

Minimum:

- `E3` plus one `E4`
- or two independent `E4` signals

### Belief-map change

Minimum:

- `E3`

### Topology-map change

Minimum:

- `E3`
- plus recent source coverage across more than one cluster where possible

### Timing-window change

Minimum:

- `E2` for draft alert
- `E3` for canonical operating change

### Workflow doctrine change

Minimum:

- `E3`
- plus evidence from at least one real workflow run

---

## Roles And Update Authority

### Core roles

- `Author`: drafts a proposed change
- `Reviewer`: checks evidence quality, coherence, and scope
- `Decision Owner`: accepts or rejects the change
- `Map Steward`: maintains version history and canonical state

### Authority rules

#### Product truth

Decision Owner:

- founder / product lead / explicitly delegated strategy owner

Reviewer:

- one strategic reviewer not identical to the author

#### Belief maps

Decision Owner:

- territory lead or strategy owner

Reviewer:

- one reviewer with source familiarity

#### Topology maps

Decision Owner:

- network / market strategy owner

Reviewer:

- one reviewer who understands the underlying source graph

#### Timing windows

Decision Owner:

- campaign or territory lead

Reviewer:

- one operator close to execution

#### Workflow doctrine

Decision Owner:

- systems owner

Reviewer:

- one operator who has run the workflow

### Non-negotiable rule

The same person should not be:

- author
- reviewer
- and decision owner

for the same canonical change.

### Kill authority

Trevor may reject, defer, or delete any agent-produced output regardless of its claimed confidence.
Agent confidence is not evidence.

---

## Review Cadence

This cadence is authoritative. Other docs must match it verbatim rather than inventing alternate review windows.

Use these default cadences unless the beachhead requires tighter loops.

| Record type | Review cadence |
|---|---|
| Product truth | quarterly or after material offer change |
| Belief maps | monthly for active audiences |
| Topology maps | monthly for active beachheads |
| Timing windows | weekly during active cycles |
| Workflow doctrine | monthly |
| Border issues | weekly while open |

### Event-based review triggers

Trigger an off-cycle review when:

- conversion drops sharply
- retention drops sharply
- a major timing window opens or closes
- an adjacent competitor reframes the category
- first-party signals contradict the current map
- a new bridge node or cluster materially changes routing logic
- cohort application rate drops materially
- DM reply rate drops materially

---

## Conflict Resolution

Map conflicts are normal.
Silent unresolved conflicts are not.

### Conflict types

- source conflict
- interpretation conflict
- timeframe conflict
- geography conflict
- audience-scope conflict

### Resolution order

1. Verify the evidence references.
2. Check whether the two claims actually refer to different audiences, places, or timeframes.
3. Prefer first-party evidence over public inference when they conflict on current behavior.
4. If still unresolved, downgrade the map item to `Approved` or `Needs Refresh` instead of `Canonical`.
5. Open a `Canonical Change Request` in ClickUp and log the dispute in Notion.

### Rule

When evidence is conflicting, lower certainty before forcing consensus.

---

## Canonical Map Change Process

Use this sequence for any real map change.

### Step 1: Detect

The change is detected through:

- live market intelligence
- workflow review
- border issue diagnosis
- first-party behavior

### Step 2: Draft

Create or update:

- a `Map Update Memo` in Notion
- and a related review task in ClickUp

The memo must state:

- what changed
- what evidence supports the change
- what part of the map is affected
- what downstream workflows are likely affected

### Step 3: Grade

Assign:

- evidence tier
- confidence level
- scope of impact

### Step 4: Review

Reviewer checks:

- source quality
- interpretation quality
- overlap with current canonical maps
- downstream impact
- whether external success metrics support or contradict the proposed conclusion

### Step 5: Disconfirm

Before a major synthesis output is promoted toward canonical state, run an adversarial review from a separate agent context or reviewer stance. Promotion cannot continue without a recorded disconfirmation pass.

Disconfirmation checks:

- what evidence would falsify this conclusion?
- are we confusing repeated AI agreement with real evidence?
- do first-party signals contradict public-signal inference?
- if this change were true, what downstream metric should move?

### Step 6: Decide

Decision Owner marks the proposal as:

- `Reject`
- `Approve for use`
- `Promote to canonical`
- `Defer pending more evidence`

### Step 7: Publish

If approved:

- update the target Notion record
- preserve the previous state in version history or memo links
- create downstream ClickUp tasks if execution changes are required
- refresh the coverage tracker if the change alters current-state confidence

### Step 8: Propagate

If the change affects live work, trigger:

- message refresh
- sales repair
- timing-window response
- retention adjustment
- or referral asset updates

The propagation step is incomplete if it stops at documentation.
Canonical changes must reach the relevant last-mile workflow.

---

## External Reality Override

The final anti-sycophancy safeguard is the market itself.

If internal maps, memos, and reviews all say a change is "correct" but cohort application rate and DM reply rate do not improve or materially worsen, governance must reopen the conclusion.

Internal coherence never outranks external response.

---

## Canonical Vs Draft Artifact Rules

### Draft artifact

Use when:

- the map is still being explored
- the evidence is below canonical threshold
- the output is for hypothesis testing

### Approved artifact

Use when:

- the artifact is fit for active workflow use
- but not yet stable enough to be doctrinal

### Canonical artifact

Use when:

- the artifact reflects current source of truth
- the evidence threshold is met
- review dates are set

### Deprecated artifact

Use when:

- the artifact is no longer current
- but should remain accessible for historical comparison

---

## Versioning Rules

Every canonical change should preserve:

- previous statement
- new statement
- reason for change
- evidence links
- effective date
- owner and reviewer

Do not silently overwrite canonical doctrine.

---

## Notion And ClickUp Implementation

### Notion

Use:

- `Map Update Memos`
- `Belief Maps`
- `Topology Maps`
- `Product Truth Registry`
- `Border Issue Log`
- `Workflow Runs`
- `Evidence Sources`
- `Coverage Tracker`

### ClickUp

Use:

- `Canonical Change Requests`
- `Review Queue`
- downstream repair or refresh tasks
- border-fix tasks

### Rule

Notion records the decision.
ClickUp operationalizes the consequences.

Current implementation note:

- the repo-local MCP layer already supports workflow-run upserts, map-update memo upserts, evidence-source upserts, coverage updates, canonical change requests, and border-fix creation
- disconfirmation is a required gate in this model and must be enforced by the runtime implementation before canonical promotion

---

## Minimum Viable Governance Setup

If K2M wants the smallest workable governance system, start with:

1. evidence tiers
2. named roles
3. fixed review cadence
4. map update memo requirement
5. canonical change request workflow

That is enough to stop drift.

---

## Canonical Rule

If the map changes how K2M speaks, targets, sequences, or routes work, the change must pass through this protocol.

---

*Use this document to keep the K2M belief operations system coherent as it learns.* 
