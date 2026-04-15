---
tags:
  - type/atomic
  - category/current-force
  - domain/ai
  - layer/invisible
aliases:
  - "Current AI CURRENT FORCE 4: The Reliability Gap"
---

# Current AI CURRENT FORCE 4: The Reliability Gap

> Models are impressively capable on average and unreliably wrong at the margins. The entire engineering challenge of deploying AI in production is building systems that compensate for the tail of model failures.

## Definition
Models are impressively capable on average and unreliably wrong at the margins. The entire engineering challenge of deploying AI in production is building systems that compensate for the tail of model failures.

## Pattern
- The evaluation infrastructure crisis: Benchmark saturation is real. MMLU, HumanEval, and GSM8K no longer differentiate frontier models. The field is actively searching for evaluation frameworks that keep up with capability. Models that score >90% on reasoning benchmarks still fail elementary school logic in adversarial prompting.
- What this means for developers: Build evaluation infrastructure as a first-class engineering concern, equal in priority to model selection. Learn to design adversarial evaluations. Treat your evaluation suite as a living system that grows with the model's capabilities.

## Source-Grounded Example
The evaluation infrastructure crisis: Benchmark saturation is real. MMLU, HumanEval, and GSM8K no longer differentiate frontier models. The field is actively searching for evaluation frameworks that keep up with capability. Models that score >90% on reasoning benchmarks still fail elementary school logic in adversarial prompting.

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
