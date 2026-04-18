---
tags:
  - type/atomic
  - category/practice
  - domain/product
  - domain/education
  - layer/mechanics
aliases:
  - "Facilitator Escalation Ladder"
  - "KIRA Escalation Ladder"
---

# Facilitator Escalation Ladder

## Purpose

The facilitator escalation ladder is the human intervention spine for the current K2M product. It defines when KIRA stays autonomous, when the dashboard should surface a case, and when Trevor must step in directly.

## Process

The implemented escalation structure in the system docs is:

1. Level 1: KIRA nudges the student privately after early inactivity.
2. Level 2: KIRA posts an operational alert to the facilitator dashboard.
3. Level 3: KIRA sends Trevor a direct DM for sustained stuckness.
4. Level 4: KIRA pages Trevor immediately for crisis language and sends the student crisis resources.

This ladder keeps the product mostly autonomous while preserving a clear human override path for fragile belief states and safety risks.

The playbook layer adds an operational nuance: non-crisis review is meant to be heavily batched into Friday spot-checks, while crisis and higher-risk cases still break through immediately. So the durable invariant is not constant human monitoring. It is clear human override when risk or stuckness crosses the threshold.

## Result

The result is a hybrid model: KIRA handles routine flow, Trevor handles meaningfully human judgment, and the student is not left alone when the product detects real risk or prolonged stall.

## When To Use

Use this note when asking:

- Where does facilitation begin in the current product?
- What kinds of stuckness stay in-product versus escalate to Trevor?
- How does KIRA preserve psychological safety without pretending it can handle everything?

## Failure Mode

The failure mode is either side of the ladder breaking:

- too little escalation and the student gets abandoned inside automation
- too much escalation and Trevor becomes the product bottleneck
- or the docs collapse implemented thresholds and intended review cadence into one fake-simple workflow

## Related

- [[moc-k2m-product]]
- [[current-scrappy-product]]
- [[kira-as-belief-interface]]
- [[product-observability-surface]]

Source: [[docs/product-docs/system/03-facilitator-guide|K2M Facilitator Guide]]
