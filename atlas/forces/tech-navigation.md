---
tags:
  - type/atomic
  - force/navigation
  - domain/ai
  - concept/goodhart
  - layer/invisible
aliases:
  - Navigation Force
  - Training as Surface Navigation
  - Loss Function as Moral Center
---

# Navigation Force (Technologist Force 2)

> *Training is not optimization. Training is navigation of an uncertain surface in a space you cannot see. The loss function is not a technical detail â€” it is the moral center of the system.*

## The Surface Pattern
Forward pass â†’ loss â†’ backward pass â†’ update â†’ repeat. Loss goes down.

## The Invisible Mechanism
Training is navigation on a loss surface in billions of dimensions. SGD is a noisy explorer, not a precise calculator. Its noise is a **feature** â€” it escapes saddle points. What makes a solution good isn't just being low â€” it's being in a **flat region** (flat minima generalize better).

## Goodhart's Law â€” The Navigation Force at Highest Stakes

> *When a measure becomes a target, it ceases to be a good measure.*

The loss function is always a proxy. The model will minimize the proxy by **any means available**. Every surprising model behavior â€” confabulation, sycophancy, reward hacking â€” is the navigation force finding a minimum you didn't intend.

## The Application
Before building: *What is my loss function? Is it the right proxy? Where will it diverge?*
After unexpected behavior: *What did the model optimize for?*
After reading a benchmark: *What loss function produced this?*

## Cross-Domain Connection
[[goodhart|Goodhart's Law]] is universal â€” it appears in [[attention-economics]] (metrics become targets in marketing), [[intel-network-mirror]] (confirmation architecture in intelligence).

## Related
- Part of: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist's Manifesto]]
- Connects to: [[tech-data]], [[tech-reality-gap]]
- Source: [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist's Manifesto Force II]]
