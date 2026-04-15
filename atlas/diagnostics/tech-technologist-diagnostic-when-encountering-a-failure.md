---
tags:
  - type/atomic
  - category/diagnostic
  - domain/ai
  - layer/invisible
aliases:
  - "Technologist Diagnostic: When Encountering a Failure"
---

# Technologist Diagnostic: When Encountering a Failure

> What did the model actually optimize for? Where does the loss function diverge from the goal? (Navigation Force)

## Definition
What did the model actually optimize for? Where does the loss function diverge from the goal? (Navigation Force)

## Pattern
- What is the distribution mismatch? Where does the training distribution differ from the serving distribution? (Data Force)
- What representation did it build? What does the model "see" that it shouldn't, or fail to see that it should? (Representation Force)
- Is this a systems failure or a model failure? Is the bug in the code, the data pipeline, the feature computation, or the model weights? (Reality Gap Force)
- At what scale would this fail differently? Does this failure mode disappear at scale, get worse, or stay the same? (Scale Force)

## Source-Grounded Example
What is the distribution mismatch? Where does the training distribution differ from the serving distribution? (Data Force)

## Diagnostic / Use
Ask: Where does this source unit change the next diagnostic, decision, or practice?

## Trap or Limitation
Treating this concise note as a replacement for the source, or linking it as equivalent without checking the mapping tier.

## Mapping Tier
Adjacent mapping unless a MOC explicitly marks it stronger.

## Related
- [[failure-gradients]]
- [[tech-interpretive]]
- Source: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Source]]
