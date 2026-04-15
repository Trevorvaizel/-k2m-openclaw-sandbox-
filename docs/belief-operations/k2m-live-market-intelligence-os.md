# K2M Live Market Intelligence OS
## Current-State Sensing For Belief Architecture And Network Topology

*Status: reconciled against PRD v0.2 - 2026-04-10*

---

## Purpose

This document defines the live market intelligence layer for K2M.

Its job is not to produce random market data.
Its job is to keep the belief map and the topology map current enough that the rest of the system does not optimize stale assumptions.

Per PRD v0.2, this layer is part of a runtime product:

- Claude Code handles synthesis
- n8n handles sensing loops, schedules, and later distribution automation
- MCP is the orchestration glue
- Notion stores reviewed map state
- ClickUp routes execution

This OS is only successful when intelligence reaches the last mile:

- map updates
- content briefs and published content
- friction and repair tasks
- retention or referral interventions

---

## What This System Must Detect

The system should continuously detect six classes of change:

1. belief shifts
2. language shifts
3. topology shifts
4. timing windows
5. competitor narrative changes
6. first-party behavioral signals

If a source does not help detect one of those changes, it is not core to this OS.

---

## Core Outputs

The intelligence OS should produce:

- workflow runs
- map update memos
- evidence source records
- audience language banks
- open-loop inventory
- timing window alerts
- topology shift alerts
- competitor narrative memos
- source-backed evidence summaries
- content-routing recommendations for the current penetration phase

---

## Source Classes

### 1. Search discovery

Purpose:

- find what the public web is currently saying
- discover emerging pages, discussions, and sources
- monitor query surfaces for category language

Examples:

- Tavily search
- Brave Search API
- search-engine result monitoring

### 2. Site graph mapping

Purpose:

- map public websites as graph structures
- discover adjacent pages, organizations, and domain clusters
- understand how sites, resource hubs, and local institutions connect

Examples:

- Tavily map / crawl
- Exa similar-links workflows
- targeted site crawling

### 3. Public web extraction

Purpose:

- capture school pages, blogs, landing pages, creator sites, media pages, and public community pages
- extract structured content for analysis

Examples:

- Tavily extract / crawl
- Firecrawl
- direct site crawling

### 4. Public influence graph collection

Purpose:

- collect from social and community surfaces where platform-specific extraction is required
- monitor creators, hashtags, comment fields, public groups, and public profiles

Examples:

- Apify actors
- platform APIs where available

### 5. First-party graph and behavioral signals

Purpose:

- observe what K2M's own market is already doing
- detect friction, belief movement, and referral routes from direct behavior

Examples:

- waitlist submissions
- landing-page events
- DM logs
- call notes
- Discord community graphs
- artifact shares
- referral chains

### 6. Competitor and adjacent-category signals

Purpose:

- see how others are framing the problem
- detect narrative gaps or timing openings

Examples:

- school prep programs
- AI upskilling programs
- creator content in adjacent categories
- parent-facing and educator-facing narratives

---

## Recommended Tool Roles

### Tavily

Best use:

- discovery
- site graph mapping
- crawl and extract on public websites
- broad LLM-friendly current-state retrieval

Not ideal for:

- deep public-social graph extraction
- topology inference by itself

### Brave Search API

Best use:

- discovery
- query monitoring
- finding current public discussions
- surfacing timing windows and fresh narratives

Not ideal for:

- site graph mapping by itself
- topology inference by itself

### Firecrawl

Best use:

- crawl and scrape public sites
- turn web pages into markdown or structured extraction
- refresh public sources on a schedule

Not ideal for:

- deep platform-specific social collection
- generous recurring free-tier use

### Exa

Best use:

- adjacent-source discovery
- similar-link discovery
- neighborhood exploration around known nodes

Not ideal for:

- being the only collection layer
- direct public-social graph collection

### Apify

Best use:

- platform-specific public scraping
- social/community data collection
- scheduled collection jobs
- target-specific extraction via actors

Not ideal for:

- being the whole intelligence layer by itself
- low-cost bulk use without tight scoping

### First-party connectors and MCPs

Best use:

- Claude Code for synthesis and adversarial review
- n8n for scheduled ingestion, webhook triggers, and later content distribution
- MCP for orchestrating searches, scrapes, Notion writes, and ClickUp routing
- Notion for maps and summaries
- ClickUp for execution tasks
- internal product/community data for actual behavioral proof

Current trigger surfaces:

- Discord / KIRA for phone-adjacent triggering that already exists in the repo
- Telegram webhook triggering is target architecture through n8n and is **NOT YET IMPLEMENTED**

Critical rule:

Notion and ClickUp are not raw-data stores.
They are operating layers on top of the intelligence system.

---

## Recommended Architecture

### Stage 1: Discover

Use search and known-source monitoring to discover:

- live audience language
- emerging narratives
- schools, creators, and communities worth tracking
- timing windows and trigger events

### Stage 2: Map

Map the terrain before optimizing messages.

Build:

- site graphs
- node candidates
- cluster candidates
- adjacency paths
- weak-tie hypotheses

### Stage 3: Capture

Use crawl and scrape tools to collect:

- source text
- comments
- post metadata
- creator metadata
- evidence of cluster structure

### Stage 4: Normalize

Normalize records into a common schema:

- source
- source type
- audience segment
- text/content
- date
- geography
- author/node
- network role hypothesis
- belief signal tags
- timing signal tags
- evidence tier hypothesis (`E0` to `E5`)

### Stage 5: Infer

Run inference on top of normalized records to estimate:

- Four Forces structure: Push, Pull, Anxiety, Habit
- awareness stage
- self-verdicts
- failed promises
- open loops
- timing windows
- cluster memberships
- maven / connector / bridge role hypotheses
- threshold-band hypotheses

All inferences start at `E0` until grounded in sources.

### Stage 6: Review

Human review is required before changing canonical maps.

The system can suggest:

- possible wedge shifts
- possible bridge nodes
- possible timing windows

But a human should approve any update to the canonical map.

### Stage 6.5: Disconfirm

Every major synthesis output should receive an adversarial pass from a separate agent context before promotion.

The disconfirmation pass should test:

- whether the signal is real or cherry-picked
- whether public evidence and first-party evidence disagree
- whether the conclusion outruns the available evidence tier
- whether the recommended action is likely to move cohort application rate or DM reply rate

### Stage 7: Publish

Publish the reviewed outputs to:

- Notion map databases
- ClickUp workflow tasks
- content briefs and the current distribution workflow
- sales and product operators
- product and cohort operators

For MVP, publishing to channels is still Phase 1 manual distribution.
The intelligence layer must still produce the brief and the routing decision even when posting is manual.

---

## Network Mapping Distinction

Do not collapse these into one bucket:

### Search discovery

Answers:

- what is being said?
- what new surfaces should we inspect?

### Site graph mapping

Answers:

- which organizations, pages, and public resources are linked?
- what adjacent nodes sit near the audience?

### Public influence graph mapping

Answers:

- who carries trust?
- who bridges clusters?
- where is belief actually moving?

### First-party graph mapping

Answers:

- who invited whom?
- where are referrals really coming from?
- which alumni or community members are actual bridge nodes?

### Rule

Website maps are not market-network maps.
Treat them as one input layer, not the whole topology.

---

## Signal Schema

| Signal type | What it reveals | Example |
|---|---|---|
| Belief signal | What the audience thinks is true | "AI is for tech people" |
| Identity signal | What self-story is active | "People like me are behind" |
| Failed-promise signal | What baggage they carry | "We already tried training and nothing changed" |
| Open-loop signal | Unresolved tension | "I finished KCSE but still do not know what comes next" |
| Timing signal | Window opening or closing | Exam results, school admissions, layoffs, curriculum changes |
| Topology signal | How information is moving | A creator shared by multiple school clusters |
| Trust signal | What trust layer is active | Comments asking "who has actually done this?" |
| Proof signal | What transformation is visible | Artifact shares, public before/after narratives |

---

## Topology Inference For K2M

Topology mapping for K2M should estimate:

- clusters
- mavens
- connectors
- bridge nodes
- threshold-zero nodes
- threshold-one bands
- likely cascade blockers

### Cluster examples

- Form 4 leavers
- university students
- teachers
- principals
- parents
- AI-curious early-career professionals
- school-linked church or youth networks

### Likely node types

- creator mavens
- school counselors
- teachers with local trust
- church/youth leaders
- student leaders
- alumni with visible proof
- parent community anchors

### K2M rule

Do not confuse engagement inside one cluster with market penetration.

The system should explicitly ask:

- did this message circulate?
- or did it cross a weak tie into a new cluster?

---

## Human Review Rules

Human review should confirm:

- whether a signal is real or noise
- whether a topology role assignment is plausible
- whether a timing window is truly open
- whether a canonical belief statement should change
- whether the evidence tier is strong enough for the proposed claim
- whether a disconfirmation pass has been completed for the synthesis

Nothing should update the canonical Layer 0 or Layer 1 maps automatically.
E1-E2 directional evidence can inform investigation, but it should not silently become canonical truth.

---

## Storage Model

### Raw store

Use a real database or warehouse for:

- scraped records
- search results
- post metadata
- source snapshots
- first-party events

Current state:

- a dedicated raw warehouse is **NOT YET IMPLEMENTED**
- the repo-local MCP server and Notion evidence records currently carry part of this function
- do not pretend the raw-data layer is complete

### Analysis store

Use a normalized table set for:

- belief signals
- topology signals
- timing signals
- evidence links
- inference outputs
- Four Forces fields
- evidence tiers and review state

### Operating layer

Use Notion for:

- canonical maps
- reviewed belief briefs
- reviewed topology briefs
- source summaries

Use ClickUp for:

- tasks
- investigations
- workflow execution
- fixes
- content production routing
- product-friction routing

Rule:

Notion is for reviewed maps and memos.
ClickUp is for moves.
Neither is the canonical raw scrape archive.

---

## Implementation State

What is already implemented in the repo:

- repo-local MCP server with Notion, ClickUp, Tavily, Firecrawl, and Apify integrations
- doctrine-scored collection and audience recipes in `tools/k2m_mcp/intel_layer.py`
- `run_map_update`, `phase1-status`, `phase1-reconcile`, and `student-phase1-audit` jobs
- KIRA Discord bot runtime in `cis-discord-bot/`

What is partially implemented:

- live student slice records in Notion and ClickUp
- map update memo and workflow run support
- evidence-tier inference in the MCP layer

What is not yet implemented:

- n8n sensing pipelines as live scheduled production loops
- Telegram-triggered runtime
- fully automated content distribution from map changes
- dedicated raw warehouse for high-volume source storage

---

## Minimum Viable Build

### Phase 1

- Tavily for discovery and site mapping
- Firecrawl and/or Apify for narrowly scoped public collection
- MCP for orchestration, scoring, and Notion/ClickUp writes
- manual first-party graph logging
- manual review into Notion
- manual publish from approved content briefs

Phase 1 is the MVP target.
Do not skip it.

### Phase 2

- n8n scheduled collection
- site graph refresh
- public influence node tracking
- normalized signal schema hardening
- topology scoring
- timing-window alerts
- semi-automated scheduling and cross-posting with human review

### Phase 3

- stronger first-party graph analysis
- automatic draft memos
- workflow routing into ClickUp
- bridge-node confidence scoring
- adjacent-cluster entry detection
- MCP-triggered content distribution with human review gates intact

---

## Source Prioritization For K2M

Start with sources closest to the current beachhead:

1. K2M first-party waitlist and community signals
2. Kenyan student and school public surfaces
3. educator and parent public discussion surfaces
4. adjacent AI education and transition competitors
5. broader East Africa expansion surfaces

Do not start by scraping everything.
Start by over-learning one beachhead network.

---

## Free-Tier-First Rule

If the immediate constraint is generous free usage with agent-friendly tooling:

1. start with Tavily
2. add Brave only if a second search/discovery source is needed
3. add Apify only for narrowly scoped public-platform pulls
4. treat Firecrawl as optional once public-site extraction becomes the real bottleneck

The intelligence OS should optimize for signal quality per credit, not raw scraping volume.

---

## Open Risks

- scraping volume without inference quality
- platform dependence on third-party actors
- mistaking popularity for bridge-node value
- updating the map too quickly on weak evidence
- overfitting to public signals and ignoring first-party signals
- shipping intelligence that never changes cohort application rate or DM reply rate

---

## Canonical Rule

The live intelligence OS exists to answer one ongoing question:

> What does this audience currently believe, how is that belief moving, and what changed since the last map?

If a source or tool does not help answer that, it is secondary.

---

*Use this document to design the live sensing layer for K2M's belief operations system.*
