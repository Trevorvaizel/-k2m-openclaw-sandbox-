---
tags:
  - type/atomic
  - category/current-force
  - domain/ai
  - layer/invisible
aliases:
  - "Current AI CURRENT FORCE 5: The Inference-Time Compute Expansion"
---

# Current AI CURRENT FORCE 5: The Inference-Time Compute Expansion

> OpenAI's o1 (September 2024) demonstrated that spending more compute at inference time â€” allowing the model to "think longer" via internal chain-of-thought â€” produces measurably better results on reasoning tasks. Capability is no longer only a function of model size. It's also a function of *how much you let the model think.*

## Definition
OpenAI's o1 (September 2024) demonstrated that spending more compute at inference time â€” allowing the model to "think longer" via internal chain-of-thought â€” produces measurably better results on reasoning tasks. Capability is no longer only a function of model size. It's also a function of *how much you let the model think.*

## Pattern
- What this means for developers: The reasoning capability axis is now orthogonal to the model size axis. This creates new design decisions: for high-stakes tasks, is it worth the latency and cost of longer inference chains? The answer is often yes. This also implies that the gap between model capability and practical deployment capability is expanding: the most capable version of a model is not the fastest version.

## Source-Grounded Example
What this means for developers: The reasoning capability axis is now orthogonal to the model size axis. This creates new design decisions: for high-stakes tasks, is it worth the latency and cost of longer inference chains? The answer is often yes. This also implies that the gap between model capability and practical deployment capability is expanding: the most capable version of a model is not the fastest version.

## Diagnostic / Use
Ask: Where does this source unit change the next diagnostic, decision, or practice?

## Trap or Limitation
Treating this concise note as a replacement for the source, or linking it as equivalent without checking the mapping tier.

## Mapping Tier
Adjacent mapping unless a MOC explicitly marks it stronger.

## Related
- [[time-compression]]
- [[tech-interpretive]]
- Source: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Source]]
