---
tags:
  - type/atomic
  - force/reality-gap
  - domain/ai
  - layer/invisible
aliases:
  - Reality Gap Force
  - Notebook vs Production
  - Hidden Technical Debt
---

# Reality Gap Force (Technologist Force 6)

> *The distance between a notebook and production is measured in invisible complexity. The model is the smallest part of the ML system.*

## The Invisible Mechanism
The reality gap = the forces separating what works in a notebook from what works in production serving real users.

**Core insight from Sculley et al. (Google, 2015):** The ML model is a small fraction of a production ML system. The majority of code and complexity is in the glue: data collection, feature extraction, verification, serving, monitoring, process management.

## The Dimensions

**Train-serve skew:** Features computed differently at training vs serving time â€” different timezone, aggregation window, rounding. Small differences, large effects.

**Latency constraints:** The most accurate model is irrelevant if it takes 2s per inference and the application requires 100ms. The "best model" is always contextual.

**Compounding errors in agents:** 90% accuracy on single step â†’ 35% success on 10-step chain (0.9^10 = 35%). Most "agentic AI" in 2025 is single-step tool use, not autonomous agents.

## The Second-Order Force
Software engineering skill is not optional for ML developers. The gap is not primarily ML knowledge â€” it's systems knowledge: distributed systems, API design, containerization, CI/CD, monitoring.

## Cross-Domain Connection
This is [[failure-gradients]] in the AI domain â€” Tier 2 failures (method) live in notebooks; Tier 3-4 failures live in production.

## Related
- Part of: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist's Manifesto]]
- Connects to: [[tech-data]], [[tech-navigation]]
- Source: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist's Manifesto Force VI]]
