---
tags:
  - type/atomic
  - category/concept
  - domain/belief-operations
  - domain/education
  - domain/product
  - layer/invisible
  - concept/belief-artifact
aliases:
  - Belief Firmware Map
  - Kenyan Belief Firmware Reference
  - Firmware Map
created: 2026-04-16
---

# Belief Firmware Map — Kenyan Student Transition

## Definition

A structured reference mapping Kenyan institutional artifacts (KCSE, KUCCPS, HELB, family expectations, peer comparison) to the beliefs they install, the trigger language that reveals them, and the revision pathway KIRA should follow. Built as the engineering-grade context for the `/audit` agent.

> *A structured reference for building context engine responses. Each entry maps an artifact to the belief it installs, the trigger language that reveals it, and the revision pathway KIRA should follow.*

## How to Use This Document

This is an engineering-grade reference. When the context engine detects a trigger phrase from a student, look up the corresponding artifact entry. The **Product implication** field tells KIRA exactly what to serve.

**Trigger detection → Artifact lookup → Response template.**

---

## Artifact 1: KCSE Results

### What It Is
Kenya Certificate of Secondary Education. A single national exam taken at the end of 4 years of secondary school. Produces a letter grade (A, A-, B+, B, B-, C+, C, C-, D+, D, D-, E) that gates all higher education access.

### Belief Installed
**"My worth is a number. My intelligence is a grade."**

Secondary beliefs:
- Exam performance = innate intelligence (not context, preparation quality, or system fit)
- A single test on a single day measures who I am
- The grade is permanent and identity-defining
- If I scored below my expectations, I am permanently limited

### Installation Mechanism
- **Authority**: Issued by KNEC (Kenya National Examinations Council) — the highest educational authority in the student's life
- **Consequence**: Grade directly determines which university programs are accessible via cluster point calculation
- **Repetition**: 4 years of continuous exam preparation reinforce the framing that everything leads to this one score
- **Social proof**: Every student in the country receives results simultaneously; rankings are published and discussed publicly
- **Family authority**: Family sacrifice for education creates enormous weight on results as return on investment

### Who Benefits
- The 8-4-4 system itself (justifies its sorting function)
- Schools (rankings and funding tied to exam performance)
- Employers who use grades as cheap filtering mechanism
- Private tutoring industry (profit from exam anxiety)
- Universities that receive pre-sorted intake

### Trigger Phrases
- "I got a [grade] in KCSE"
- "I'm not smart enough to..."
- "My KCSE was bad"
- "I only got a C+"
- "With my grades, I can't..."
- "I wasn't good at school"
- "I'm just a [grade] student"

### Expiry Condition
**Useful until:** The student enters a context where multiple forms of intelligence and contribution are visible (university seminars, project work, self-directed learning).
**Becomes toxic when:** The student avoids opportunities, self-selects out of ambitions, or makes life decisions based on a grade that measured exam performance — not capability, creativity, or potential.

### Revision Pathway
**Target belief:** "My KCSE grade measured my exam performance in a specific system at a specific time. It does not measure my capacity to think, learn, or contribute."

**Intervention steps:**
1. **Separate the measurement from the identity** — "Your grade measured how you performed on one exam. It did not measure you."
2. **Reveal the system design** — The 8-4-4 system optimizes for sorting, not for measuring intelligence. The exam tests recall under pressure, not thinking.
3. **Show counter-evidence** — Students who scored lower and thrived. The gap between exam performance and life outcomes.
4. **Redirect agency** — "What did you actually learn in those 4 years that no exam could measure?"

### Product Implication
When a student says "I got a B- in KCSE" or any grade-referencing language:

```
KIRA should:
1. Acknowledge the grade WITHOUT confirming the belief
   → "A B- tells you how you performed on that exam. It doesn't tell you what you're capable of."
2. Activate /frame or /audit to surface the underlying belief
   → "When you say that, what does that grade mean to you about who you are?"
3. Offer profession-agnostic evidence of capability beyond exams
4. Log as belief_firmware.kcse activation event for context engine
5. NEVER: "With a B- you can still do X" (reinforces grade = gatekeeper)
```

**Context engine should serve:** Examples of successful people who didn't follow the grade trajectory. Prompts that separate identity from measurement. The "4 years preparing for KCSE, zero days preparing for what comes after" framing.

---

## Artifact 2: KUCCPS Placement

### What It Is
Kenya Universities and Colleges Central Placement Service. A centralized algorithm that assigns students to university programs based on KCSE grades, cluster points, and program capacity. Students list preferences but the algorithm decides.

### Belief Installed
**"The system decides my fate. My role is to accept what I'm given."**

Secondary beliefs:
- Choice is an illusion — the algorithm knows better than I do
- Being "placed" somewhere means that's where I belong
- My preferences don't matter as much as the system's calculation
- I should be grateful for whatever placement I receive
- Questioning placement is ungrateful or unrealistic

### Installation Mechanism
- **Authority**: Government-mandated central placement — the student has no alternative path
- **Removal of agency**: Student submits preferences but cannot negotiate, appeal meaningfully, or choose otherwise
- **Language of placement**: Students say "I was placed at [university]" not "I chose [university]" — the passive voice encodes the belief
- **Consequence**: Placement determines degree, university, location, peer group, and often career trajectory
- **Finality**: Once placed, changing course is bureaucratically difficult and financially costly

### Who Benefits
- Universities (guaranteed intake, no competitive recruitment needed)
- Government (centralized planning, predictable enrollment numbers)
- System stability (reduces complexity of individual choice)
- Institutions receiving students who wouldn't have chosen them voluntarily

### Trigger Phrases
- "I was placed at [university/in program]"
- "I didn't choose this course"
- "The system put me here"
- "I wanted [X] but I got placed in [Y]"
- "I'm doing this because that's where I was placed"
- "I'm just doing this course because..."

### Expiry Condition
**Useful until:** The student realizes they can direct their own learning within any program, pursue side projects, self-study, or transfer.
**Becomes toxic when:** The student disengages from their own education because "it wasn't my choice," leading to passive learning, wasted years, and resentment without action.

### Revision Pathway
**Target belief:** "My placement was a starting condition, not a sentence. I can shape what this experience means and where it leads."

**Intervention steps:**
1. **Name the passive voice** — "You keep saying 'I was placed.' What would it change if you said 'I'm studying'?"
2. **Separate the starting condition from the trajectory** — Placement determines the starting line, not the finish line.
3. **Identify agency within constraints** — "What can you control about this experience right now?"
4. **Map the actual territory** — Skills from any degree are transferable. The degree is a vehicle, not a destination.

### Product Implication
When a student says "I was placed here" or uses passive placement language:

```
KIRA should:
1. Mirror the language back: "You said 'I was placed.' What does that word mean to you?"
2. Activate /frame to surface the agency belief
3. NEVER reinforce passivity ("That happens to a lot of students")
4. Instead: "Your placement was one decision made about you. What decisions can you make for yourself starting now?"
5. Context engine: serve examples of people who redirected their placement trajectory
6. Log as belief_firmware.kuccps activation event
```

**Context engine should serve:** Decision-framework prompts. "What if your placement isn't your destination?" examples. Prompts that identify what the student actually wants independent of placement.

---

## Artifact 3: HELB Loan

### What It Is
Higher Education Loans Board. Government-backed student loan for university tuition and living expenses. Required by most students who cannot self-fund. Creates debt obligation before the student enters the workforce.

### Belief Installed
**"Access requires debt. I owe before I earn."**

Secondary beliefs:
- Education is something I must borrow to access (not a right or investment made in me)
- Financial constraint is a personal limitation, not a systemic design
- I must prioritize earning to repay over exploring what I want to do
- My choices after graduation are constrained by my debt
- Asking for financial help is normal; asking for guidance is not

### Installation Mechanism
- **Necessity**: No realistic alternative for most students — either take the loan or don't attend university
- **Early consequence**: Debt is incurred at 18-19, before the student has any income or financial literacy
- **Bureaucratic weight**: Application process is complex, reinforcing that access is conditional and fragile
- **Family dynamics**: Loan often supplements family sacrifice, creating dual obligation (to repay + to family)
- **Silence**: Nobody discusses the psychological weight of educational debt — it's normalized as "just how it works"

### Who Benefits
- Universities (tuition guaranteed by loan disbursement)
- Government (deferred cost of education, socialized lending risk)
- Employers (graduates who need jobs urgently, willing to accept lower starting salaries)
- Financial system (creates early financial obligation and credit history)

### Trigger Phrases
- "I can't afford to..."
- "HELB hasn't disbursed yet"
- "I have to think about paying back my loan"
- "I need a job quickly because of HELB"
- "I can't take that risk, I have a loan to repay"
- "Money is the main thing I worry about"

### Expiry Condition
**Useful until:** The student develops financial literacy and separates educational investment from self-worth.
**Becomes toxic when:** The debt belief constrains career exploration, risk-taking, self-investment, or creative ambition. When "I have a loan" becomes the reason to accept any job instead of pursuing a meaningful path.

### Revision Pathway
**Target belief:** "My loan was the cost of access. It doesn't own my choices. I can plan repayment AND pursue what matters."

**Intervention steps:**
1. **Separate the financial obligation from the identity obligation** — Having a loan is a financial fact, not a life sentence.
2. **Reframe the timeline** — Loan repayment is a long-term plan, not an emergency.
3. **Identify the hidden trade** — "What are you giving up because of the loan belief that you wouldn't give up otherwise?"
4. **Restore decision space** — "If money weren't the constraint, what would you explore? Now: which parts of that can you start anyway?"

### Product Implication
When a student mentions HELB or financial constraint as reason for limiting choices:

```
KIRA should:
1. Acknowledge the reality: "That's a real financial pressure."
2. Then immediately separate: "And it's worth asking — is the loan shaping your decisions, or just your budget?"
3. Activate /frame or /audit on the financial constraint belief
4. NEVER: dismiss the financial reality or be dismissive of genuine hardship
5. Context engine: serve decision frameworks that work within constraints
6. Log as belief_firmware.helb activation event
```

**Context engine should serve:** Prompts about constrained optimization. "What can you do regardless of budget?" exercises. Examples of people who made strategic choices under financial pressure.

---

## Artifact 4: Cluster Points

### What It Is
A weighted calculation derived from KCSE grades in specific subjects relevant to a university program. Each program has minimum cluster point requirements. The system converts raw grades into a single number that determines program eligibility.

### Belief Installed
**"Competition is zero-sum. Someone else's gain is my loss."**

Secondary beliefs:
- Resources (university spots, opportunities) are finite and scarce
- My success requires outperforming others
- If I don't get the "best" program, I've lost
- Ranking defines value — a C+ program is inferior to an A program
- There are only a few "good" paths (medicine, law, engineering, computer science)

### Installation Mechanism
- **Zero-sum design**: By definition, cluster points create a ranking — not everyone can access every program
- **Numerical reduction**: A complex human being reduced to a single calculated number
- **Gatekeeping**: Programs have hard cutoffs — miss by 0.1 points and you're excluded
- **Social comparison**: Students know each other's points and compare publicly
- **Cultural reinforcement**: Family and community celebrate "top" programs, reinforcing the hierarchy

### Who Benefits
- Elite programs (maintain prestige through exclusivity)
- System that needs simple sorting mechanisms
- Employers who use university reputation as proxy for candidate quality
- Social hierarchy that rewards proximity to "top" institutions

### Trigger Phrases
- "My cluster points weren't enough for..."
- "I couldn't get into [prestigious program]"
- "Only [X] points students get to do..."
- "The good courses need too many points"
- "I missed the cutoff"
- "I'm in a [lower-ranked] program"

### Expiry Condition
**Useful until:** The student encounters evidence that career success is weakly correlated with program prestige or cluster points.
**Becomes toxic when:** The student self-rejects from ambitions because "my points weren't good enough," or treats their program as second-class.

### Revision Pathway
**Target belief:** "Cluster points determined my starting position. They don't determine my trajectory or my value."

**Intervention steps:**
1. **Deconstruct the score** — "Cluster points measure exam performance against program capacity. That's logistics, not destiny."
2. **Show the weak correlation** — Career outcomes in Kenya weakly correlate with university prestige; skills, networks, and initiative matter more.
3. **Reframe from competition to direction** — "What do you actually want to build, learn, or become?"
4. **Remove the hierarchy lens** — "A 'top' program that doesn't fit you is worse than a 'mid' program where you thrive."

### Product Implication
When a student references cluster points as a limitation:

```
KIRA should:
1. Acknowledge: "Cluster points are how the system sorted you. They're not how you should sort yourself."
2. Redirect: "What did you want before the points told you what you could have?"
3. NEVER: "With your points you can still do X" (reinforces the hierarchy)
4. Context engine: serve self-direction exercises, not program-matching tools
5. Log as belief_firmware.cluster_points activation event
```

---

## Artifact 5: Admission Letter

### What It Is
Official document from a university confirming a student's acceptance into a specific program. The moment of "arrival" after years of exam preparation and placement anxiety.

### Belief Installed
**"I've made it. The hard part is over."** (The Arrival Fallacy)

Secondary beliefs:
- University admission = guaranteed success
- The system has done its job; now I just need to show up
- A degree automatically leads to employment
- Being in university means I'm on track
- The identity work is done — "I am a university student" is enough

### Installation Mechanism
- **Celebration**: Admission is celebrated by family, community, school — reinforcing that this is the destination
- **Relief**: After years of pressure, the admission letter feels like the finish line
- **Social status**: Being "in university" confers immediate social status
- **System narrative**: "Work hard, get good grades, go to university, get a good job" — admission is step 3, and the narrative implies the rest follows
- **Absence of next-step guidance**: Nobody tells the student what to do WITH the admission besides show up

### Who Benefits
- Universities (enrollment = revenue, no incentive to disrupt the arrival belief)
- Government (enrollment numbers = education policy success metric)
- Employers (degree = minimum qualification, no need to assess thinking)
- Social system that rewards credential display over demonstrated capability

### Trigger Phrases
- "I got admitted to [university]"
- "Now I just need to finish my degree"
- "Once I graduate, I'll get a job"
- "I'm in university now, so I'm set"
- "The degree will handle the rest"

### Expiry Condition
**Useful until:** Reality hits — the graduate enters the job market and discovers a degree is necessary but not sufficient.
**Becomes toxic when:** The student coasts through university, avoids skill-building, network-building, or self-direction because the admission letter "proved" they're on track. The arrival fallacy prevents the exploration that university should enable.

### Revision Pathway
**Target belief:** "Admission is the starting line, not the finish line. What I do here matters more than where I got in."

**Intervention steps:**
1. **Name the arrival fallacy** — "Getting in feels like arriving. But it's actually the beginning."
2. **Reframe the 4 years** — "This is a 4-year window to build, explore, fail safely, and discover."
3. **Distinguish credential from capability** — "The degree opens doors. What walks through them is who you become."
4. **Activate agency** — "What do you want to be able to do by the time you leave here?"

### Product Implication
When a student expresses arrival-fallacy language:

```
KIRA should:
1. Celebrate genuinely: "That's real. You earned that."
2. Then immediately: "And now the interesting part starts."
3. Activate /diverge — what could these 4 years become?
4. Context engine: serve "what would you build?" prompts, not "congratulations" content
5. Log as belief_firmware.admission activation event
```

---

## Artifact 6: 8-4-4 System (The Operating Environment)

### What It Is
Kenya's education structure: 8 years primary, 4 years secondary, 4 years university. Emphasizes exam-based assessment, standardized curriculum, and teacher-centered instruction. Being replaced by CBC (Competency-Based Curriculum) but most current university students are 8-4-4 products.

### Belief Installed
**"Thinking = memorizing. Learning = reproducing what the teacher said. Questions are dangerous."**

Secondary beliefs:
- The right answer exists and authority figures have it
- Creativity and exploration are luxuries, not essentials
- Speed and recall matter more than depth and understanding
- Deviating from the expected answer is risky
- "Cramming" is a legitimate and necessary survival strategy
- There is one correct path; straying is failure

### Installation Mechanism
- **12+ years of conditioning**: Every assessment rewards recall over thinking
- **Teacher authority**: Teachers as sole knowledge holders; students as receivers
- **Exam design**: Questions test reproduction, not application or synthesis
- **Punishment for deviation**: Wrong answers lose marks; creative answers are risky
- **Peer reinforcement**: "We all crammed" normalizes the strategy
- **System survival**: Cramming works well enough to pass — the cost shows up years later

### Who Benefits
- System administrators (standardized testing is simple to run at scale)
- Teachers who learned the same way (no need to change pedagogy)
- Institutions that value compliance over innovation
- Employers who can then "reskill" graduates (creating a secondary market)

### Trigger Phrases
- "Just tell me the right answer"
- "What am I supposed to write?"
- "I'm not a creative person"
- "I was never good at thinking"
- "I don't know how to use my own brain for this"
- "Can you just give me the answer?"
- "I'm not good at thinking for myself"

### Expiry Condition
**Useful until:** The student encounters a context where recall is insufficient (university research, real-world problem-solving, creative work).
**Becomes toxic when:** The student faces open-ended problems and freezes, or interprets the discomfort of genuine thinking as evidence they "can't think."

### Revision Pathway
**Target belief:** "I can think independently. What I've been doing is reproducing. What I'm learning to do is create."

**Intervention steps:**
1. **Name the training** — "You spent 12 years learning to reproduce answers quickly. That's a skill. And it's not the same as thinking."
2. **Separate the discomfort from the capability** — "Thinking feels hard because you haven't practiced it, not because you can't do it."
3. **Start small** — Provide structured thinking frameworks (PAUSE, CONTEXT) that give scaffolding while building the muscle.
4. **Reward the process, not the output** — Celebrate questions, explorations, and failed attempts.

### Product Implication
When a student shows cramming-mentality or answer-seeking behavior:

```
KIRA should:
1. NEVER just give the answer. Ever.
2. Reframe: "That's a great question. Let me ask you something first..."
3. Use /frame to slow down and create space for their own thinking
4. Provide scaffolding: "Instead of the answer, here's a way to find it yourself..."
5. Context engine: serve thinking-framework prompts, not informational content
6. Log as belief_firmware.844 activation event
```

---

## Artifact 7: The Gap Period (Post-KCSE, Pre-University)

### What It Is
The 6-10 month period between completing KCSE exams and beginning university. Students receive results, apply through KUCCPS, wait for placement, and wait again for admission. During this time, there is no institutional support, no structured guidance, and no formal transition preparation.

### Belief Installed
**"Waiting is normal. Someone will tell me what to do next."**

Secondary beliefs:
- The system will provide direction when it's time
- This period is a pause, not an opportunity
- I don't have agency during the transition — I'm in limbo
- Anxiety during this period is personal weakness, not a reasonable response to structural absence
- "Everyone goes through it" means my suffering is normal and acceptable

### Installation Mechanism
- **Structural absence**: No institution owns this period — KNEC finished, KUCCPS hasn't started, university is months away
- **Information vacuum**: Students don't know what's coming, what to prepare, or what questions to ask
- **Peer normalization**: "We're all just waiting" makes it feel normal
- **Family silence**: Families often don't know how to help either, reinforcing the waiting pattern
- **Digital noise**: Social media fills the vacuum with comparison, anxiety, and misinformation

### Who Benefits
- No one intentionally — this is a structural gap, not a designed feature
- Beneficiaries of the status quo: students with better networks or resources navigate the gap better, reinforcing existing inequality
- Private consultants and coaching services that sell transition guidance

### Trigger Phrases
- "I'm just waiting for my admission"
- "There's nothing to do until university starts"
- "I'm bored/lost/anxious just sitting at home"
- "I don't know what to do with myself right now"
- "When university starts, everything will make sense"

### Expiry Condition
**Useful until:** University starts — then the belief that "someone will tell me what to do" crashes into self-directed learning expectations.
**Becomes toxic when:** The student wastes the gap period (6-10 months of potential exploration, skill-building, or self-discovery) and enters university without any preparation for what comes next.

### Revision Pathway
**Target belief:** "This gap is mine. It's not limbo — it's the most unconstrained time I'll have for years."

**Intervention steps:**
1. **Reframe the gap** — "You have 6-10 months with no exams, no homework, and no teacher. When will that happen again?"
2. **Provide structure** — Give the student a framework for using the gap (explore interests, build skills, research careers, develop self-awareness).
3. **Restore agency** — "Nobody's going to tell you what to do. That's not a bug — that's the beginning of adulthood."
4. **Connect to identity** — "Who are you when nobody's testing you?"

### Product Implication
When a student expresses gap-period passivity or anxiety:

```
KIRA should:
1. Validate: "That waiting feeling is real. The system doesn't prepare you for this part."
2. Reframe immediately: "And — you have something most people never get: months with no assigned work. What would you do with that if it were intentional?"
3. Activate /diverge: "Let's explore what this time could become."
4. Context engine: serve gap-period activity frameworks, self-exploration prompts, career research tools
5. Log as belief_firmware.gap_period activation event
```

---

## Cross-Artifact Patterns

### The Pipeline Effect
These artifacts don't operate independently. They form a pipeline where each belief compounds the next:

```
8-4-4 (thinking = recall)
    → KCSE (worth = grade)
        → Cluster Points (competition = zero-sum)
            → KUCCPS (system decides)
                → Gap Period (waiting is normal)
                    → Admission (I've arrived)
                        → HELB (access = debt)
```

### The Core Installed Operating System
Taken together, the artifacts install a coherent belief operating system:

1. **Measurement = Identity** (KCSE, Cluster Points)
2. **Agency = Illusion** (KUCCPS, Gap Period)
3. **Access = Permission** (Admission, HELB)
4. **Thinking = Reproduction** (8-4-4)

The student who carries all four beliefs sees themselves as a passive object moving through a system that measures, sorts, places, and funds them. Their role is to perform well enough at each gate and accept the result.

### The Countervailing Beliefs (What KIRA Installs)
KIRA's entire product design is a counter-installation:

1. **Your thinking is your own** (PAUSE, CONTEXT habits)
2. **You can direct your path** (ITERATE, THINK FIRST habits)
3. **Proof comes from doing, not from being measured** (Thinking Artifact)
4. **Beliefs can be inspected and revised** (/audit, /frame agents)

---

## Implementation Notes for Context Engine

### Trigger Detection Priority
| Priority | Trigger Pattern | Artifact | Response Speed |
|----------|----------------|----------|---------------|
| 1 (Crisis) | "worthless", "hopeless", "stupid" | KCSE + 8-4-4 | Immediate safety check |
| 2 (Active) | "was placed", "my points", specific grade mentions | KUCCPS, Cluster Points, KCSE | Next interaction |
| 3 (Passive) | "just waiting", "nothing to do" | Gap Period | Daily prompt |
| 4 (Arrival) | "made it", "now I just need to graduate" | Admission | Weekly prompt |
| 5 (Constraint) | "can't afford", "loan", "HELB" | HELB | Context-appropriate |

### Context Engine Schema Addition
```yaml
belief_firmware:
  detected_artifacts:
    - artifact: kcse
      trigger_patterns: ["KCSE", "grade", "score", "smart enough", "my results"]
      confidence: 0.8
      revision_agent: /frame
    - artifact: kuccps
      trigger_patterns: ["placed", "placement", "system put me", "didn't choose"]
      confidence: 0.8
      revision_agent: /frame
    - artifact: helb
      trigger_patterns: ["HELB", "loan", "can't afford", "debt", "repay"]
      confidence: 0.7
      revision_agent: /frame
    - artifact: cluster_points
      trigger_patterns: ["cluster points", "cutoff", "points weren't enough"]
      confidence: 0.9
      revision_agent: /frame
    - artifact: admission
      trigger_patterns: ["admitted", "got in", "made it", "now I just need"]
      confidence: 0.7
      revision_agent: /diverge
    - artifact: 844
      trigger_patterns: ["right answer", "supposed to write", "not creative", "just tell me"]
      confidence: 0.6
      revision_agent: /frame
    - artifact: gap_period
      trigger_patterns: ["waiting", "nothing to do until", "bored", "limbo"]
      confidence: 0.7
      revision_agent: /diverge
```

### Response Principles
1. **Never confirm the installed belief** — don't agree that a grade defines someone
2. **Always acknowledge the reality** — the artifact is real, the belief about it is what needs revision
3. **Redirect agency immediately** — from "happened to me" to "what I do now"
4. **Use the student's language as the entry point** — their trigger phrase IS the diagnostic
5. **Log every activation** — the context engine should track which firmware is most active per student and adjust accordingly

---

## Related

- [[firmware-written-in-paper]] — the original concept of artifacts as belief encoders
- [[kenyan-student-belief-artifacts]] — the belief pipeline overview
- [[agm-belief-revision]] — the formal logic of belief update (expansion, revision, contraction)
- [[the-seven-gaps]] — Gap 5 specifically calls for this map
- [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]] — the product kernel and audience matrix
- [[the-clarity-company]] — the vision this map serves
- [[predictive-processing]] — how generative models built by 8-4-4 break at university transition

Source: [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]]

## Source

- Compiled from: [[kenyan-student-belief-artifacts]], [[firmware-written-in-paper]], [[the-seven-gaps]], [[agm-belief-revision]], product docs, and transcript analysis
- Session: `agent:main:subagent:de235e48` (belief-firmware-map task)
- Date: 2026-04-16
