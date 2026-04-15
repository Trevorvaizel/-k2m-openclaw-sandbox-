# K2M Belief Operations Docs

This folder holds the doctrine map, operating docs, templates, and state logs for the K2M belief operations system.

## Source Hierarchy

When sources disagree, use this order:

1. [k2m-belief-operations-execution-prd.md](./k2m-belief-operations-execution-prd.md) for implementation contract, build order, and acceptance criteria
2. [k2m-runtime-state.md](./k2m-runtime-state.md) for live-versus-target runtime truth
3. [k2m-tool-operating-contract.md](./k2m-tool-operating-contract.md) and [k2m-governance-and-map-update-protocol.md](./k2m-governance-and-map-update-protocol.md) for enforced operating and governance rules
4. `canon/` for philosophy, belief mechanics, and territory doctrine
5. [agent-handoff-log.md](./agent-handoff-log.md) for current execution notes
6. the remaining operating and architecture docs in this folder for runnable structure
7. [evolution-log.yaml](./evolution-log.yaml) for milestone history only

## Start Here

Use the documents in this order:

1. [k2m-belief-operations-execution-prd.md](./k2m-belief-operations-execution-prd.md)
2. [k2m-runtime-state.md](./k2m-runtime-state.md)
3. [k2m-tool-operating-contract.md](./k2m-tool-operating-contract.md)
4. [k2m-governance-and-map-update-protocol.md](./k2m-governance-and-map-update-protocol.md)
5. [canon/README.md](./canon/README.md)
6. [agent-handoff-log.md](./agent-handoff-log.md)
7. [k2m-belief-operations-os.md](./k2m-belief-operations-os.md)
8. [k2m-skill-architecture.md](./k2m-skill-architecture.md)
9. [k2m-live-market-intelligence-os.md](./k2m-live-market-intelligence-os.md)
10. [k2m-notion-information-architecture.md](./k2m-notion-information-architecture.md)
11. [k2m-clickup-workflow-architecture.md](./k2m-clickup-workflow-architecture.md)
12. [k2m-expansion-loop-architecture.md](./k2m-expansion-loop-architecture.md)
13. [k2m-implementation-sprint-01.md](./k2m-implementation-sprint-01.md)
14. [k2m-adversarial-review-prompt.md](./k2m-adversarial-review-prompt.md)
15. [k2m-marketing-landscape-process-flow.md](./k2m-marketing-landscape-process-flow.md)
16. [k2m-touchpoint-territory-audit.md](./k2m-touchpoint-territory-audit.md)
17. [../k2m-layer4-product-brief.md](../k2m-layer4-product-brief.md)
18. [evolution-log.yaml](./evolution-log.yaml)
19. the templates in [templates/](./templates/)

## Folder Layout

- [canon/](./canon/)
  The canonical belief-operations doctrine and retrieval rules.

- [k2m-belief-operations-execution-prd.md](./k2m-belief-operations-execution-prd.md)
  The current implementation contract: 10 skills, build order, runtime architecture, evidence tiers, and acceptance criteria.

- [k2m-belief-operations-os.md](./k2m-belief-operations-os.md)
  The system-wide operating model.

- [k2m-notion-information-architecture.md](./k2m-notion-information-architecture.md)
  The canonical map layer and database model.

- [agent-handoff-log.md](./agent-handoff-log.md)
  The current execution handoff, live-system state, and next actions for agents.

- [k2m-runtime-state.md](./k2m-runtime-state.md)
  The current runtime architecture, active tool surfaces, ownership boundaries, and verification path.

- [k2m-tool-operating-contract.md](./k2m-tool-operating-contract.md)
  The MCP-facing contract for what each tool layer is for, what it should look for, and what it must not do.

- [k2m-marketing-landscape-process-flow.md](./k2m-marketing-landscape-process-flow.md)
  A visual process-flow summary of the full marketing and belief-operations landscape.

- [k2m-implementation-sprint-01.md](./k2m-implementation-sprint-01.md)
  The first condensed implementation sprint across the belief-operations design.

- [k2m-adversarial-review-prompt.md](./k2m-adversarial-review-prompt.md)
  The prompt to use when another agent should stress-test whether the system is actually operational.

- [k2m-clickup-workflow-architecture.md](./k2m-clickup-workflow-architecture.md)
  The execution layer for workflows and ownership.

- [k2m-governance-and-map-update-protocol.md](./k2m-governance-and-map-update-protocol.md)
  Evidence, review cadence, and change control.

- [k2m-live-market-intelligence-os.md](./k2m-live-market-intelligence-os.md)
  The sensing layer for discovery, topology, and market updates.

- [k2m-touchpoint-territory-audit.md](./k2m-touchpoint-territory-audit.md)
  The touchpoint-level audit layer.

- [k2m-expansion-loop-architecture.md](./k2m-expansion-loop-architecture.md)
  How retention compounds back into penetration and referral.

- [k2m-skill-architecture.md](./k2m-skill-architecture.md)
  How doctrine becomes skills and workflows.

- [templates/](./templates/)
  Reusable output shapes for audits, maps, and workflow artifacts.

- [evolution-log.yaml](./evolution-log.yaml)
  Append-only record of changes, decisions, and workspace bootstraps.

## Rule

Agents should read:

1. [k2m-belief-operations-execution-prd.md](./k2m-belief-operations-execution-prd.md) for implementation decisions
2. [k2m-runtime-state.md](./k2m-runtime-state.md) for live versus target truth
3. [k2m-tool-operating-contract.md](./k2m-tool-operating-contract.md) for enforced tool behavior
4. [k2m-governance-and-map-update-protocol.md](./k2m-governance-and-map-update-protocol.md) for review, promotion, and cadence rules
5. [canon/README.md](./canon/README.md) to choose the right doctrinal source
6. [agent-handoff-log.md](./agent-handoff-log.md) for current operating state before changing live systems
7. [k2m-implementation-sprint-01.md](./k2m-implementation-sprint-01.md) when the goal is execution, not more theorizing
8. [k2m-adversarial-review-prompt.md](./k2m-adversarial-review-prompt.md) when the goal is to challenge completion claims
9. the remaining operating docs for implementation
10. templates only when producing an artifact

## Runtime Update Rule

After any completed implementation that changes live behavior:

1. update [k2m-runtime-state.md](./k2m-runtime-state.md)
2. update [agent-handoff-log.md](./agent-handoff-log.md)
3. update [evolution-log.yaml](./evolution-log.yaml) if the change is architectural or milestone-level
