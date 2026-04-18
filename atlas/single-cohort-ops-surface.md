---
tags:
  - type/atomic
  - category/concept
  - domain/product
  - domain/ai
  - layer/mechanics
aliases:
  - "Single Cohort Ops Surface"
  - "K2M Single Cohort Runtime"
---

# Single Cohort Ops Surface

## Definition

The single-cohort ops surface is the current operational truth that K2M runs one live cohort on one shared global clock, with one deployment spine, one environment contract, and one facilitator-owned recovery surface.

## Pattern

In the current product:

- Railway runs the Discord bot
- PostgreSQL is the production state store
- SQLite survives only as a local-development and SQLite-mode fallback path, not as production authority
- the Apps Script webhook powers the context engine and activation handoffs
- the scheduler uses one `COHORT_1_START_DATE` as the week clock
- welcome-lounge, guest/student role changes, and internal webhook calls stage activation
- Trevor holds the operational keys for deployment, recovery, and manual overrides

This is a workable production shape, but it is not yet a multi-cohort product architecture.

The other constraint is that cross-system truth is still operationally fragile: Sheets, Apps Script, Discord, and PostgreSQL are intentionally connected, but not fully reconciled without manual checks.

## Diagnostic Use

Ask:

- Is this a real product capability or a single-cohort operating workaround?
- Which product assumptions depend on one shared cohort clock?
- Which ops actions still require Trevor holding the keys?

## Trap

The trap is speaking as if multi-cohort support or fully abstracted operations already exist. The current runtime is intentionally narrower than the larger product ambition.

## Related

- [[moc-k2m-product]]
- [[current-scrappy-product]]
- [[discord-as-current-vessel]]
- [[runtime-protective-scaffolding]]

Source: [[docs/product-docs/system/04-super-admin-ops|K2M Super Admin Ops]]
