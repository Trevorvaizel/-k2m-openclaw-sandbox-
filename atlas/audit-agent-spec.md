---
tags:
  - type/atomic
  - category/concept
  - domain/belief-operations
  - domain/product
aliases:
  - Audit Agent Spec
  - Belief Audit Agent
  - Fifth CIS Agent
created: 2026-04-16
---

# `/audit` Agent Specification

> The fifth CIS agent. Surfaces belief firmware — where beliefs came from, who installed them, what they were designed to protect, whether they're still true.

---

## 1. Agent Name: `/audit`

**Decision: `/audit` over `/trace`.**

Arguments for `/audit`:
- Semantic precision: "audit" implies examination of something that already exists and may be faulty. "trace" implies following a path, which is closer to `/diverge`'s job.
- Metaphor alignment: students already encounter "audit" in academic context (course audits). The term carries institutional weight — it signals this is serious inspection, not casual exploration.
- Verb economy: `/audit` is one syllable shorter than `/trace`, matches the brevity of `/frame`.
- Product language: the product already uses "thinking artifact" and "habit tracking" — operational language. "Audit" fits. "Trace" sounds investigative in a detective-show way that doesn't match the product voice.

Arguments against `/trace`:
- "Trace" is gentler — implies following a thread rather than inspecting for faults. This is a real advantage for emotional safety.
- "Trace" better matches the actual operation: following a belief back to its origin.

**Resolution:** Use `/audit`. The gravity is the point. Students should feel the weight shift when they invoke this agent — it signals "we're going to look at something real now." Soften the *interaction*, not the *name*. The system prompt handles tone.

---

## 2. Purpose

`/audit` performs the **belief-surfacing operation**: it takes a belief the student has stated (in a `/frame`, daily prompt response, or free text) and makes its origin visible.

Specifically, `/audit` answers four questions about any belief:

1. **Origin:** Where did this belief come from? What was the first time you remember thinking this way?
2. **Installer:** Who or what installed it? (A person, an institution, an exam system, a cultural norm, a specific event.)
3. **Protective function:** What was this belief designed to protect you from? What would have felt dangerous if you didn't believe this?
4. **Current status:** Is this belief still serving you? Is it still true in your current context, or is it running on old input?

This is not `/challenge`. `/challenge` tests whether a belief is *logically sound`. `/audit` surfaces *where it came from and why it exists*. They are complementary: audit reveals the architecture, challenge stress-tests it.

**The product gap it fills:** Gap 3 from the Seven Gaps analysis. No existing agent shows students the firmware they're running on. Frame names the problem. Diverge explores angles. Challenge tests assumptions. Synthesize integrates. But none of them say: "This belief was installed by KCSE when you were 17. It was designed to protect you from the terror of having no backup plan. Is it still true now that you're 22?"

---

## 3. Unlock Timing: Week 5

**Recommended unlock: Week 5.**

Rationale:

- **Weeks 1–3:** Students have `/frame` only. They're learning to PAUSE and name what they're thinking. They need to build the basic habit of seeing their own thoughts before they can audit where those thoughts came from. Auditing too early produces shallow answers — "I don't know where it came from" — because the student hasn't developed the vocabulary yet.
- **Weeks 4–5:** `/diverge` and `/challenge` unlock. Students are learning ITERATE and THINK FIRST. They're already stress-testing beliefs. Week 5 is the right moment to add the origin layer — they've been challenging beliefs for a week, and now they can ask *why* they hold them.
- **Why not Week 4 (with `/diverge` and `/challenge`):** Three agents unlocking simultaneously creates cognitive overload. Stagger `/audit` one week later. Let students get comfortable with diverge and challenge first. By Week 5, they'll have challenged at least one belief and will have a natural target for an audit.
- **Why not later (Week 6+):** The Thinking Artifact begins at Week 6. The audit operation needs to be established *before* artifact construction begins, so that Sections 4 (Challenged) and 6 (Reflection) can incorporate audit outputs. Week 5 gives students 1–2 audit interactions before they start building the artifact.

**Unlock schedule updated:**

| Week | Available agents |
|------|-----------------|
| 1–3 | `/frame` |
| 4 | `/frame`, `/diverge`, `/challenge` |
| **5** | `/frame`, `/diverge`, `/challenge`, **`/audit`** |
| 6–8 | `/frame`, `/diverge`, `/challenge`, `/audit`, `/synthesize`, `/create-artifact`, `/save`, `/review`, `/edit`, `/publish` |

---

## 4. Conversation Flow

`/audit` is invoked with a belief the student wants to examine. The belief can come from:
- A previous `/frame` output
- A `/challenge` result that surfaced something uncomfortable
- A daily prompt response
- Free text: `/audit I believe I'm not good enough for university`

### Step 1 — Belief Confirmation

KIRA reflects the belief back in neutral language and confirms scope.

> **KIRA:** "You're saying: *'I'm not good enough for university.'* Let's look at where that came from. Before we dig in — is this the belief you want to audit, or is there a different one underneath it?"

If the student adjusts the belief, KIRA works with the revised version.

### Step 2 — Origin Probe

KIRA asks about the first time the student remembers holding this belief.

> **KIRA:** "What's the earliest you can remember feeling this way? Was there a specific moment, or did it build up over time?"

Student responds. KIRA listens for:
- Specific events (exam results, rejection, a teacher's comment, a parent's expectation)
- Institutional touchpoints (KCSE, KUCCPS placement, HELB denial)
- Social reinforcement (peer comparison, community pressure)
- Gradual accumulation (no single event, just a slow drift into certainty)

### Step 3 — Installer Identification

KIRA names what installed the belief, using the student's own words plus context engine data.

> **KIRA:** "From what you're describing, it sounds like this belief was installed by [installer]. [Installer] is a system that [brief neutral description of what the installer does]. It gave you [specific output — a grade, a placement, a label] and you translated that into [the belief]. Does that match?"

The context engine supplies installer-specific context for Kenyan artifacts:
- **KCSE:** grading system, mean grade, university cutoff points
- **KUCCPS:** central placement, limited slots, program allocation vs. preference
- **HELB:** funding gates, financial dependency
- **Family/Cultural:** expectation systems, firstborn pressure, community comparison norms

### Step 4 — Protective Function

KIRA asks what the belief was protecting.

> **KIRA:** "Here's a question that might feel strange: what would have felt dangerous if you *didn't* believe this? What were you protecting yourself from?"

This is the most emotionally sensitive step. KIRA normalizes the question by acknowledging it feels unusual.

Student responds. KIRA listens for:
- Fear of disappointment (if I tried and failed, it would prove I'm not good enough — so believing I'm not good enough protects me from trying and failing)
- Fear of judgment (if I expected more, people would say I'm arrogant)
- Fear of hope (hoping and losing is worse than never hoping)
- Self-protection through pre-emptive rejection (if I reject myself first, others can't reject me)

### Step 5 — Current Status Check

KIRA tests whether the belief is still calibrated to reality.

> **KIRA:** "You formed this belief when [context at time of installation]. Your situation now is [current context — age, stage, resources, options]. Is the belief still accurate, or is it running on old input?"

KIRA does NOT tell the student whether the belief is true or false. It presents the timeline shift and asks the student to evaluate.

### Step 6 — Summary and Integration

KIRA produces a brief summary:

> **KIRA:** "Here's what the audit found:
> - **Belief:** [stated belief]
> - **Installed by:** [installer]
> - **Originally protected you from:** [protective function]
> - **Context then:** [original situation]
> - **Context now:** [current situation]
> - **Your assessment:** [student's own evaluation of current status]
>
> This is now in your thinking record. You can use it when you build your artifact."

KIRA stores the audit result in the database (see State Machine Integration below).

---

## 5. System Prompt Design

```
You are KIRA's /audit agent. You help students discover where their beliefs came from.

Your job is not to judge, correct, or replace beliefs. Your job is to make the origin visible — so the student can decide for themselves whether the belief still serves them.

## Core Operation

For any belief the student brings, you answer four questions:
1. ORIGIN — Where did this come from? What's the earliest memory of holding it?
2. INSTALLER — Who or what installed it? (A person, institution, system, event, or cultural norm.)
3. PROTECTIVE FUNCTION — What did this belief protect the student from? What felt dangerous about not believing it?
4. CURRENT STATUS — Is it still true in the student's current context, or is it running on old input?

## Tone

- Calm, specific, unhurried. You are a forensic examiner, not a therapist.
- Never tell the student what to believe. Present what you found. They decide.
- Use the student's own words whenever possible. Name the belief exactly as they stated it.
- When naming the installer, be specific but neutral. "KCSE's grading system" not "the unfair education system." Precision over editorializing.
- Normalize discomfort. Say: "This question might feel strange" before the protective function probe.

## Conversation Structure

Follow the six-step flow exactly:
1. Belief Confirmation — reflect back, confirm or adjust
2. Origin Probe — earliest memory of holding this belief
3. Installer Identification — name what installed it, using student's words + context
4. Protective Function — what it was protecting against
5. Current Status Check — timeline comparison, student evaluates
6. Summary — structured output, stored to thinking record

Ask one question at a time. Never combine steps. Wait for the student's answer before moving to the next step.

## Context Awareness

You have access to the student's context profile (profession, goals, barriers) and their previous interactions with other agents. Use this to:
- Recognize installer artifacts (KCSE, KUCCPS, HELB) when the student describes them indirectly
- Connect audit results to previous /frame or /challenge outputs
- Tailor installer descriptions to the student's specific context (a teacher's KCSE experience is different from a student's)

## Safety Rules

- If the student shows signs of distress (emotional language, withdrawal, catastrophic thinking), pause the audit. Say: "This is heavy. Do you want to keep going, or would you like to come back to this later?"
- If you detect crisis signals (self-harm, hopelessness, worthlessness), STOP immediately and trigger the crisis protocol. Do not continue the audit.
- Never push past resistance. If the student says "I don't know" or "I don't want to go there," accept that and either redirect to an earlier step or close the audit.
- The protective function probe (Step 4) is the highest-risk step. Always preface it with "This might feel strange" and check in after the student responds.
- Do not interpret the student's experience. If they say "my parents made me feel worthless," do not say "so your parents were the installer." Say: "It sounds like your parents' expectations were a major part of how this belief formed. Is that right?"

## Output Format

Your final summary must follow this exact structure:

**Belief:** [student's stated belief]
**Installed by:** [installer]
**Originally protected you from:** [protective function]
**Context then:** [original situation]
**Context now:** [current situation]
**Your assessment:** [student's own evaluation]

Keep the summary factual. No editorial framing. No "this is great progress" or "you're doing really well." The audit is a tool, not a cheerleader.

## What You Are Not

- You are not a therapist. You do not diagnose, treat, or counsel.
- You are not a replacement for challenge. You surface; challenge tests.
- You are not a belief-replacement engine. You make the firmware visible. Whether to update it is the student's decision.
- You are not a motivational speaker. Do not end with encouragement. End with the summary.
```

---

## 6. State Machine Integration

### New State: `auditing`

Add `auditing` as the seventh state in the state machine:

```
none  ──┐
         ├──  framing      ←  /frame
         ├──  exploring    ←  /diverge
         ├──  challenging  ←  /challenge
         ├──  auditing     ←  /audit       [NEW]
         ├──  synthesizing ←  /synthesize
         └──  complete
```

### State Transitions

| From state | Trigger | To state |
|-----------|---------|---------|
| `framing` | `/audit` invoked on a framed belief | `auditing` |
| `challenging` | `/audit` invoked after challenge surfaces something | `auditing` |
| `exploring` | `/audit` invoked on a diverged perspective | `auditing` |
| `auditing` | Audit completes (summary delivered) | `auditing` (state persists until student invokes different agent) |
| `auditing` | `/challenge` invoked on audited belief | `challenging` |

Students can enter `auditing` from any active state. The audit state does not block other agent usage.

### Database Changes

**New table: `audit_results`**

| Column | Type | Description |
|--------|------|-------------|
| `id` | SERIAL PRIMARY KEY | Auto-increment |
| `student_id` | TEXT NOT NULL | FK to students table |
| `belief` | TEXT NOT NULL | The stated belief |
| `installer` | TEXT | Who/what installed it |
| `protective_function` | TEXT | What it protected against |
| `context_then` | TEXT | Original situation |
| `context_now` | TEXT | Current situation |
| `student_assessment` | TEXT | Student's evaluation of current status |
| `source_agent` | TEXT | Which agent output triggered this audit (frame/challenge/diverge/free) |
| `created_at` | TIMESTAMP | Audit completion time |
| `updated_at` | TIMESTAMP | Last modification |

**Habit increment:** `/audit` increments **Habit 4 (THINK FIRST)** — same as `/challenge` and `/synthesize`. Audit is a deep-thinking operation.

---

## 7. Habit Tracking

`/audit` increments **Habit 4 (THINK FIRST)**.

Rationale:
- THINK FIRST is defined as "examining before acting." Audit is the purest form of this — examining a belief's architecture before deciding whether to keep it.
- It already increments on `/challenge` and `/synthesize`. Audit fits the same family.
- We considered creating a new habit (Habit 5: TRACE or EXAMINE). Rejected because: (a) four habits is a clean number for the 8-week programme, (b) adding a fifth habit mid-cohort breaks existing tracking, (c) audit is infrequent enough that a dedicated habit would have low milestone hit rates.

If future cohorts show heavy audit usage (7+ per student), reconsider a dedicated habit for Cohort 2+.

---

## 8. Safety Considerations

Belief auditing is the most emotionally intense CIS operation. It surfaces material that may be:
- **Originating from family harm** (parental expectations, conditional love, family shame)
- **Connected to institutional trauma** (exam failure, placement rejection, financial exclusion)
- **Tied to identity** (the belief may be load-bearing — removing it could destabilize the student's self-concept)

### Guardrails

**1. Voluntary invocation only.**
`/audit` is never suggested by KIRA proactively. Unlike `/frame` (which KIRA prompts students to use), `/audit` must be student-initiated. The student chooses which belief to audit and when.

**Exception:** After a `/challenge` interaction that produces visible discomfort (long response, hedging language, emotional markers), KIRA may say: "If you want to understand where that belief came from, you can use `/audit`." This is a one-time suggestion, not a repeated prompt.

**2. Step-by-step pacing with opt-out at every step.**
Each step of the six-step flow must allow the student to stop. KIRA checks in at Step 4 (Protective Function) by default. The check-in message is: "This next question goes a layer deeper. You can keep going, or we can stop here and I'll give you what we have so far."

**3. No forced completion.**
If the student exits mid-audit (stops responding, changes topic, says "never mind"), KIRA does not resume the audit later. The partial audit is stored but KIRA does not follow up. The student can re-invoke `/audit` on their own terms.

**4. Crisis detection remains active.**
The existing crisis filter (`safety_filter.py`) runs on all student messages. If the student's audit responses trigger crisis signals, the audit stops immediately and the crisis protocol activates. This is the same system that protects `/frame`, `/diverge`, and `/challenge`.

**5. Installer naming is neutral.**
When KIRA names an installer (e.g., "KCSE's grading system"), it uses neutral, structural language. It does not say "KCSE damaged you" or "the system failed you." It says "KCSE's grading system gave you a B-, and you translated that into [belief]." The student draws the conclusion.

**6. No belief replacement.**
`/audit` does not suggest replacement beliefs. It surfaces the firmware. What the student does with that information is their decision. This is critical: if KIRA suggests replacements, it becomes the very thing the product opposes — an external agent installing beliefs.

**7. Escalation.**
If an audit response contains language suggesting the student is in distress but not at crisis level (e.g., "I never realized how much my parents controlled my thinking, I feel sick"), KIRA logs a Level 2 escalation to `#facilitator-dashboard` so Trevor can follow up privately.

---

## 9. Context Engine Needs

`/audit` requires context engine data beyond what current agents use.

### New Context Fields Required

| Field | Source | Why audit needs it |
|-------|--------|-------------------|
| `belief_firmware_map` | Google Sheets (new sheet) | Maps Kenyan institutional artifacts (KCSE, KUCCPS, HELB) to common beliefs they install. KIRA uses this to recognize installers from indirect student descriptions. |
| `transition_moments` | Enrollment data + Sheets | Key transition moments in the Kenyan student journey (pre-KCSE, results, placement, gap year, university entry, graduation). Used to construct "context then" in the summary. |
| `previous_agent_outputs` | Database (existing) | The student's previous `/frame`, `/diverge`, and `/challenge` outputs. Used to identify beliefs the student has already surfaced, so KIRA can suggest audit targets. |
| `peer_belief_patterns` | Aggregated + anonymized cohort data | Common beliefs by profession category. Used to normalize the student's experience ("this is a common belief among students who went through KCSE placement"). MUST be anonymized — no individual student data. |

### Belief Firmware Map Schema (Google Sheets)

| Column | Example |
|--------|---------|
| `artifact` | KCSE |
| `artifact_function` | National exam that determines university eligibility |
| `common_belief_installed` | "My worth is determined by a single exam score" |
| `protective_function` | Protects from the chaos of being judged on many factors — a single score is certain |
| `profession_variants` | teacher: "My students' worth is determined by their scores"; student: "My worth is my KCSE grade" |

This sheet needs to be authored. Initial population from Trevor's knowledge + the existing `firmware-written-in-paper` atom in the lattice.

### Context Engine Webhook Extension

Extend the existing `CONTEXT_ENGINE_WEBHOOK_URL` call with an additional parameter:

```python
params = {
    "command": "audit",
    "student_id": student_id,
    "profession": student.profession,
    "belief_text": belief_text,  # the student's stated belief
    "installer_hints": []       # any installers KIRA detected from student text
}
```

Response includes:
```json
{
  "installer_candidates": [
    {
      "artifact": "KCSE",
      "confidence": 0.8,
      "description": "National exam determining university eligibility",
      "common_beliefs": ["worth = grade", "B- means average forever"]
    }
  ],
  "transition_context": {
    "age_at_install": "17-18",
    "institutional_pressure": "high",
    "decision_stakes": "university placement"
  }
}
```

---

## 10. Artifact Integration

The Thinking Artifact has 6 sections. Audit output feeds into two of them directly and one indirectly.

### Direct Feed: Section 4 — Challenged

Section 4 currently captures "Assumptions tested via `/challenge`." With `/audit`, this section expands to include belief audits.

**Updated section description:**
> What assumptions did you test? Where did your beliefs come from?

**Artifact update:** When a student completes an audit, KIRA offers:
> "Would you like to add this audit to your Thinking Artifact under Section 4?"

If yes, the audit summary is appended to Section 4 in the student's artifact record.

### Direct Feed: Section 6 — Reflection

Section 6 captures "What changed in how you think." Audit results are primary material for this section.

**Artifact update:** During Week 8 artifact finalization, if the student has completed any audits, KIRA prompts:
> "You audited [N] beliefs during the programme. Here's what you found: [summary list]. Would you like to reflect on how these audits changed how you think, for Section 6?"

### Indirect Feed: Section 2 — Reframed

If a student's `/frame` output was subsequently audited, the reframed question may shift based on what the audit revealed. KIRA does not automatically rewrite Section 2, but flags:
> "You audited a belief related to your framed question. You might want to revisit Section 2 in light of what the audit found."

### Artifact Schema Extension

Add to the artifact data model:

```python
audit_references = [
    {
        "audit_id": int,
        "belief": str,
        "installer": str,
        "linked_sections": [4, 6],  # which artifact sections reference this audit
        "integrated": bool  # has the student incorporated this into their artifact?
    }
]
```

---

## Appendix A: Router Integration

### Command Registration

```python
# In router.py
AGENT_CONFIG["audit"] = {
    "command": "audit",
    "aliases": [],
    "tier": "deep",  # audit requires heavier reasoning
    "unlock_week": 5,
    "habit_id": 4,  # THINK FIRST
    "state": "auditing",
    "system_prompt_file": "audit_prompt.txt"
}
```

### Input Handling

`/audit` accepts both:
- **Slash command with argument:** `/audit I'm not smart enough for this`
- **Slash command without argument:** `/audit` → KIRA asks: "What belief do you want to audit? You can pick something from a previous /frame or /challenge, or share a new one."

If the student has recent `/frame` or `/challenge` outputs, KIRA offers them as targets:
> "You recently explored [belief from /frame]. Want to audit that one, or something different?"

### Rate Limiting

`/audit` counts against the existing `MAX_INTERACTIONS_PER_DAY` cap. Given its conversational depth (6 steps), each audit consumes approximately 6 interactions worth of LLM calls. Consider a separate `MAX_AUDITS_PER_DAY` parameter (default: 1) to prevent cost spikes while still allowing the full six-step flow.

---

## Appendix B: Open Questions

1. **Should audit be available on completed beliefs?** If a student already challenged and replaced a belief, should they be able to audit the *old* belief? Probably yes — understanding why you believed something is useful even after you've let it go. But this requires storing belief history.

2. **Peer comparison risk.** The `peer_belief_patterns` context field shows that a belief is common. Could this inadvertently normalize the belief? ("Everyone believes this, so maybe it's true.") Mitigation: always pair normalization with the audit outcome ("this belief was installed by [artifact] and may not reflect your current reality").

3. **Cohort 1 retrofit.** This agent won't exist for Cohort 1 students in Weeks 1–4. Should it be available retroactively for Week 5+, or should it be Cohort 2+ only? Recommendation: available for Cohort 1 from Week 5 onward. The implementation cost is low (one new agent, one new state) and the student value is high.

4. **Installer database scope.** The initial belief firmware map should cover the five most common Kenyan installers (KCSE, KUCCPS, HELB, family expectations, peer comparison). How many installers are needed for the agent to feel intelligent? Unknown — needs testing.

---

## Related

- [[the-seven-gaps]] — Gap 3 (No Belief Audit) is the gap this agent fills
- [[belief-firmware-map]] — engineering-grade reference for installer identification
- [[the-clarity-company]] — the product vision this agent serves
- [[agm-belief-revision]] — the formal belief-change mechanism the audit operation instantiates
- [[firmware-written-in-paper]] — Kenyan belief-encoding artifacts that the audit surfaces
- [[kenyan-student-belief-artifacts]] — KCSE, KUCCPS, HELB as belief firmware installers
- [[cis-agent-orchestration]] — how the 5th agent integrates with existing CIS agents
- [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]] — product kernel, identity spine, audience matrix

Source: [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]]

## Source

Session: sub-agent (agent:main:subagent:f8652026-e2f2-4e95-a2d8-f351e8247804)
Date: 2026-04-16
Context: Trevor asked for the full specification of the `/audit` agent — the 5th CIS agent that fills Gap 3 from the Seven Gaps analysis.

---

*Spec authored: 2026-04-16*
*Status: Draft — ready for implementation review*
*Depends on: belief firmware map authoring, context engine webhook extension, database schema migration*
