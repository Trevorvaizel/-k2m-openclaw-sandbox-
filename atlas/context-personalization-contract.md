---
tags:
  - type/atomic
  - category/concept
  - domain/product
  - domain/ai
  - layer/mechanics
aliases:
  - "Context Personalization Contract"
  - "K2M Context Contract"
---

# Context Personalization Contract

## Definition

The context personalization contract is the explicit rule set for what K2M learns about a student, how that context moves through Sheets and PostgreSQL, and what subset of it is safe to use in KIRA interactions.

## Pattern

The contract has four parts:

- Google Sheets acts as the activation-time roster and intake surface
- `preload_students.py` bridges activation data into PostgreSQL
- context fields are enriched through enrollment, Stop 0, and runtime events
- only a bounded subset of context is passed into agent prompts, while more sensitive fields stay out of agent context
- a canonical onboarding schema defines which fields are collected where, why they are needed, and which actor is allowed to update them

This makes personalization a governed system rather than a vague promise.

## Diagnostic Use

Ask:

- What exactly is the product allowed to know about the student?
- Which fields belong to runtime personalization, and which should never be injected into the agent layer?
- When Sheets and PostgreSQL disagree, which side is authoritative at this stage of the journey?

## Trap

The trap is treating personalization as unlimited data accumulation. The product works because context is bounded, staged, and purpose-specific.

## Related

- [[moc-k2m-product]]
- [[runtime-protective-scaffolding]]
- [[value-first-onboarding-architecture]]
- [[kira-as-belief-interface]]

Source:
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/context-engine-experience-design|Context Engine Experience Design]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/student-onboarding-and-enrollment-flow|Student Onboarding And Enrollment Flow]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/onboarding-context-canonical-v3|Onboarding + Context Canonical V3]]
