---
tags:
  - type/atomic
  - category/principle
  - domain/product
  - domain/education
  - domain/ai
  - layer/mechanics
aliases:
  - "Human Backstop Doctrine"
  - "Trevor's 10% Human Layer"
  - "10% Human Layer"
---

# Human Backstop Doctrine

## Definition

Human backstop doctrine is the operating rule that K2M's agents handle routine scaffolding while Trevor intervenes only where human judgment, crisis response, culture calibration, or authentic connection are required.

## Pattern

In the current product:

- automation owns daily prompts, gating, tracking, and standard nudges
- Trevor works on a bounded weekly cadence rather than constant visible facilitation
- escalation moves from bot support to DM, call, and crisis response as risk increases
- manual SOPs make the human layer executable through checklists, templates, and time budgets
- if a student needs a person or the bot cannot carry the situation safely, the system yields to human handling
- system-facing docs and playbook-facing docs are not identical: the implemented system exposes daily dashboard visibility, while the playbook tries to compress most non-crisis review into weekly spot-checking

This preserves the 90/10 structure without pretending the product can fully automate judgment.

## Hardening Note

The source base describes the human layer at two different resolutions:

- the system docs describe an implemented operator surface with live dashboard access, direct commands, and immediate escalation thresholds
- the playbook docs describe an intended operating rhythm for Cohort 1, where most non-crisis work is batched into weekly review and the total human load ranges from lean oversight to launch-heavy manual work
- the design/playbook layer often models that rhythm against a 200-student target, while the launch-oriented design decisions explicitly cap Cohort 1 at 30 students

So the durable truth is the doctrine itself, not one fixed hour count.

## Diagnostic Use

Ask:

- What must stay in automation because it is mechanical and repeatable?
- What must escalate because it requires human judgment or trust repair?
- Does the current manual layer fit inside a real operating budget, or is Trevor silently becoming the product again?

## Trap

The trap is breaking the doctrine in either direction: collapsing back into human-led facilitation, asking automation to absorb situations that need human responsibility, or quoting one source-layer budget as if it resolves the whole operating picture.

## Related

- [[moc-k2m-product]]
- [[moc-k2m-playbook-spine]]
- [[cis-agent-orchestration]]
- [[discord-cohort-ops-surface]]
- [[facilitator-escalation-ladder]]
- [[hybrid-agent-facilitation-model]]

Source:
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/05-discord-ops/5-6-manual-sops|Manual SOPs]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/operations/escalation-playbook-v1|Trevor's 10% Escalation Playbook]]
