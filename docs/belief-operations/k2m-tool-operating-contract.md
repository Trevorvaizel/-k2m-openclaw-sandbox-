# K2M Tool Operating Contract
## What Each Tool Is For, What It Should Look For, And What It Must Not Do

*Status: reconciled against PRD v0.2 - 2026-04-10*

---

## Purpose

This document exists so agents and human operators do not treat every tool as a generic workspace.

It answers four questions for each tool layer:

1. what is this tool for
2. why does it exist in the K2M system
3. what should we look for here
4. what must not happen here

The governing sentence is:

> Notion stores maps. ClickUp runs moves. Collection tools gather candidate evidence. The local MCP server enforces doctrine through dedicated governance tools before writes.

This contract covers the MCP-facing tool layers.
The broader runtime still includes Claude Code for cognition and n8n for sensing/event loops and later distribution automation.

---

## Notion

### Role

Canonical reviewed truth.

### Why

Notion stores:

- product truth
- belief maps
- topology maps
- reviewed evidence summaries
- workflow runs
- map update memos
- coverage state

### Look For

- product truth records with owners, reviewers, review dates, and evidence tiers
- active audience belief maps and topology maps
- workflow runs linked to evidence and memos
- coverage tracker freshness and cadence
- disconfirmation or review notes where major synthesis has occurred

### Must Not Do

- do not dump raw scrape payloads into Notion
- do not treat Notion as the raw-data lake
- do not update canonical maps automatically on weak evidence

### Write Checklist

- only reviewed summaries go in
- link evidence sources
- set owner and reviewer where supported
- set next review when the record is canonical or operational
- do not promote weak E1-E2 directional signals into canonical state

---

## ClickUp

### Role

Execution and workflow gating.

### Why

ClickUp runs:

- workflow tasks
- governance review
- border fixes
- canonical change requests
- live-intelligence execution slices
- downstream content, friction, retention, and referral work

### Look For

- workflow-run tasks in the correct canonical list
- review tasks that correspond to Notion records
- status, owner, reviewer, and field completeness
- open border or canonical repairs
- last-mile tasks created because the map changed

### Must Not Do

- do not treat ClickUp as the belief map
- do not create tasks without a territory or workflow reason
- do not close tasks with invented statuses

### Write Checklist

- route into the correct list
- use the correct workflow or task type
- include the diagnosis or memo link
- set status through the live status map
- note the affected external metric when the work is meant to move one

---

## Tavily

### Role

Discovery and site-graph expansion.

### Why

Tavily is the first-pass discovery layer for:

- fresh query surfaces
- adjacent sites and institutions
- site-neighborhood expansion
- timing and topology discovery on the public web

### Look For

- fresh pages with active audience language
- adjacent nodes near schools, communities, creators, or employers
- new pages that reveal timing or topology shifts

### Must Not Do

- do not confuse site maps with market topology
- do not treat Tavily alone as proof of belief movement

### Write Checklist

- normalize URLs into the common source shape
- pass content through doctrine scoring before any write
- use Tavily mainly for discovery and mapping

---

## Firecrawl

### Role

Public web extraction.

### Why

Firecrawl extracts page content once a promising source has been discovered.

### Look For

- explicit audience language
- timing windows
- proof objects
- institutional or media pages that help fill doctrine gaps

### Must Not Do

- do not use Firecrawl as the only topology layer
- do not over-collect pages that do not improve the audit

### Write Checklist

- extract only the minimum useful content
- score the content against doctrine targets
- promote only reviewed summaries into Notion

---

## Apify

### Role

Platform-specific public scraping.

### Why

Apify handles public social or community surfaces where generic web extraction is weak.

### Look For

- direct voice in comments and posts
- identity, open-loop, trust, and failed-promise language
- creator or community nodes that appear to bridge clusters

### Must Not Do

- do not scrape broadly without a beachhead hypothesis
- do not store raw dumps in canonical systems

### Write Checklist

- keep the actor scoped to the audience recipe
- normalize the dataset into the common source shape
- score it for doctrine signals before producing evidence summaries

---

## Doctrine Checklists

### Belief Audit Must Look For

- Four Forces structure: Push, Pull, Anxiety, Habit
- problem frame
- awareness stage
- self-verdict map
- failed-promises map
- open-loop inventory
- bridge identity

### Topology Audit Must Look For

- cluster map
- bridge-node map
- maven map
- connector map
- threshold-band hypothesis
- timing-window map
- cascade-risk hypothesis

### Signal Classes To Score

- belief
- identity
- failed promise
- open loop
- timing
- topology
- trust
- proof

---

## Runtime Access

Agents can query the current machine-readable version of this contract through:

- `k2m_operating_contract`
- `k2m_intel_explain_audit_targets`
- `k2m_intel_list_collectors`

Generated runtime objects now inherit this contract:

- ClickUp tasks created through the local K2M MCP layer include execution and doctrine checklist sections in the description
- Notion records created through the local K2M MCP layer include canonical checklist blocks in the page body

The runtime implementation lives in:

- `tools/k2m_mcp/operating_contract.py`
- `tools/k2m_mcp/signal_rules.py`
- `tools/k2m_mcp/intel_layer.py`

Current implementation note:

- this document is partially executable because the repo-local MCP server already emits checklist sections into created Notion and ClickUp objects
- raw request tools are not part of the default operator surface and remain admin-only
- disconfirmation is now encoded through dedicated governance tools, including review submission, disconfirmation, promotion, and debt watching
