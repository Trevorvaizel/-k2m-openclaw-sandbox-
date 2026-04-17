---
tags:
  - type/atomic
  - category/practice
  - domain/product
  - domain/collaboration
  - layer/mechanics
aliases:
  - "Cohort Launch Gating"
  - "Go Live Gating"
---

# Cohort Launch Gating

## Purpose

Cohort launch gating is the operating discipline that prevents K2M from treating a cohort as live until template deployment, runtime health, permissions, data state, and announcement surfaces have all been checked in sequence.

## Process

The launch discipline has two layers:

1. Template deployment for a new cohort server and runtime.
2. Production go-live gates for the active cohort.

The important pattern is not the exact commands. It is the refusal to improvise the launch path. Runtime health, clean database state, permissions, invite readiness, cohort dates, and public announcement all have to be verified before the system is considered live. The same discipline also separates what automation must build from what Trevor must still manually prepare before launch, and it requires at least one end-to-end smoke test before launch claims are trusted.

## Result

The result is a cohort that starts from a known-good baseline instead of from whatever operational shortcuts happened that day.

## When To Use

Use this note when asking:

- What has to be true before a cohort is actually live?
- How do we distinguish template setup from real production readiness?
- Which launch failures are avoided only because a go/no-go gate exists?

## Failure Mode

The failure mode is silent improvisation: the server exists, but the bot, permissions, data state, or invite surface are not actually ready, and the student experiences a broken first impression.

## Related

- [[moc-k2m-product]]
- [[single-cohort-ops-surface]]
- [[value-first-onboarding-architecture]]

Source:
- [[docs/product-docs/cohort-design-artifacts/operations/checklists/cohort-production-go-live-checklist|Cohort Production Go-Live Checklist]]
- [[docs/product-docs/cohort-design-artifacts/operations/checklists/cohort-template-deployment-checklist|Cohort Template Deployment Checklist]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-launch-gaps-and-solutions|Pre-Launch Gaps And Solutions]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-mortem-session-4-decisions|Pre-Mortem Decisions Log - Session 4]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/solutions-and-new-automations|Solutions And New Automations]]
