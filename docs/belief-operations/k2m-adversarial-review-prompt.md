# K2M Adversarial Review Prompt

Use this prompt when you want another agent to test whether K2M belief operations is actually operational, not just well-described.

This is not a friendly review prompt.
It is a stress-test prompt.

## Current Best Use

Use this now to test whether the student slice is actually operational under PRD v0.2, not just structurally documented.

The review should not stop at "Phase 1 structure exists."
It should also test whether the PRD's stronger execution contract is present:

- Phase 0 Product Truth coverage exists for all planned audiences before deep implementation claims are made
- one beachhead slice has a real execution chain from intelligence to content, product friction, retention/referral output, or map correction
- major synthesis outputs show Four Forces structure, evidence tiers, and disconfirmation
- external reality metrics can falsify internal confidence

If those conditions are not met, Phase 1 is not complete.

## Pasteable Prompt

```text
You are performing an adversarial review of the K2M belief operations system.

Your job is not to be agreeable.
Your job is to find where the system is overstating its maturity, hiding ambiguity, or confusing documentation with execution.

Review target:
- Determine whether Phase 1 has actually been completed correctly.
- If it has not, identify exactly what is missing, what is weak, and what claims should be downgraded.

Phase 1 under PRD v0.2 should mean all of the following are true:
- Phase 0 Product Truth coverage exists for students, teachers, principals, and B2B at the level required by the PRD
- one locked Layer 0 product truth exists for the active beachhead
- one working ClickUp execution slice exists for the first workflow
- one working Notion canonical slice exists with first real records
- one live intelligence input loop exists and produces reviewed evidence
- one visible marketing-intelligence coverage tracker exists
- belief conclusions are represented in Four Forces form where required
- major synthesis outputs carry evidence tiers and disconfirmation notes
- at least one last-mile output path exists from intelligence into a content brief, product friction fix, retention intervention, referral asset, or canonical map update
- cohort application rate and DM reply rate exist as live falsification metrics, even if early and sparse

Sources you must review:
- docs/k2m-layer4-product-brief.md
- docs/belief-operations/k2m-belief-operations-execution-prd.md
- docs/belief-operations/agent-handoff-log.md
- docs/belief-operations/k2m-belief-operations-os.md
- docs/belief-operations/k2m-skill-architecture.md
- docs/belief-operations/k2m-live-market-intelligence-os.md
- docs/belief-operations/k2m-clickup-workflow-architecture.md
- docs/belief-operations/k2m-notion-information-architecture.md
- docs/belief-operations/k2m-governance-and-map-update-protocol.md
- docs/belief-operations/k2m-runtime-state.md
- docs/belief-operations/evolution-log.yaml

If MCP access to ClickUp or Notion is available, inspect the live systems.
Do not trust the documentation over the live systems.
If docs and reality conflict, treat the live system as primary and call out the mismatch explicitly.

Adversarial review rules:
- assume nothing is done unless you can point to evidence
- distinguish clearly between documented, scaffolded, partially live, and operational
- call out false confidence, premature structure, shallow objects, and missing joins between systems
- do not reward "good architecture" if the runtime system is still weak
- prefer findings over summaries

You must test the system across these dimensions:

1. Product truth integrity
- Is Phase 0 Product Truth coverage really present for all planned audiences, or only asserted?
- Is the student beachhead Layer 0 truth explicit, linked, owned, review-dated, and usable?
- Are bridge identity, product belief, category belief, payoff, and proof object actually present?

2. ClickUp execution reality
- Can one real workflow run from intake to review without inventing missing structure?
- Are statuses, fields, owners, reviewers, and repeatable task patterns actually present?
- Is the current slice comparable to the maturity of the existing CRM operating model?
- Can ClickUp represent last-mile outputs beyond analysis, including content, friction fixes, retention interventions, and referral assets?

3. Notion canonical reality
- Do the core databases have real records, not just schema?
- Do records show evidence status, owners, reviewers, and next review dates?
- Are Workflow Runs, Map Update Memos, Evidence Sources, and Border Issue Log seeded?
- Do Belief Map records actually express conclusions in Four Forces form where required?
- Do Product Truth / Belief Map / Topology / memo records show evidence tiers and disconfirmation where major synthesis exists?

4. Live intelligence Phase 1 reality
- Is there a real input loop from source collection to reviewed evidence?
- Is first-party signal logging represented anywhere real?
- Is there proof that one discovery-to-review cycle has been completed?
- Is the runtime distinction between live now and target architecture stated honestly, especially for n8n, distribution automation, and standalone skills?

5. Coverage and governance
- Can the team tell what percentage of marketing intelligence is built, covered, fresh, and being run on cadence?
- Is there a clear distinction between current-state handoff and milestone history?
- Is disconfirmation required in practice, not just praised in prose?
- Can external reality metrics reopen an internal conclusion if cohort application rate or DM reply rate do not improve?

Output contract:

Start with findings only.
Order findings by severity.
For each finding include:
- severity
- what is wrong
- evidence
- why it matters
- minimum repair

Then provide:

1. Phase 1 verdict
- Complete
- Partially complete
- Not complete

2. A truth table with one line each for:
- Phase 0 Product Truth coverage
- product truth
- ClickUp execution
- Notion canonical layer
- live intelligence loop
- coverage tracking
- last-mile execution path
- external metric falsification

Mark each as:
- operational
- partially operational
- scaffold only
- absent

3. Claims that should be downgraded
- list any statements in docs or handoff logs that sound more complete than reality

4. Fastest correction path
- give the smallest set of actions required to make Phase 1 genuinely complete

5. Residual risks
- what could still fail even after the correction path is done

Do not produce motivational language.
Do not soften the findings.
Be exact.
```

## Expected Verdict Standard

The review should fail Phase 1 if any of these are missing:

- no credible Phase 0 Product Truth coverage for all planned audiences
- no real reviewed evidence packet
- no real `Workflow Run`
- no real `Map Update Memo`
- no real `Evidence Source` records
- no visible marketing-intelligence coverage tracker
- no repeatable execution slice in ClickUp
- no evidence-tier and disconfirmation discipline on major synthesis
- no visible last-mile route from intelligence into content, product fixes, retention/referral assets, or canonical change
- no external reality metrics capable of falsifying the team's confidence

## What To Do After The Review

- Convert every critical finding into a ClickUp task or sprint story.
- Update [agent-handoff-log.md](./agent-handoff-log.md) with the reviewed state.
- Update [evolution-log.yaml](./evolution-log.yaml) only if the review changes milestone status.
