---
tags:
  - type/moc
  - domain/product
  - category/practice
aliases:
  - "K2M Product Intake Ledger"
  - "Product Docs Intake Ledger"
---

# K2M Product Docs Intake Ledger

> Operational ledger for product-doc ingestion. This is stricter than [[coverage-ledger]]: a source is not "done" here unless its durable product knowledge has been intentionally extracted or explicitly deferred.

## Current Verdict

We now have a real three-pass loop.

- Pass 1 spine is complete for the product brief, the system layer, and the major playbook sections.
- Pass 2 is now established across planning docs, ops checklists, the full design-and-architecture set, and the durable playbook internals, including the manual human-backstop layer.
- Pass 3 has now started on the product/playbook seam: the first hardened contradiction is that human-ops load and review cadence differ between system-facing docs and Cohort 1 playbook docs.
- The second hardened seam is data authority: the source base defines a Sheets-enrollment / PostgreSQL-runtime contract, but the operational docs still describe partial reconciliation, manual override guards, and manual launch checks.
- The third hardened seam is onboarding and parent-proof sequencing: canonical onboarding says Stop 0 comes after Stops 1-3, while some older/system docs still narrate it earlier; weekly parent-update cadence is also inconsistent across system and playbook layers.
- The fourth hardened seam is onboarding recovery: design docs describe re-entry and waiting-room recovery patterns, but the system docs still treat DM-disabled onboarding as a known manual-recovery gap rather than a fully solved automation path.
- The fifth hardened seam is consent-state normalization: system docs describe a two-mode parent update surface, while the manual SOP layer still carries a temporary "not sure yet" state handled as deferred consent.
- The sixth hardened seam is scale truth: parts of the playbook and design layer still model a 200-student system, while launch-specific decisions cap Cohort 1 at 30 students, so current scale claims must be read as mixed ambition and launch reality.
- Reviews, summaries, and task notes remain evidence, not product truth, unless a later pass deliberately promotes them.

## Three-Pass Loop

| Pass | Purpose | Rule |
|---|---|---|
| Pass 1 | Establish spine | Create only broad, load-bearing notes and maps so retrieval has structure before detail. |
| Pass 2 | Deepen durable knowledge | Extract stable concepts, mechanisms, contradictions, and product truths from the spine areas. |
| Pass 3 | Harden and reconcile | Adversarial review, contradiction handling, evidence weighting, and cleanup of anything too vague or overstated. |

## Scope Snapshot

| Track | File Count | Pass 1 | Pass 2 | Pass 3 |
|---|---:|---|---|---|
| `docs/product-docs/k2m-layer4-product-brief.md` | 1 | done | selective review later | harden later |
| `docs/product-docs/system/` | 7 | done | queued | in progress |
| `docs/product-docs/cohort-design-artifacts/playbook-v2/` | 35 | done as spine | done | in progress |
| `docs/product-docs/cohort-design-artifacts/design-and-architecture/` | 13 | queued | done | in progress |
| `docs/product-docs/cohort-design-artifacts/requirements/` | 1 | MOC-only | done | queued |
| `docs/product-docs/cohort-design-artifacts/strategy-and-research/` | 1 | MOC-only | done | queued |
| `docs/product-docs/cohort-design-artifacts/operations/checklists/` | 2 | queued | done | queued |
| `docs/product-docs/cohort-design-artifacts/reviews/` | 24 | intentionally deferred | evidence only | hardening input |
| `docs/product-docs/cohort-design-artifacts/summaries/` | 10 | intentionally deferred | evidence only | hardening input |
| `docs/product-docs/cohort-design-artifacts/task-notes/` | 42 | intentionally deferred | evidence only | hardening input |
| `docs/product-docs/cohort-design-artifacts/operations/sprint/task-notes/` | 76 | intentionally deferred | evidence only | hardening input |

## Step Sequence

Use this sequence. Do not jump into reviews or task notes until the higher-precedence layers are stable.

| Step | Scope | Status | Exit Condition |
|---|---|---|---|
| 1 | Product brief | done | Product kernel and bridge notes exist in atlas. |
| 2 | System overview + student journey | done | Current vessel and learner loop notes exist in atlas. |
| 3 | Remaining system docs: facilitator guide, super admin ops, under the hood, observability, README | done | Remaining system docs extracted; README intentionally left MOC-only as routing surface. |
| 4 | Playbook v2 philosophy | done | Core guardrails, JTBD integration, node architecture, and four habits are mapped into first-pass spine notes. |
| 5 | Playbook v2 weekly design | done | Week structure and progression logic are captured in a first-pass spine note. |
| 6 | Playbook v2 sessions | done | Live scripts, prompt system, and session mechanics are captured in a first-pass spine note. |
| 7 | Playbook v2 CIS agents | done | Agent orchestration is captured in a first-pass spine note. |
| 8 | Playbook v2 Discord ops | done | Discord ops are captured in a first-pass spine note. |
| 9 | Playbook v2 artifact system | done | Artifact proof logic is captured in a first-pass spine note. |
| 10 | Design-and-architecture docs | done | Core facilitation, onboarding, context, community, runtime, and launch truths extracted into stable atlas notes. |
| 11 | Operations checklists | done | Launch and template deployment doctrine extracted into stable atlas notes. |
| 12 | Requirements + strategy docs | done | Durable planning truths extracted into stable atlas notes. |
| 13 | Reviews, summaries, task notes, archives, exports | later | Pull in only when needed for adversarial review, contradiction checks, or evidence trails. |

## Pass 1 Complete

- [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]]
- [[docs/product-docs/system/01-system-overview|System Overview]]
- [[docs/product-docs/system/02-student-journey|Student Journey]]
- [[docs/product-docs/system/03-facilitator-guide|Facilitator Guide]]
- [[docs/product-docs/system/04-super-admin-ops|Super Admin Ops]]
- [[docs/product-docs/system/05-under-the-hood|Under The Hood]]
- [[docs/product-docs/system/06-observability|Observability]]
- `docs/product-docs/cohort-design-artifacts/playbook-v2/01-philosophy/`
- `docs/product-docs/cohort-design-artifacts/playbook-v2/02-weekly-design/`
- `docs/product-docs/cohort-design-artifacts/playbook-v2/03-sessions/`
- `docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/`
- `docs/product-docs/cohort-design-artifacts/playbook-v2/05-discord-ops/`
- `docs/product-docs/cohort-design-artifacts/playbook-v2/06-artifacts/`

## Pass 2 Queue

- none; next work is Pass 3 hardening and contradiction review across the extracted product and playbook notes

## Pass 2 Extracted So Far

- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/agent-facilitation-decision-log|Agent Facilitation Decision Log]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/cohort-facilitation-redesign-decisions|Cohort Facilitation Redesign Decisions]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/context-engine-experience-design|Context Engine Experience Design]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/discord-community-culture-and-architecture|Discord Community Culture And Architecture]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/adversarial-pre-mortem-onboarding-journey-2026-03-04|Adversarial Pre-Mortem Report: Student Onboarding & Enrollment Journey]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/experience-design-evaluation-party-mode-2026-01-24|Experience Design Evaluation Party Mode]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/onboarding-context-canonical-v3|Onboarding + Context Canonical V3]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-launch-gaps-and-solutions|Pre-Launch Gaps And Solutions]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/student-onboarding-and-enrollment-flow|Student Onboarding And Enrollment Flow]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-mortem-2026-03-04-decisions|Pre-Mortem Decisions Log]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-mortem-session-4-decisions|Pre-Mortem Decisions Log - Session 4]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/provider-runtime-override|Provider Runtime Override]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/solutions-and-new-automations|Solutions And New Automations]]
- [[docs/product-docs/cohort-design-artifacts/operations/checklists/cohort-production-go-live-checklist|Cohort Production Go-Live Checklist]]
- [[docs/product-docs/cohort-design-artifacts/operations/checklists/cohort-template-deployment-checklist|Cohort Template Deployment Checklist]]
- [[docs/product-docs/cohort-design-artifacts/requirements/cohort-playbook-v2-requirements|Cohort Playbook V2 Requirements]]
- [[docs/product-docs/cohort-design-artifacts/strategy-and-research/k2m-product-roadmap-and-marketing-evolution-strategy|Roadmap And Marketing Evolution Strategy]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-1-cis-controller-logic|CIS Controller Logic]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-2-framer-agent-prompt|Framer Agent Prompt]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-3-explorer-agent-prompt|Explorer Agent Prompt]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/examples/jtbd-relevant-examples-zone-2-3|JTBD Relevant Examples Zone 2-3]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/06-artifacts/06-artifact-system-epic-6-unified-design|Artifact System Unified Design]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/02-weekly-design/week-8-artifact-showcase|Week 8 Artifact Showcase]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-7-discord-bot-spec|Discord Bot Spec]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/05-discord-ops/5-3-thinking-showcase-setup|Thinking Showcase Setup]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/05-discord-ops/5-6-manual-sops|Manual SOPs]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/operations/escalation-playbook-v1|Trevor's 10% Escalation Playbook]]

## Deferred Evidence

- `docs/product-docs/cohort-design-artifacts/reviews/`
- `docs/product-docs/cohort-design-artifacts/summaries/`
- `docs/product-docs/cohort-design-artifacts/task-notes/`
- `docs/product-docs/cohort-design-artifacts/operations/sprint/task-notes/`
- `docs/product-docs/cohort-design-artifacts/archive/`
- `docs/product-docs/cohort-design-artifacts/exports/`

## Working Rule

When we say a product-doc area is complete, it should mean one of three things:

1. Pass 1: the area has a disciplined spine in atlas notes and MOCs.
2. Pass 2: the durable product truth has been extracted into stable notes linked from [[moc-k2m-product]] or [[moc-k2m-playbook-spine]].
3. Pass 3: the area has been checked for contradictions, overclaims, and evidence quality.

Anything else is still in progress.

## Related

- [[moc-k2m-product]]
- [[moc-k2m-playbook-spine]]
- [[coverage-ledger]]

Source:
- `docs/product-docs/`
