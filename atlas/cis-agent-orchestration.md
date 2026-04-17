---
tags:
  - type/atomic
  - category/strategy
  - domain/product
  - domain/ai
  - layer/mechanics
aliases:
  - "CIS Agent Orchestration"
  - "CIS Orchestration"
---

# CIS Agent Orchestration

## Definition

CIS agent orchestration is the staged logic that introduces and coordinates the four thinking agents so they support the learner's current phase instead of overwhelming them.

## Pattern

The broad orchestration pattern is:

- `/frame` arrives first to stabilize questioning
- `/diverge` and `/challenge` arrive when the learner can hold multiple angles safely
- `/synthesize` arrives when the learner is ready to own conclusions and build proof
- controller logic, prompt rules, and week gating keep the tools aligned with the learner's current stage
- the controller stays mostly invisible while the agents remain the felt thinking partners
- all agents draw from one governed example layer rather than carrying separate local libraries

This keeps the product from front-loading too much cognitive surface area too early.

## Diagnostic Use

Ask:

- Why are the agents introduced in this order?
- What learner readiness is each agent assuming?
- Where does orchestration protect the student from premature complexity?

## Trap

The trap is reading the agents as a feature list. Their deeper role is staged cognitive scaffolding.

## Related

- [[moc-k2m-playbook-spine]]
- [[kira-as-belief-interface]]
- [[cohort-progression-architecture]]
- [[artifact-proof-system]]
- [[single-source-example-library]]

Source:
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-1-cis-controller-logic|CIS Controller Logic]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-7-discord-bot-spec|Discord Bot Spec]]
