---
tags:
  - type/atomic
  - category/diagnostic
  - domain/ai
  - layer/invisible
aliases:
  - "Technologist Diagnostic: When Evaluating a Result (Paper or System)"
---

# Technologist Diagnostic: When Evaluating a Result (Paper or System)

> On what distribution was this measured? Every result is a result on a specific distribution. What is it? How similar is it to the distribution I care about?

## Definition
On what distribution was this measured? Every result is a result on a specific distribution. What is it? How similar is it to the distribution I care about?

## Pattern
- What would falsify this claim? What evidence would show this result is wrong or limited? Has that evidence been collected? Could Goodhart's Law be acting on this metric?
- What inductive bias does this architecture encode? What does it assume about the structure of the data? When would those assumptions be violated?
- Is this a scale result or an algorithm result? Would this result hold at 10Ã— smaller scale? 10Ã— larger? Is the contribution in the architecture or in the compute?
- What invisible force explains this? Every surprising result is the expression of an invisible force. Name it.

## Source-Grounded Example
What would falsify this claim? What evidence would show this result is wrong or limited? Has that evidence been collected? Could Goodhart's Law be acting on this metric?

## Diagnostic / Use
Ask: Where does this source unit change the next diagnostic, decision, or practice?

## Trap or Limitation
Treating this concise note as a replacement for the source, or linking it as equivalent without checking the mapping tier.

## Mapping Tier
Adjacent mapping unless a MOC explicitly marks it stronger.

## Related
- [[constraint-catalyst]]
- [[failure-gradients]]
- [[tech-interpretive]]
- Source: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Source]]
