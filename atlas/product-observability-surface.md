---
tags:
  - type/atomic
  - category/concept
  - domain/product
  - domain/ai
  - layer/mechanics
aliases:
  - "Product Observability Surface"
  - "K2M Observability Surface"
---

# Product Observability Surface

## Definition

The product observability surface is the set of places where K2M makes runtime health, student movement, escalation, and failure legible to operators.

## Pattern

The live observability stack is split across:

- Railway logs for runtime and infrastructure behavior
- PostgreSQL event records for meaningful student and journey events
- `#facilitator-dashboard` for cohort-health and ops alerts
- `#moderation-logs` for safety and escalation audit trails
- Trevor DMs for urgent human intervention paths

This is enough to operate the current product, but it is still a pragmatic operator surface rather than a polished analytics product.

## Diagnostic Use

Ask:

- If something breaks, where should the truth show up first?
- Which signals are operationally visible versus still silent?
- What is currently observable only because Trevor is watching manually?

## Trap

The trap is assuming "logged somewhere" means the system is genuinely observable. The current stack still depends on manual checking, Discord delivery, and operator discipline.

## Related

- [[moc-k2m-product]]
- [[single-cohort-ops-surface]]
- [[runtime-protective-scaffolding]]
- [[facilitator-escalation-ladder]]

Source: [[docs/product-docs/system/06-observability|K2M Observability]]
