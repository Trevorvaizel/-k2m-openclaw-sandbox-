# K2M Runtime State
## Current Belief-Operations Execution Architecture

*Status: reconciled against PRD v0.2 - 2026-04-10*

---

## Purpose

This document describes how the K2M belief-operations system is running now.

It is not doctrine.
It is not the target architecture in the abstract.

It is the current runtime shape:

- which systems are active
- what each system owns
- how agents are expected to use them
- what is wired already
- what is still missing

Use the PRD for target scope and build order.
Use this file for current runtime truth only.

---

## Current Runtime Rule

The runtime stack now works as a layered system:

1. **Doctrine layer**
   - belief canon and architecture docs in this folder
2. **Cognition layer**
   - Claude Code
3. **Sensing layer**
   - n8n is the target event-loop layer but is **NOT YET LIVE** as a production belief-ops loop
   - current collection is still primarily MCP-driven with provider calls
4. **Orchestration layer**
   - local `k2m-belief-ops` MCP server in `tools/k2m_mcp`
   - raw request tools exist only as admin-only escape hatches and are disabled by default
5. **Canonical map layer**
   - Notion
6. **Execution layer**
   - ClickUp
7. **Client / trigger layer**
   - Codex
   - Claude Code
   - KIRA Discord bot exists in repo
   - Telegram triggering is target architecture, not verified live here

---

## What Owns What

### Notion

Notion remains the canonical reviewed-knowledge layer.

It should hold:

- Product Truth records
- Belief Maps
- Topology Maps
- Workflow Runs
- Map Update Memos
- Border Issue Log
- Evidence Sources
- Coverage Tracker

The local K2M MCP server is now writing these K2M-shaped records directly through the configured `NOTION_API_TOKEN`.

### ClickUp

ClickUp remains the execution layer.

It should hold:

- workflow tasks
- workflow runs as execution objects
- canonical change requests
- border-fix tasks
- live-intelligence tasks
- governance and review tasks

The live K2M belief-operations structure discovered by the local server is in:

- workspace/team: `K2M Labs`
- space: `K2M Marketing Intelligence`

`K2M Internal OS` should no longer be treated as the primary runtime belief-operations space.

### n8n

n8n is part of the decided runtime architecture, but this repo does not yet show a live production n8n belief-ops loop.

Current state:

- n8n is target architecture for schedules, webhooks, and later distribution automation
- no repo-backed evidence in this reconciliation proves the sensing loop is already running autonomously in n8n

### Apify and Firecrawl

These are the collection tools.

They do not store canonical truth.

They are used to:

- discover public sources
- scrape websites
- pull comments and post-level public social data

### Local K2M MCP Server

This is now the orchestration layer.

It translates K2M operating intent into actions across:

- ClickUp
- Notion
- Apify
- Firecrawl

The server is repo-local and launched from:

- `tools/k2m_mcp/run.cmd`

It reads workspace-local config from:

- `.env.mcp`
- `.env`

### KIRA Discord runtime

`cis-discord-bot/` is a real implemented system in this repo.

Current state:

- KIRA exists as a student-facing Discord runtime
- KIRA is not yet documented here as fully integrated into the belief-ops last-mile loop
- phone-triggered belief-ops operations remain target architecture until the orchestration path is explicitly wired

---

## Current MCP Surfaces

### Project-scoped MCP config

The repo-level `.mcp.json` now defines:

- local `k2m-belief-ops`

This is the portability layer for:

- Codex
- Claude Code

### Local K2M MCP tools

The current local server exposes five tool classes:

1. **Raw integration tools**
   - `clickup_request`
   - `notion_request`
   - `apify_run_actor`
   - `apify_get_dataset_items`
   - `firecrawl_search`
   - `firecrawl_scrape`

   These are admin-only and remain off by default.

2. **ClickUp operating tools**
   - `clickup_list_tasks`
   - `clickup_find_tasks_by_name`
   - `clickup_get_statuses`
   - `clickup_close_task`
   - `k2m_clickup_*`

3. **Notion operating tools**
   - `k2m_notion_discover_hub`
   - `k2m_notion_find_core_assets`
   - `k2m_notion_upsert_*`
   - `k2m_notion_sync_workflow_run`
   - `k2m_notion_create_*`
   - `k2m_notion_update_coverage_tracker`

4. **Intelligence and audit tools**
   - `k2m_intel_collect_student_signals`
   - `k2m_intel_collect_teacher_signals`
   - `k2m_intel_collect_b2b_signals`
   - `k2m_intel_explain_audit_targets`
   - `k2m_intel_list_collectors`
   - `k2m_intel_run_map_update`
   - `k2m_phase1_status`
   - `k2m_phase1_reconcile`
   - `k2m_student_phase1_audit`

5. **Operating-contract tools**
   - `k2m_operating_contract`

This contract layer exists so agents and internal operators can answer:

- what each tool layer is for
- what it should look for
- what it must not do
- what checklist gates writes

The same contract is now propagated into generated runtime objects:

- new ClickUp tasks created through `k2m_clickup_*` include execution and doctrine checklist sections in the task description
- new Notion records created through `k2m_notion_*` include canonical checklist blocks in the page body

This applies to newly generated objects. It does not retroactively rewrite older tasks or pages.

---

## Shared Job Runner

There is now one non-MCP runner for the same logic:

- `tools/k2m_mcp/jobs.py`

Current shared jobs:

- `phase1-status`
- `phase1-reconcile`
- `student-phase1-audit`
- `student-intel-refresh`
- `teacher-intel-refresh`
- `b2b-intel-refresh`

Rule:

The CLI jobs and the MCP tools should call the same business logic.
No important behavior should live only in prompts.

---

## Collection Logic Currently Encoded

The current collection layer is now doctrine-scored rather than only query-driven.

Already encoded:

- audience slices: student, teacher, b2b
- principal / school-leader audience is not yet encoded as a dedicated collection recipe
- geography default: Kenya
- recency default: 365 days
- comments and post surfaces prioritized over article-only sources
- belief-audit targets scored against source text
- topology-audit targets scored against source text
- signal classes scored: belief, identity, failed promise, open loop, timing, topology, trust, proof
- provider registry with live status and extension method
- optional Tavily discovery and site-map hooks
- student TikTok actor
- Facebook comments actor
- YouTube comments actor
- Phase 1 reconciliation rules
- heuristic evidence-tier grading

Belief audit targets now searched:

- problem frame
- awareness stage
- self-verdict map
- failed-promises map
- open-loop inventory
- bridge identity

Topology audit targets now searched:

- cluster map
- bridge-node map
- maven map
- connector map
- threshold-band hypothesis
- timing-window map
- cascade-risk hypothesis

Still partial:

- evidence-tier grading is stronger but still heuristic
- topology inference remains cue-based rather than graph-complete
- first-party signal logging is still mostly manual unless a provider is added for it

So the runtime is now:

- operational at orchestration
- partial-to-operational at semantic inference, depending on the audience and source quality
- not yet operational as a fully autonomous end-to-end market engine

---

## Current Known Gaps

1. Phase 0 Product Truth coverage for all planned audiences is not yet evidenced as complete in the repo docs/runtime state.
2. The named 10-skill architecture is canonical, but most skills do not yet exist as full standalone implemented runtime skills.
3. n8n sensing and distribution loops are target architecture, not verified live runtime in this reconciliation.
4. Content production, product friction, retention, and referral are not yet evidenced as repeatable last-mile operating loops.
5. External reality metrics exist in the PRD, but this runtime doc cannot yet claim they are wired into a live dashboarded control loop.
6. Runtime-state documentation must be refreshed after each major implementation change.

---

## Current Student Phase 1 State

- Audience state: `active`
- Slice build state: `phase1_partial`
- Student is still the only active audience slice.
- Teacher, principal, and B2B should be treated as hypothesis or researching slices until Phase 0 coverage and activation gates are met.
- Strong student evidence exists, including direct public-comment sources.
- Core student canonical records exist:
  - Product Truth `333b7a9d-6129-8066-977f-e77aa4170435`
  - Belief Map `333b7a9d-6129-81ac-a126-f464e5a31ef3`
  - Topology Map `333b7a9d-6129-8143-8a38-c4d6715f3624`
  - Workflow Run `333b7a9d-6129-8123-b378-c75d2b6bfdd5`
  - Map Update Memo `333b7a9d-6129-818b-af71-c5fa86944289`
  - Coverage Tracker `333b7a9d-6129-8112-84b4-d2672ef05ffb`

Current runtime truth to preserve:

- the student slice is beyond scaffold state
- the orchestration layer is real
- the live governance chain and graph completeness have been disputed and should not be overstated as fully closed
- raw request tools are admin-only and not part of the default operator path

What this file should currently assume unless re-verified live:

- Product Truth, Belief Map, and Topology Map may be approved while still carrying thin relations or stale downstream linkage
- Workflow Run and Map Update Memo closure state must be checked before claiming the student loop is complete
- coverage visibility exists, but freshness and accuracy must be re-verified against live state
- March 30 "complete" claims are superseded by the stricter April PRD and re-review standard
- `phase1_partial` describes the build state; `active` describes the audience state

---

## Verification Commands

Use these to inspect the current runtime state:

```powershell
.\tools\k2m_mcp\run.cmd --self-test
.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py phase1-status
.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py phase1-reconcile
.\\.venv\\Scripts\\python.exe .\\tools\\k2m_mcp\\jobs.py student-phase1-audit
.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py collectors
.\.venv\Scripts\python.exe .\tools\k2m_mcp\jobs.py audit-targets student
```

---

## Update Protocol

After each completed implementation change that affects runtime behavior:

1. update this file
2. update `agent-handoff-log.md`
3. update `evolution-log.yaml` if the change is milestone-level or changes system architecture

This file should describe the current run state, not desired future state.
