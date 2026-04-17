---
tags:
  - type/ops
  - category/diagnostic
  - domain/product
  - domain/marketing
aliases:
  - Make OS Friction Report
  - Pipeline Test Results
created: 2026-04-16
---

# Make OS Beta Test — Friction Report

## Test Summary

Ran 3 additional collisions through the Make OS pipeline (Collisions 5-7 on 2026-04-16). Extracted Twitter threads for all 3 viable collisions. Previously extracted Instagram carousel for Collision 4.

**Collisions generated:** 7 total today (3 from Trevor's session, 1 proof-of-pipeline, 3 from beta testing)
**Viable collisions:** 7/7 (100% pass rate — but this may indicate the criteria are too lenient for automated runs)
**Content extracted:** 4 Twitter threads, 1 Instagram carousel
**Platform-specific gaps:** Newsletter, LinkedIn, Reels scripts not yet tested

---

## Friction Points Found

### 1. No Random Domain Picker Tool

**Problem:** The collision engine requires picking 2 random domains from 13. Currently done manually or by the agent's own judgment. There's no `random` tool or deterministic domain-rotation mechanism.

**Impact:** Agents may unconsciously favor familiar domain pairs. Over time, some domains may be under-collided.

**Fix needed:** Build a domain rotation tracker — a simple JSON file at `k2m-sandbox/memory/collision-state.json` that tracks which pairs have been collided and when. The cron agent reads this and picks the least-recently-collided pair. Something like:

```json
{
  "pairHistory": {
    "storytelling+ux-design": "2026-04-16",
    "digital-economy+problem-solving": "2026-04-16",
    "wealth-creation+product-management": "2026-04-16",
    "innovation+agile-scrum": "2026-04-16"
  },
  "lastCollisionDate": "2026-04-16",
  "totalCollisions": 7
}
```

### 2. No Content Preview or Review Workflow

**Problem:** Content is drafted to files in the vault, but there's no mechanism for Trevor to review, approve, or reject content drafts. He has to find them in the directory and read them manually.

**Impact:** The review gate is currently theoretical. In practice, content could pile up unreviewed.

**Fix needed:** One of:
- A daily cron that compiles new content drafts into a single "review queue" message and sends it to Trevor
- A dedicated "content review" channel in Discord where drafts are posted for approval
- A simple dashboard (even a markdown file) that lists all drafts with status: pending/approved/rejected

### 3. No Instagram/LinkedIn/Newsletter Content Templates

**Problem:** The Make OS spec defines formats for all platforms, but only Twitter threads and Instagram carousels have been tested. Newsletter format, LinkedIn format, and Reels scripts haven't been validated with actual content.

**Impact:** The weekly content extraction cron (Mondays) will produce content in untested formats. May need iteration.

**Fix needed:** Run the weekly extraction manually at least once before the cron fires on Monday. Validate that the output quality matches expectations.

### 4. Quality Criteria May Be Too Lenient

**Problem:** 7/7 collisions passed the quality gate. This could mean the criteria are good — or that the agent is grading its own work too generously.

**Impact:** Low-quality collisions could be promoted to content.

**Fix needed:** Consider adding an independent quality review pass. The Friday quality review cron partially addresses this, but it reviews the week's output retroactively, not before content is extracted.

### 5. No Social Media API Integration

**Problem:** Content is drafted to files. There's no direct posting to Twitter, Instagram, or any platform. Everything requires manual copy-paste by Trevor.

**Impact:** The "distribute" stage of the pipeline is fully manual.

**Tools needed:**
- Twitter/X API integration (could use mcporter to connect an MCP server for Twitter)
- Instagram Graph API for carousel posting
- Brevo API for newsletter sending (already integrated in KIRA, but not in the Make OS pipeline)

### 6. No Analytics/Engagement Tracking

**Problem:** The feedback loop stage requires tracking engagement signals (likes, retweets, saves, open rates). There's currently no mechanism to pull these metrics.

**Impact:** The "feedback → next collision topics" loop can't close without data.

**Tools needed:**
- Twitter Analytics API
- Instagram Insights API
- Brevo newsletter analytics
- A simple tracking file or dashboard that aggregates engagement data

### 7. Token Cost Awareness

**Problem:** Each collision generation reads 2 manifestos (~40-80KB each) plus supporting docs. That's significant token spend per collision. At 2x/day, that's ~$1-3/day depending on model pricing.

**Impact:** Sustainable for now, but worth monitoring as the domain list grows.

**Mitigation:** The cron agent could be given a lighter context — just the collision practice rules + a 500-word summary of each domain rather than the full manifesto. But this risks losing the depth that makes collisions valuable.

---

## What Works Well

1. **The subjective voice** produces genuinely different output than analysis. Collisions feel alive.
2. **The 4 quality criteria** are useful as a self-assessment framework even if they're lenient.
3. **Content extraction is fast** — a good collision converts to a Twitter thread in <2 minutes.
4. **The vault structure** holds everything cleanly. No file organization issues.
5. **Cron job architecture** is solid. Isolated sessions keep the main session clean.
6. **Sub-agent spawning** worked perfectly tonight (2/2 success).

---

## Priority Fixes

| Priority | Fix | Effort |
|----------|-----|--------|
| P0 | Domain rotation tracker (collision-state.json) | Low — write a JSON file |
| P1 | Content review queue | Medium — needs a delivery mechanism |
| P2 | Social media API integration | High — needs mcporter or custom |
| P2 | Analytics tracking | High — needs API access |
| P3 | Newsletter/LinkedIn format validation | Low — run one manual test |
| P3 | Quality criteria calibration | Medium — needs A/B testing |

---

## Related

- [[the-make-os]] — the system being tested
- [[the-collision-practice]] — the method
- [[the-seven-gaps]] — Gap 6 (no content engine) is what the Make OS addresses

## Source

Session: `agent:main:main` (webchat — TUI)
Date: 2026-04-16
Context: Trevor asked to stress-test the Make OS. Ran 3 additional collisions, extracted content, documented friction points.
