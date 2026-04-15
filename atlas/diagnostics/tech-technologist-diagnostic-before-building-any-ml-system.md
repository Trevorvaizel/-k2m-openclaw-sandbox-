---
tags:
  - type/atomic
  - category/diagnostic
  - domain/ai
  - layer/invisible
aliases:
  - "Technologist Diagnostic: Before Building Any ML System"
---

# Technologist Diagnostic: Before Building Any ML System

> What am I actually optimizing for? What is the loss function, and what is the gap between the loss function and the goal? Where will Goodhart bite?

## Definition
What am I actually optimizing for? What is the loss function, and what is the gap between the loss function and the goal? Where will Goodhart bite?

## Pattern
- What is the true data distribution? What distribution was collected, and what is the distribution at deployment time? How will it shift over time? Who is present in the data, and who is absent?
- Which invisible force is load-bearing? Is this primarily a representation problem, a scale problem, a data problem, or a systems problem? Different problems require different solutions.
- What is the simplest baseline? Before any ML: a rules-based system. Before any deep learning: a gradient boosted tree. Before any large model: a small model. The baseline defines what ML is adding.
- What does production look like? Who are the users? What is the latency requirement? What is the scale? What happens when the model is wrong? Can the cost of errors be modeled?

## Source-Grounded Example
What is the true data distribution? What distribution was collected, and what is the distribution at deployment time? How will it shift over time? Who is present in the data, and who is absent?

## Diagnostic / Use
Ask: Where does this source unit change the next diagnostic, decision, or practice?

## Trap or Limitation
Treating this concise note as a replacement for the source, or linking it as equivalent without checking the mapping tier.

## Mapping Tier
Adjacent mapping unless a MOC explicitly marks it stronger.

## Related
- [[time-compression]]
- [[failure-gradients]]
- [[tech-interpretive]]
- Source: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Source]]
