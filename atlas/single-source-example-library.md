---
tags:
  - type/atomic
  - category/principle
  - domain/product
  - domain/ai
  - domain/education
  - layer/mechanics
aliases:
  - "Single Source Example Library"
  - "Single Example Library Contract"
---

# Single Source Example Library

## Definition

The single source example library is the K2M rule that all student-facing examples live in one governed context library instead of being duplicated inside individual agent prompts, session scripts, or showcase flows.

## Pattern

In the playbook:

- StudentContext holds the curated example set
- each CIS agent calls into that shared example layer rather than maintaining its own library
- session content references approved and prohibited example patterns from the same source
- example selection is based on JTBD relevance and student context, not copy-pasted prompt fragments

This keeps context fidelity, tone, and safety aligned across the whole product.

## Diagnostic Use

Ask:

- Where does this example actually live?
- If the example set changes, do all agents inherit the change automatically?
- Are we reinforcing the same product truth across prompts, agents, and sessions?

## Trap

The trap is letting every prompt file grow its own local examples. That creates drift, bloats maintenance, and quietly fractures the product's teaching logic.

## Related

- [[moc-k2m-playbook-spine]]
- [[cis-agent-orchestration]]
- [[session-prompt-engine]]
- [[context-personalization-contract]]
- [[thinking-with-ai-as-unifying-skill]]

Source:
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-1-cis-controller-logic|CIS Controller Logic]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-2-framer-agent-prompt|Framer Agent Prompt]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-3-explorer-agent-prompt|Explorer Agent Prompt]]
- [[docs/product-docs/cohort-design-artifacts/playbook-v2/examples/jtbd-relevant-examples-zone-2-3|JTBD Relevant Examples Zone 2-3]]
