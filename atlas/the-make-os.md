---
tags:
  - type/atomic
  - category/instrument
  - domain/product
  - domain/marketing
  - force/emergent-complexity
  - layer/invisible
aliases:
  - Make OS
  - The Content Pipeline
  - Collision-to-Content Pipeline
  - K2M Content Engine
created: 2026-04-16
---

# The Make OS — Collision-to-Content Pipeline

## Definition

The Make OS is K2M's content engine: a system that turns lattice collisions into publishable content, distributes it across platforms, and feeds audience signal back into the lattice. It is the transmission between the collision engine (research) and the revenue engine (marketing).

Built on Koe's clarity flywheel: pursue goals → encounter problems → solve them → share insight as content → attract resonance → package as product → revenue → deeper pursuit → repeat.

## The Pipeline Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                        THE MAKE OS                                  │
│                                                                     │
│  ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────────┐    │
│  │ GENERATE │──▶│  FILTER  │──▶│  EXTRACT │──▶│  DISTRIBUTE  │    │
│  │          │   │          │   │          │   │              │    │
│  │ Collision│   │ Quality  │   │ Content  │   │ Platform     │    │
│  │ Engine   │   │ Gate     │   │ Formats  │   │ Posting      │    │
│  └──────────┘   └──────────┘   └──────────┘   └──────────────┘    │
│       │                                              │             │
│       │              ┌──────────┐                    │             │
│       │              │ FEEDBACK │◀───────────────────┘             │
│       │              │  LOOP    │                                  │
│       │              └────┬─────┘                                  │
│       │                   │                                        │
│       └───────────────────┘ (audience signal → collision topics)  │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Stage 1: GENERATE — The Collision Engine

### Domains in Play (13 total)

| # | Territory | Source |
|---|-----------|--------|
| 1 | Software Engineering | Territory manifesto |
| 2 | Agile/Scrum | Territory manifesto |
| 3 | Investing | Territory manifesto |
| 4 | Digital Economy | Territory manifesto |
| 5 | Storytelling | Territory manifesto |
| 6 | Product Management | Territory manifesto |
| 7 | Innovation & Disruption | Territory manifesto |
| 8 | UX/Design | Territory manifesto |
| 9 | Problem Solving | Territory manifesto |
| 10 | Wealth Creation Universal | Territory manifesto |
| 11 | Belief Operations | Belief system transcripts + manifesto |
| 12 | Domain Cartography | Cartographer's manifesto + OS |
| 13 | K2M Product | Product docs, system docs, Layer 4 brief |

### Unique Pairs Available

`C(13, 2) = 78` unique pairs. At 2 collisions/day, ~39 days before any repeat.

### Collision Generation Rules

1. Pick two random domains from the list above
2. Force them into contact through ONE live product question:
   - "How does [Domain A]'s deepest force reshape what [Domain B] thinks it knows about [transition uncertainty]?"
   - "If [Domain A] and [Domain B] had a child, what belief would that child hold about navigating uncertainty?"
3. Write in the **subjective discovery voice** — someone who just got hit by something unexpected. Not analysis. Discovery.
4. Every collision MUST answer:
   - **What new pattern became visible?**
   - **Why does it matter for the K2M product kernel?**
   - **What's the design implication or hypothesis?**
5. Tag with all relevant forces from the Domain Cartographer's 10 forces

### Output Format

```markdown
### Collision [N] — [Domain A] × [Domain B] (HH:MM)

[2-4 paragraphs in subjective voice, discovering the connection]

**Pattern surfaced:** [one-line]
**Product implication:** [one-line]
**Revenue angle:** [one-line]
**Forces:** [list of forces from the 10]
```

### Cron Configuration

```
Job: "collision-morning"
Schedule: every 12 hours (07:00 EAT + 19:00 EAT)
Type: isolated agentTurn
Task: Generate one lattice collision from two random domains
Output: Write to daily note under ## Lattice Collision heading
```

---

## Stage 2: FILTER — The Quality Gate

### 4 Criteria

| Criterion | Question | Threshold |
|-----------|----------|-----------|
| **Surprise** | Did this produce a connection I didn't see coming? | Something genuinely unexpected must appear |
| **Product Link** | Does it touch the K2M kernel, the belief system, or the seven gaps? | Must connect to at least one |
| **Actionability** | Does it suggest something to build, test, or change? | At least one concrete implication |
| **Voice** | Is it written in the subjective discovery voice? | Alive, not analytical |

### Status Tags

- `status/viable` — passes 3+ criteria. Promoted to content extraction.
- `status/raw` — interesting but incomplete. Kept in vault for future reference.
- `status/dud` — flat, decorative, or disconnected. Kept but not promoted.

### Integration

Filtering happens WITHIN the collision generation agent. The agent writes the collision AND self-assesses against the 4 criteria. The status tag goes in the YAML frontmatter.

---

## Stage 3: EXTRACT — Content Formats

### Platform-Specific Formats

| Format | Input | Output | Platform | Cadence |
|--------|-------|--------|----------|---------|
| **Twitter Thread** | Best single collision of the day | 5-8 tweet thread, one insight per tweet | Twitter/X | 1x/day |
| **Twitter Single** | One-liner from collision | 1 tweet, punchy, provocative | Twitter/X | 1-2x/day |
| **Instagram Carousel** | Weekly collision synthesis | 8-10 slide visual thread | Instagram | 1x/week |
| **Instagram Reel Script** | Belief-firmware collision | 30-60 second video script | Instagram Reels | 1x/week |
| **Newsletter** | Weekly synthesis of all collisions | 800-1500 word email | Email (Brevo) | 1x/week |
| **LinkedIn Article** | Product-kernel collision | Long-form professional article | LinkedIn | 1x/week |
| **Case Study** | Student-specific collision | 1-page transformation narrative | Sales material | As available |

### Voice Adaptation Matrix

| Platform | Voice | Energy Level | Length | Structure |
|----------|-------|-------------|--------|-----------|
| **Twitter/X** | Provocative, punchy | High | 280 chars/tweet | Hook → insight → implication → CTA |
| **Instagram Carousel** | Visual + educational | Medium-High | 8-10 slides | Problem → pattern → implication → "save this" |
| **Instagram Reels** | Conversational, direct | High | 30-60 sec | Hook in 3 sec → pattern → "follow for more" |
| **Newsletter** | Reflective, substantive | Medium | 800-1500 words | Collision story → what it means → what we're building |
| **LinkedIn** | Professional, authoritative | Medium | 500-1000 words | Industry insight → pattern → business implication |
| **Sales** | Transformational proof | Medium-High | 1 page | Before → after → mechanism → proof |

### The K2M Voice for Social Media

Derived from the Layer 4 Brief's category belief:

**Core energy:** "You're not confused because you're behind. You're confused because nobody taught you how to think through this."

**Twitter hooks (from the vault):**
- "4 years preparing for KCSE. Zero days preparing for what comes after."
- "The most dangerous belief isn't wrong — it's expired."
- "Every transition is a belief revision event. Most people don't know they're in one."
- "Technical debt isn't just code. It's thinking that outlived its assumptions."
- "Your brain runs on firmware someone else installed. When did you last update?"

**Instagram carousel structure:**
1. Title slide (bold claim or question)
2. The problem (name the invisible force)
3. The pattern (show it across domains)
4. The implication (why it matters)
5. The K2M lens (how we address it)
6. Actionable takeaway (one thing to do)
7. "Save this for your next transition moment"
8. CTA (follow for more, link in bio)

---

## Stage 4: DISTRIBUTE — Platform Posting

### Weekly Distribution Schedule

| Day | Content | Platform | Time (EAT) |
|-----|---------|----------|------------|
| **Monday** | Collision → Twitter thread | Twitter/X | 09:00 |
| **Monday** | Collision → Instagram carousel | Instagram | 12:00 |
| **Tuesday** | One-liner → Twitter single | Twitter/X | 09:00 |
| **Wednesday** | Collision → Twitter thread | Twitter/X | 09:00 |
| **Wednesday** | Belief firmware → Reel script | Instagram | 18:00 |
| **Thursday** | One-liner → Twitter single | Twitter/X | 09:00 |
| **Friday** | Weekly synthesis → Newsletter | Email | 08:00 |
| **Friday** | Product-kernel → LinkedIn | LinkedIn | 10:00 |
| **Saturday** | Best-of → Twitter thread | Twitter/X | 10:00 |
| **Sunday** | Reflective collision → Instagram carousel | Instagram | 12:00 |

### Content Staging

All content is drafted to the vault before posting:

```
k2m-sandbox/content/
├── twitter/
│   ├── YYYY-MM-DD-thread-NN.md
│   └── YYYY-MM-DD-single-NN.md
├── instagram/
│   ├── YYYY-MM-DD-carousel-NN.md
│   └── YYYY-MM-DD-reel-NN.md
├── newsletter/
│   └── YYYY-MM-DD-issue-NN.md
├── linkedin/
│   └── YYYY-MM-DD-article-NN.md
└── sales/
    └── YYYY-MM-DD-case-study-NN.md
```

### Review Gate

All outbound content requires Trevor's review before posting. The Make OS generates drafts; Trevor approves. This is a security and voice integrity measure.

---

## Stage 5: FEEDBACK LOOP — Audience Signal → Lattice

### What We Track

| Signal | Source | How it feeds back |
|--------|--------|-------------------|
| Tweet engagement (likes, retweets, replies) | Twitter analytics | High-engagement topics → prioritize in collision selection |
| Instagram saves | Instagram insights | High-save content → expand into newsletter or carousel |
| Newsletter open rate | Brevo analytics | Low open rate → voice/subject adjustment |
| Newsletter click-through | Brevo analytics | High CTR → that topic is resonating, go deeper |
| DMs and replies | All platforms | Direct audience questions → new collision topics |
| Follower growth rate | All platforms | Acceleration → double down on what's working |
| Unsubscribes | Newsletter | Topic fatigue or voice mismatch |

### Feedback Integration

The weekly content extraction agent (cron job) reviews the previous week's engagement signals and adjusts:
- Domain selection weights (which domains generate the most engagement?)
- Voice calibration (which tone hits hardest?)
- Topic prioritization (which of the 7 gaps resonates most?)
- Format mix (threads vs carousels vs reels)

---

## Cron Architecture

### Job 1: Collision Engine (Twice Daily)

```yaml
name: "collision-engine"
schedule: { kind: "cron", expr: "0 4,16 * * *", tz: "Africa/Nairobi" }
sessionTarget: "isolated"
payload:
  kind: "agentTurn"
  message: |
    You are a Cartographer running the collision practice.
    
    Read the collision practice rules: k2m-sandbox/atlas/the-collision-practice.md
    
    1. Pick two random domains from these 13: Software Engineering, Agile/Scrum, 
       Investing, Digital Economy, Storytelling, Product Management, Innovation & Disruption, 
       UX/Design, Problem Solving, Wealth Creation, Belief Operations, Domain Cartography, K2M Product
    
    2. Force them into contact through the K2M product kernel lens
    
    3. Write in the subjective discovery voice (alive, surprised, not analytical)
    
    4. Every collision must answer: What pattern surfaced? Why does it matter for the product? 
       What's the design implication? How does this serve revenue?
    
    5. Self-assess against the 4 quality criteria (Surprise, Product Link, Actionability, Voice)
    
    6. Write the collision to the daily note at k2m-sandbox/memory/YYYY-MM-DD.md 
       under ## Lattice Collision with timestamp
    
    7. If the collision passes 3+ criteria, also write a Twitter thread draft to 
       k2m-sandbox/content/twitter/YYYY-MM-DD-thread-NN.md
    
    Use the domain-cartographer skill and the Cartographer's OS for methodology.
```

### Job 2: Weekly Content Extraction (Monday Morning)

```yaml
name: "weekly-content-extraction"
schedule: { kind: "cron", expr: "0 6 * * 1", tz: "Africa/Nairobi" }
sessionTarget: "isolated"
payload:
  kind: "agentTurn"
  message: |
    You are a content strategist for K2M (The Clarity Company).
    
    1. Read all collisions from the past 7 days in k2m-sandbox/memory/
    
    2. Select the top 3 viable collisions
    
    3. For each, extract content in these formats:
       - Twitter thread (5-8 tweets)
       - Instagram carousel outline (8-10 slides)
       - Newsletter section (300-500 words each)
    
    4. Write all drafts to k2m-sandbox/content/ in the appropriate subdirectory
    
    5. Write the newsletter draft combining all 3 into one issue
    
    Voice: Derived from the Layer 4 Brief's category belief. 
    Not "here's information" — "here's something you couldn't see until now."
    
    Read the Make OS spec at k2m-sandbox/atlas/the-make-os.md for format details.
```

### Job 3: Weekly Quality Review (Friday Evening)

```yaml
name: "collision-quality-review"
schedule: { kind: "cron", expr: "0 17 * * 5", tz: "Africa/Nairobi" }
sessionTarget: "isolated"
payload:
  kind: "agentTurn"
  message: |
    You are reviewing the week's collision output for K2M.
    
    1. Read all collisions from the past 7 days in k2m-sandbox/memory/
    
    2. Identify patterns: which domain pairs produced the strongest insights?
    
    3. Check the 7 gaps (k2m-sandbox/atlas/the-seven-gaps.md) — did any collision 
       sharpen a gap or suggest a new one?
    
    4. Write a brief review to k2m-sandbox/memory/YYYY-MM-DD.md under 
       ## Weekly Collision Review
    
    5. If any collision deserves to become a permanent atom in atlas/, create it
```

---

## The Content-as-Map Principle

From Koe: your body of content creates a navigable territory for your audience. Each piece is a landmark. Together, they form a coherent world people can explore.

The Make OS applies this literally:

- **Each collision** = a landmark (one specific insight made visible)
- **The weekly newsletter** = a trail guide (connecting landmarks into a path)
- **The Instagram carousel** = a map legend (visual, shareable, savable)
- **The Twitter thread** = a trail marker (quick, provocative, pointing somewhere deeper)
- **The sales case study** = a travel brochure (proof that the journey transforms)

Over time, the accumulated content BECOMES the map of the territory K2M navigates. The audience doesn't just read content — they explore a landscape. Each piece they encounter is another landmark in the same coherent world.

---

## Revenue Connection

The Make OS closes Koe's flywheel:

1. **Collisions generate clarity** (we see new connections)
2. **Clarity becomes content** (we share what we see)
3. **Content builds trust** (audience sees we see)
4. **Trust converts to enrollment** (they want the guided experience)
5. **Enrollment generates revenue** (they pay for the full journey)
6. **Revenue buys time** (deeper research → more collisions → more clarity)
7. **Graduates subscribe** (ongoing clarity tools — Gap 7 from the seven gaps)

The content IS the marketing. The lattice IS the content engine. The collisions ARE the product insights.

---

## Related

- [[the-collision-practice]] — the research method this system automates
- [[the-seven-gaps]] — Gap 6 (no content engine) is what this system closes
- [[the-clarity-company]] — one kernel, many doors
- [[the-cartographers-operating-system]] — the methodology for generating collisions
- [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]] — voice, positioning, audience translation
- [[agm-belief-revision]] — the mechanism behind every collision
- [[firmware-written-in-paper]] — Kenyan belief artifacts that become content gold

Source: [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]]

## Source

Session: `agent:main:main` (webchat — TUI)
Date: 2026-04-16
Context: Trevor asked for the full collision-to-content pipeline. Built as the Make OS — the transmission between collision engine and revenue engine.
