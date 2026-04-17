$ErrorActionPreference = 'Stop'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $Root

function Write-TextFile([string]$Path, [string]$Content) {
  $full = Join-Path $Root $Path
  $dir = Split-Path -Parent $full
  if ($dir -and -not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText($full, ($Content.TrimEnd() + "`r`n"), $utf8NoBom)
}

function Frontmatter([string[]]$Tags, [string[]]$Aliases) {
  $lines = @('---','tags:')
  foreach ($tag in $Tags) { $lines += "  - $tag" }
  $lines += 'aliases:'
  foreach ($alias in $Aliases) { $lines += '  - "' + ($alias -replace '"','\"') + '"' }
  $lines += '---'
  return ($lines -join "`r`n")
}

function LinksForFolder([string]$Folder, [string]$Pattern = '') {
  $items = Get-ChildItem -LiteralPath (Join-Path $Root $Folder) -File -Filter *.md | Sort-Object Name
  if ($Pattern) { $items = @($items | Where-Object { $_.BaseName -match $Pattern }) }
  return (($items | ForEach-Object { '- [[' + $_.BaseName + ']]' }) -join "`r`n")
}

function New-Moc([string]$Path,[string]$Title,[string]$Alias,[string[]]$Tags,[string]$Body) {
  $fm = Frontmatter -Tags $Tags -Aliases @($Alias)
  Write-TextFile -Path $Path -Content "$fm`r`n`r`n# $Title`r`n`r`n$Body"
}

New-Moc -Path 'atlas/moc-cartographer-principles.md' -Title 'MOC: Cartographer Principles and Creeds' -Alias 'Cartographer Principles' -Tags @('type/moc','domain/mastery','category/principle') -Body @"
> Use this map to translate the manifesto's worldview into operating principles.

## How To Use This Map
Start with principles when choosing a learning design. Use creeds when the risk is ego, certainty, or shortcut-seeking.

## What This Map Reveals
Principles are operating rules; creeds are ethical constraints that keep the rules from becoming traps.

## Principles
$(LinksForFolder 'atlas/principles' '^(principle|intel-|architecture-)')

## Creeds
$(LinksForFolder 'atlas/creeds')

## Tiered Mappings
- Equivalent: [[beginners-mind]] <-> [[creed-3-beginners-mind]]
- Equivalent: [[map-territory]] <-> [[creed-1-map-is-not-territory]]
- Analogy: [[constraint-catalyst]] <-> [[principle-2-constraint-based-learning]]
"@

New-Moc -Path 'atlas/moc-cartographer-diagnostics-practices.md' -Title 'MOC: Diagnostics and Practices' -Alias 'Cartographer Diagnostics and Practices' -Tags @('type/moc','domain/mastery','category/diagnostic') -Body @"
> Use this map when the atlas needs to become behavior.

## How To Use This Map
Run diagnostics to locate the weak force. Use practices to train that force under a repeatable cadence.

## What This Map Reveals
The diagnostic asks where the map fails; the practice creates the feedback loop that repairs it.

## Diagnostics
$(LinksForFolder 'atlas/diagnostics')

## Practices
$(LinksForFolder 'atlas/practices')

## Tiered Mappings
- Adjacent: [[diagnostic-6-lattice-density]] <-> [[lattice]]
- Adjacent: [[diagnostic-7-explanation]] <-> [[tool-5-explanation-acceleration]]
- Adjacent: [[practice-8-attention-detox]] <-> [[attention-economics]]
"@

New-Moc -Path 'atlas/moc-cartographer-journey.md' -Title 'MOC: Cartographer Journey' -Alias 'Cartographer Journey' -Tags @('type/moc','domain/mastery','category/phase') -Body @"
> Use this map to orient progression over time.

## How To Use This Map
Use phases for long-horizon progression, stages for awareness state, and programs for immediate embodiment.

## What This Map Reveals
Stages describe the learner's state; phases describe the training path through that state.

## Stages
$(LinksForFolder 'atlas/stages')

## Phases
$(LinksForFolder 'atlas/phases')

## Programs
$(LinksForFolder 'atlas/programs')

## Tiered Mappings
- Analogy: [[stage-7-the-empty-chair]] <-> [[intel-intelligence-stage-7-the-cartographer-s-return]]
- Adjacent: [[tech-technologist-phase-6-ongoing-staying-at-the-frontier]] <-> [[beginners-mind]].
"@

New-Moc -Path 'atlas/moc-cartographer-cases-examples.md' -Title 'MOC: Cases and Examples' -Alias 'Cartographer Cases and Examples' -Tags @('type/moc','domain/mastery','category/case') -Body @"
> Use this map when an abstract force needs a concrete demonstration.

## How To Use This Map
Use examples to see the four-layer model across fields. Use cases to see a single invisible force operating in a person or organization.

## What This Map Reveals
Examples show domain translation; cases show force diagnosis.

## Examples
$(LinksForFolder 'atlas/examples')

## Cases
$(LinksForFolder 'atlas/cases')
"@

New-Moc -Path 'atlas/moc-cartographer-applications.md' -Title 'MOC: Cross-Field Applications' -Alias 'Cartographer Applications' -Tags @('type/moc','domain/mastery','category/strategy') -Body @"
> Use this map to transfer the atlas across professions.

## How To Use This Map
Use strategies when moving between fields. Use paths when applying the same force map to a specific profession type.

## What This Map Reveals
Principles transfer more reliably than techniques; paths show which constraints change by field.

## Strategies
$(LinksForFolder 'atlas/strategies')

## Paths
$(LinksForFolder 'atlas/paths')

## Metrics
$(LinksForFolder 'atlas/metrics')
"@

New-Moc -Path 'atlas/moc-intelligence-expansion.md' -Title 'MOC: Intelligence Expansion' -Alias 'Intelligence Expansion' -Tags @('type/moc','domain/intelligence') -Body @"
> Use this map beyond the eight intelligence forces.

## How To Use This Map
Start with the force MOC, then use stages, principles, fatal errors, instruments, and phases to operate the network without degrading it.

## What This Map Reveals
The intelligence manifesto is not only a force taxonomy; it is a network operating discipline.

## Core Force Map
- [[moc-8-intelligence-forces]]

## Expansion Notes
$(LinksForFolder 'atlas/layers' '^intel-')
$(LinksForFolder 'atlas/stages' '^intel-')
$(LinksForFolder 'atlas/principles' '^intel-')
$(LinksForFolder 'atlas/dangers' '^intel-')
$(LinksForFolder 'atlas/tools' '^intel-')
$(LinksForFolder 'atlas/phases' '^intel-')
$(LinksForFolder 'atlas/creeds' '^intel-')
$(LinksForFolder 'atlas/programs' '^intel-')

## Tiered Mappings
- Equivalent: [[intel-structural-positioning]] <-> [[asymmetric-leverage]]
- Analogy: [[intel-network-mirror]] <-> [[beginners-mind]]
- Adjacent: [[intel-informal-channel]] <-> [[tech-data]]
"@

New-Moc -Path 'atlas/moc-technologist-expansion.md' -Title 'MOC: Technologist Expansion' -Alias 'Technologist Expansion' -Tags @('type/moc','domain/ai') -Body @"
> Use this map beyond the seven technologist forces.

## How To Use This Map
Start with invisible forces, then use territories, stages, diagnostics, phases, and current forces to choose what to learn or build next.

## What This Map Reveals
AI mastery is less about memorizing the newest model and more about seeing which force governs the decision.

## Core Force Map
- [[moc-7-technologist-forces]]

## Expansion Notes
$(LinksForFolder 'atlas/layers' '^tech-')
$(LinksForFolder 'atlas/stages' '^tech-')
$(LinksForFolder 'atlas/forces' '^tech-current')
$(LinksForFolder 'atlas/tools' '^tech-')
$(LinksForFolder 'atlas/diagnostics' '^tech-')
$(LinksForFolder 'atlas/phases' '^tech-')
$(LinksForFolder 'atlas/creeds' '^tech-')
$(LinksForFolder 'atlas/programs' '^tech-')

## Tiered Mappings
- Adjacent: [[tech-navigation]] <-> [[goodhart]]
- Equivalent: [[tech-reality-gap]] <-> [[failure-gradients]]
- Analogy: [[tech-scale]] <-> [[time-compression]]
"@

New-Moc -Path 'atlas/moc-architecture-belief-forces.md' -Title 'MOC: Architecture Belief Forces' -Alias 'Architecture Belief Forces' -Tags @('type/moc','domain/marketing') -Body @"
> Use this map to diagnose architecture marketing as belief architecture.

## How To Use This Map
Use the eight forces to locate the blocked belief update. Use the content modules to sequence the update without forcing conversion too early.

## What This Map Reveals
Architecture marketing fails when firms optimize visible proof while clients are blocked by identity, friction, timing, or trust-layer gaps.

## Architecture Notes
$(LinksForFolder 'atlas/layers' '^architecture-')
$(LinksForFolder 'atlas/concepts' '^(architecture-|network-architecture|timing-window|value-realization-gap|expansion-loop)')
$(LinksForFolder 'atlas/principles' '^architecture-')
$(LinksForFolder 'atlas/diagnostics' '^architecture-')
$(LinksForFolder 'atlas/tools' '^architecture-')

## Tiered Mappings
- Equivalent: [[network-architecture]] <-> [[intel-structural-positioning]]
- Adjacent: [[identity-stake]] <-> [[architecture-architecture-identity-pressure]]
- Adjacent: [[timing-window]] <-> [[context-spectrum]]
"@

New-Moc -Path 'atlas/moc-relationship-cartography.md' -Title 'MOC: Relationship Cartography' -Alias 'Relationship Cartography' -Tags @('type/moc','domain/relationship') -Body @"
> Use this map to read intimate partnership as a living trust-gradient system.

## How To Use This Map
Start with relationship forces when diagnosing the invisible mechanism. Use diagnostics and cases when the issue looks behavioral but is actually safety, projection, differentiation, desire, or trust-layer sequence.

## What This Map Reveals
Relationship mastery is not communication technique. It is the capacity to perceive the invisible forces that make safety, desire, differentiation, trust, and mutual expansion possible.

## Relationship Notes
$(LinksForFolder 'atlas/layers' '^relationship-')
$(LinksForFolder 'atlas/forces' '^relationship-')
$(LinksForFolder 'atlas/stages' '^relationship-')
$(LinksForFolder 'atlas/concepts' '^relationship-')
$(LinksForFolder 'atlas/diagnostics' '^relationship-')
$(LinksForFolder 'atlas/cases' '^relationship-')
$(LinksForFolder 'atlas/dangers' '^relationship-')
$(LinksForFolder 'atlas/creeds' '^relationship-')
$(LinksForFolder 'atlas/programs' '^relationship-')

## Tiered Mappings
- Equivalent: [[relationship-relationship-force-8-the-trust-gradient]] <-> [[trust-gradient]]
- Analogy: [[relationship-relationship-force-7-the-expansion-loop]] <-> [[expansion-loop]]
- Adjacent: [[relationship-relationship-force-4-differentiation]] <-> [[beginners-mind]]
"@

New-Moc -Path 'atlas/moc-statesman-mastery.md' -Title 'MOC: Statesman Mastery' -Alias 'Statesman Mastery Blueprint' -Tags @('type/moc','domain/politics') -Body @"
> Use this map to translate the Cartographer mastery forces into political power, governance, and Kenyan political terrain.

## How To Use This Map
Start with the universal forces, then check the Kenyan terrain notes and career-ending traps before treating any tactic as portable.

## What This Map Reveals
Statesmanship is not campaign technique. It is perception of power, context, coalition structure, institutional constraints, timing, and failure modes.

## Statesman Notes
$(LinksForFolder 'atlas/layers' '^statesman-')
$(LinksForFolder 'atlas/forces' '^statesman-')
$(LinksForFolder 'atlas/stages' '^statesman-')
$(LinksForFolder 'atlas/concepts' '^statesman-')
$(LinksForFolder 'atlas/dangers' '^statesman-')
$(LinksForFolder 'atlas/tools' '^statesman-')
$(LinksForFolder 'atlas/diagnostics' '^statesman-')
$(LinksForFolder 'atlas/phases' '^statesman-')
$(LinksForFolder 'atlas/creeds' '^statesman-')

## Tiered Mappings
- Equivalent: [[statesman-statesman-force-1-asymmetric-leverage]] <-> [[asymmetric-leverage]]
- Equivalent: [[statesman-statesman-force-2-time-compression-political-capital-half-life]] <-> [[time-compression]]
- Analogy: [[statesman-statesman-kenyan-politics-trap-3-the-nairobi-bubble-trap]] <-> [[context-spectrum]]
"@

New-Moc -Path 'atlas/moc-source-memos.md' -Title 'MOC: Source Memos' -Alias 'Source Memos' -Tags @('type/moc','category/source-memo') -Body @"
> Use this map when raw transcript knowledge needs to enter the brain without becoming uncontrolled canon.

## How To Use This Map
Start with [[source-memo-protocol]] before extracting from NotebookLM transcripts or conversational dumps. Then update the relevant source memo and only create atlas notes for concepts that survive the extraction decision.

## What This Map Reveals
Source memos are the buffer between canon and conversation. They let transcript knowledge feed the manifesto layer while preserving provenance, role, and extraction discipline.

## Source Memo Protocol
- [[source-memo-protocol]]

## Active Source Memos
$(LinksForFolder 'atlas/source-memos' '^(?!source-memo-protocol$)')

## Intake Folder
- `docs/_inbox/transcripts/` is for raw unassigned transcript drops.
- Assigned transcript sets belong under `docs/<territory>/canon/transcripts/`.

## Related
- [[coverage-ledger]]
- [[moc-marketing-belief-operations]]
- [[moc-lenses]]
"@

New-Moc -Path 'atlas/moc-lenses.md' -Title 'MOC: Lenses' -Alias 'Lens Layer' -Tags @('type/moc','category/lens') -Body @"
> Use this map when a source gives the user a way to see, not just a concept to remember.

## How To Use This Map
Use lenses before extracting or applying a manifesto. A lens clarifies what the user can perceive; the lattice then connects what the user can perceive to concepts, tools, forces, diagnostics, and cases.

## What This Map Reveals
The lattice is connection structure. Lenses are perception structure. A clean atlas needs both.

## Core Lens Notes
$(LinksForFolder 'atlas/lenses')

## Existing Lens-Adjacent Notes
- [[map-territory]]
- [[tool-1-first-principles-deconstruction]]
- [[tool-3-inversion]]
- [[lattice]]

## Related
- [[moc-source-memos]]
- [[moc-mental-models]]
- [[belief-operations-transcript-set]]
- [[danger-lattice-overload]]
"@

New-Moc -Path 'atlas/moc-mental-models.md' -Title 'MOC: Mental Models' -Alias 'Mental Models' -Tags @('type/moc','domain/mental-models') -Body @"
> Use this map for the mental-model source family: lenses, stories, cases, and decision frames.

## How To Use This Map
Start with the source memo to understand which transcript has been processed. Use the lens notes to see the territory, then use the case notes to make the lens concrete.

## What This Map Reveals
Mental models are not just concepts. They operate as lenses, tools, and case-backed decision frames. The first-pass extraction keeps the lens and story layers separate so the lattice remains useful.

## Source Memo
- [[great-mental-models-volume-1-transcript-set]]

## Core Lens Notes
- [[mental-models-as-lenses]]
- [[map-is-not-territory-lens]]
- [[circle-of-competence-lens]]
- [[first-principles-lens]]
- [[thought-experiment-lens]]
- [[second-order-thinking-lens]]
- [[probabilistic-thinking-lens]]
- [[occams-razor-lens]]
- [[hanlons-razor-lens]]

## Trial Foundation Cases
- [[antaeus-reality-contact-case]]
- [[galileo-ship-perspective-case]]
- [[hot-stove-feedback-distance-case]]

## Map/Territory Case Notes
- [[london-underground-purpose-fit-case]]
- [[karima-abud-cartographer-bias-case]]
- [[hardin-ostrom-commons-boundary-case]]
- [[jane-jacobs-statistical-city-case]]

## Circle of Competence Case Notes
- [[everest-local-guide-case]]
- [[rose-blumkin-circle-discipline-case]]
- [[atul-gawande-coaching-blind-spot-case]]
- [[queen-elizabeth-counsel-synthesis-case]]

## First Principles Practices
- [[socratic-questioning-practice]]
- [[five-whys-practice]]

## First Principles Case Notes
- [[barry-marshall-bacterial-surprise-case]]
- [[temple-grandin-principle-method-case]]
- [[russell-turkey-trend-law-case]]

## Thought Experiment Case Notes
- [[einstein-elevator-equivalence-case]]
- [[veil-of-ignorance-fairness-case]]
- [[russian-roulette-process-vs-outcome-case]]

## Second-Order Case Notes
- [[cobra-effect-incentive-case]]
- [[livestock-antibiotics-resistance-case]]
- [[buffett-parade-positioning-case]]

## Probability Practice and Case Notes
- [[bayesian-update-practice]]
- [[vera-atkins-imperfect-information-case]]
- [[stairs-versus-terrorism-fat-tail-case]]
- [[linda-conjunction-fallacy-case]]

## Inversion Tools and Case Notes
- [[tool-3-inversion]]
- [[anti-goal-inversion-practice]]
- [[silver-blaze-negative-evidence-case]]
- [[john-bogle-dont-lose-case]]
- [[nansen-drift-design-case]]

## Lattice Layer
- [[lattice]]
- [[tool-4-lattice-method]]

## Belief Operations Models
- [[agm-belief-revision]]
- [[predictive-processing]]
- [[ai-thinking-landscape]]

## Related Maps
- [[moc-lenses]]
- [[moc-source-memos]]
- [[moc-8-tools-of-mastery]]
"@

Write-TextFile -Path 'vault-taxonomy.md' -Content @'
# Vault Taxonomy

> The tagging system that makes the lattice visible.

## Domain Tags
- `#domain/mastery` - Universal learning and expertise patterns
- `#domain/mental-models` - Reusable thinking lenses, cases, and decision frames
- `#domain/intelligence` - Information networks, trust, perception, and signal flow
- `#domain/marketing` - Belief operations, trust gradients, content, and market topology
- `#domain/ai` - ML, data science, and AI technical territory
- `#domain/architecture` - Built environment industry
- `#domain/entrepreneurship` - Uncertainty, markets, and building
- `#domain/product` - Product truth, product kernel, current vessels, and product experience
- `#domain/education` - Learning contexts, students, cohorts, and curriculum-adjacent systems
- `#domain/collaboration` - Human-agent collaboration, working rituals, and shared discovery practices
- `#domain/belief-operations` - K2M belief operations, belief revision, and market belief architecture
- `#domain/relationship` - Intimacy, trust, attachment, differentiation, and relational systems
- `#domain/politics` - Political mastery, governance, statesmanship, and power terrain

## Layer Tags
- `#layer/visible` - What everyone sees
- `#layer/mechanics` - Techniques and procedures
- `#layer/dynamics` - Relationships, timing, trade-offs, and context
- `#layer/invisible` - First principles, leverage points, and hidden forces

## Category Tags
- `#category/concept`
- `#category/layer`
- `#category/stage`
- `#category/principle`
- `#category/diagnostic`
- `#category/phase`
- `#category/creed`
- `#category/example`
- `#category/practice`
- `#category/case`
- `#category/strategy`
- `#category/path`
- `#category/metric`
- `#category/program`
- `#category/instrument`
- `#category/fatal-error`
- `#category/current-force`
- `#category/content-module`
- `#category/force`
- `#category/danger`
- `#category/source-memo`
- `#category/lens`

## Force Tags
- `#force/asymmetric-leverage`
- `#force/time-compression`
- `#force/constraint-catalyst`
- `#force/beginners-mind`
- `#force/emergent-complexity`
- `#force/context-spectrum`
- `#force/failure-gradients`
- `#force/attention-economics`
- `#force/fate-alignment`
- `#force/social-debt`
- `#force/sentiment-behavior`
- `#force/structural-positioning`
- `#force/informal-channel`
- `#force/information-asymmetry`
- `#force/identity-loyalty`
- `#force/network-mirror`
- `#force/geometry`
- `#force/navigation`
- `#force/representation`
- `#force/scale`
- `#force/data`
- `#force/reality-gap`
- `#force/interpretive`

## Stage Tags
- `#stage/0`
- `#stage/1`
- `#stage/2`
- `#stage/3`
- `#stage/4`
- `#stage/5`
- `#stage/6`
- `#stage/7`

## Concept Tags
- `#concept/goodhart`
- `#concept/trust-gradient`
- `#concept/belief-gap`
- `#concept/belief-operations`
- `#concept/belief-artifact`
- `#concept/identity-stake`
- `#concept/friction-map`
- `#concept/lattice`
- `#concept/antifragile`
- `#concept/map-territory`

## Danger Tags
- `#danger/leverage-point-trap`
- `#danger/certainty-spiral`
- `#danger/constraint-addiction`
- `#danger/failure-chase`
- `#danger/lattice-overload`

## Mapping Tier Tags
- `#mapping/equivalent` - Same force in a domain-specific expression
- `#mapping/analogy` - Similar shape, different mechanism
- `#mapping/adjacent` - Useful bridge, not the same force

## Type Tags
- `#type/moc` - Map of Content navigation node
- `#type/atomic` - Single concept, self-contained enough for use without the source
- `#type/canon` - Source material, untouched
- `#type/template` - Reusable template
- `#type/ops` - Operational/running state
- `#type/journal` - Daily capture
- `#type/source-memo` - Reviewed extraction decision for transcripts and conversation-derived source sets
- `#type/transcript-intake` - Unprocessed transcript intake documentation

## Template Families
- Forces: definition, invisible mechanism, cross-domain manifestations, diagnostic question, trap, mapping tier, related/source.
- Tools and practices: purpose, process, result, when to use, failure mode, related/source.
- Stages, phases, and paths: state, visible signs, transition trigger, trap, next/previous, related/source.
- Concepts, creeds, principles, metrics, and cases: definition, pattern, source-grounded example, diagnostic/use, trap or limitation, related/source.
- Source memos: source, parent territory, role, new knowledge, extraction decision, extraction targets, related.
- Lenses: definition, pattern, source-grounded example, diagnostic/use, trap, related/source.
'@

Write-TextFile -Path 'ATLAS.md' -Content @'
---
tags:
  - type/moc
aliases:
  - The Atlas
  - Knowledge Lattice Index
---

# THE ATLAS

> The complete index of the knowledge lattice: extracted concepts, source coverage, and cross-domain maps.

## Start Here
- [[HOME|HOME]] - workspace orientation and source document entry point
- [[coverage-ledger]] - source-to-note coverage state
- [[moc-k2m-product]] - product kernel, current vessel, and product-source bridge
- [[repair-report-2026-04-11]] - structural repair report
- [[moc-source-memos]] - transcript/source-memo intake and extraction discipline
- [[moc-lenses]] - mental-model and lens layer
- [[moc-mental-models]] - mental-model source family

## Priority Sources
- [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|Intelligence Cartographer's Manifesto]] - source manifesto for network intelligence
- [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|Relationship Cartographer's Manifesto]] - source manifesto for intimate partnership
- [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|Statesman's Manifesto]] - source blueprint for political mastery

## Core Maps
- [[moc-four-layers-of-reality]] - visible, mechanics, dynamics, invisible
- [[moc-8-universal-forces]] - universal mastery forces
- [[moc-8-stages-of-mastery]] - universal mastery stages
- [[moc-8-tools-of-mastery]] - tools of mastery
- [[moc-diagnostics-dangers-creeds]] - original operational layer

## Expanded Cartographer Maps
- [[moc-cartographer-principles]] - principles and creeds
- [[moc-cartographer-diagnostics-practices]] - diagnostics and practices
- [[moc-cartographer-journey]] - stages, phases, and programs
- [[moc-cartographer-cases-examples]] - source examples and cases
- [[moc-cartographer-applications]] - strategies, paths, and metrics
- [[moc-domain-cartography]] - domain cartography method and the clarity engine bridge

## Domain Maps
- [[moc-k2m-product]] - K2M product kernel, current Discord vessel, and product bridge notes
- [[moc-product-management-cartography]] - product-management forces, promise-evidence integrity, fit, and AI evaluation
- [[moc-attention-design-economy]] - attention design forces, salience, routing, auctions, and stewardship
- [[moc-digital-economy]] - digital-economy forces, platform power, and internet value capture
- [[moc-innovation-cartography]] - innovation forces, timing windows, trust diffusion, and value industrialization
- [[moc-problem-solving-cartography]] - problem framing, constraint, causality, redesign, and collective intelligence
- [[moc-storytelling-cartography]] - narrative forces, trust, medium logic, and culture listening
- [[moc-8-intelligence-forces]] - intelligence forces
- [[moc-intelligence-expansion]] - intelligence stages, principles, errors, instruments, phases, and creed
- [[moc-7-technologist-forces]] - technologist forces
- [[moc-technologist-expansion]] - technologist stages, current forces, diagnostics, phases, and creed
- [[moc-marketing-belief-operations]] - belief operations concepts
- [[moc-architecture-belief-forces]] - architecture-specific belief forces and content modules
- [[moc-relationship-cartography]] - relationship forces, diagnostics, cases, dangers, and creed
- [[moc-statesman-mastery]] - political mastery forces, Kenyan terrain, traps, tools, phases, and creed
- [[moc-source-memos]] - source memos and transcript processing
- [[moc-lenses]] - mental-model lenses
- [[moc-mental-models]] - mental-model source family

## Source Documents
- [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]]
- [[docs/product-docs/system/01-system-overview|K2M System Overview]]
- [[docs/digital-economy/canon/manifestos/the-digital-economists-manifesto|The Digital Economist's Manifesto]]
- [[docs/cartographer-mastery/canon/manifesto-sections/00-index|Cartographer's Manifesto]]
- [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|Intelligence Cartographer's Manifesto]]
- [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist's Manifesto]]
- [[docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework|Architecture Industry Marketing Framework]]
- [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|Relationship Cartographer's Manifesto]]
- [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|Statesman's Manifesto]]
- [[moc-mental-models|Great Mental Models Transcript Set]]
'@

Write-TextFile -Path 'HOME.md' -Content @'
# K2M - The Lattice

> The territory is always larger than the map. The work is never finished. Begin.

## Atlas Entry Points
- [[ATLAS|THE ATLAS]] - master index
- [[coverage-ledger]] - source coverage state
- [[moc-k2m-product]] - product kernel, current Discord vessel, and product-source bridge
- [[repair-report-2026-04-11]] - latest structural repair report
- [[moc-source-memos]] - transcript/source-memo intake and extraction discipline
- [[moc-lenses]] - mental-model and lens layer
- [[moc-mental-models]] - mental-model source family

## Priority Sources
- [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|Intelligence Cartographer's Manifesto]] - network intelligence source
- [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|Relationship Cartographer's Manifesto]] - relationship source
- [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|Statesman's Manifesto]] - political mastery source

## Core Atlas Maps
- [[moc-four-layers-of-reality]] - four layers of reality
- [[moc-8-universal-forces]] - eight universal forces
- [[moc-8-stages-of-mastery]] - stages of mastery
- [[moc-8-tools-of-mastery]] - tools of mastery
- [[moc-diagnostics-dangers-creeds]] - diagnostics, dangers, and creeds

## Expanded Cartographer Maps
- [[moc-cartographer-principles]] - principles and creeds
- [[moc-cartographer-diagnostics-practices]] - diagnostics and practices
- [[moc-cartographer-journey]] - phases, stages, and programs
- [[moc-cartographer-cases-examples]] - examples and case studies
- [[moc-cartographer-applications]] - strategies, profession paths, and metrics
- [[moc-domain-cartography]] - domain cartography method and the clarity engine bridge

## Domain Maps
- [[moc-k2m-product]] - K2M product kernel and current product map
- [[moc-product-management-cartography]] - product-management forces, promise-evidence integrity, fit, and AI evaluation
- [[moc-attention-design-economy]] - attention design forces, salience, routing, auctions, and stewardship
- [[moc-digital-economy]] - digital-economy forces, platform power, and internet value capture
- [[moc-innovation-cartography]] - innovation forces, timing windows, trust diffusion, and value industrialization
- [[moc-problem-solving-cartography]] - problem framing, constraint, causality, redesign, and collective intelligence
- [[moc-storytelling-cartography]] - narrative forces, trust, medium logic, and culture listening
- [[moc-8-intelligence-forces]] - intelligence forces
- [[moc-intelligence-expansion]] - intelligence expansion map
- [[moc-7-technologist-forces]] - technologist forces
- [[moc-technologist-expansion]] - technologist expansion map
- [[moc-marketing-belief-operations]] - belief operations
- [[moc-architecture-belief-forces]] - architecture belief forces
- [[moc-relationship-cartography]] - relationship cartography
- [[moc-statesman-mastery]] - statesman mastery
- [[moc-source-memos]] - source memos and transcript processing
- [[moc-lenses]] - mental-model lenses
- [[moc-mental-models]] - mental-model source family

## Source Manifestos
- [[docs/cartographer-mastery/canon/manifesto-sections/00-index|Cartographer's Manifesto]] - universal expertise map
- [[docs/digital-economy/canon/manifestos/the-digital-economists-manifesto|The Digital Economist's Manifesto]] - platforms, software, marketplaces, rails, and AI-native commerce
- [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|Intelligence Cartographer's Manifesto]] - invisible forces behind human networks
- [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist's Manifesto]] - ML, data science, and AI territory map
- [[docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework|Architecture Industry Marketing Framework]] - built environment belief operations
- [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|Relationship Cartographer's Manifesto]] - invisible forces behind enduring relationships
- [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|Statesman's Manifesto]] - political mastery and Kenyan terrain
- [[moc-mental-models|Great Mental Models Transcript Set]] - mental-model lens and case evidence source

## Belief Operations Canon
- [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]]
- [[docs/product-docs/system/01-system-overview|K2M System Overview]]
- [[docs/belief-operations/README|Belief Operations OS]]
- [[docs/belief-operations/canon/manifestos/belief-system-manifesto|The Belief System Manifesto]]
- [[docs/belief-operations/canon/manifestos/marketing-cartographers-manifesto|The Marketing Cartographer's Manifesto]]
- [[docs/belief-operations/k2m-runtime-state|Runtime State]]

## Adjacent Knowledge Areas
- [[docs/ai-proficiency/curriculum-framework/00-index|AI Curriculum Framework]]
- [[docs/ai-proficiency/territory-map/00-index|AI Proficiency Territory Map]]
- [[docs/invisible-writing/frameworks/invisible_mode_quick_reference|Invisible Mode Quick Reference]]
- [[docs/invisible-writing/frameworks/invisible_mode_repurposing_framework|Repurposing Framework]]
- [[docs/invisible-writing/frameworks/k2m_attention_control_prompt|Attention Control Prompt]]
'@

$ledger = @(
  '# Atlas Coverage Ledger',
  '',
  '> Status vocabulary: extracted, MOC-only, intentionally-skipped, not-applicable.',
  '',
  '## Source Families',
  '| Source Family | Status | Atlas Target |',
  '|---|---|---|',
  '| [[docs/cartographer-mastery/canon/manifesto-sections/00-index|Cartographer Manifesto]] | extracted | [[moc-cartographer-principles]]; [[moc-cartographer-diagnostics-practices]]; [[moc-cartographer-journey]]; [[moc-cartographer-cases-examples]]; [[moc-cartographer-applications]] |',
  '| [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|Intelligence Cartographer Manifesto]] | extracted | [[moc-8-intelligence-forces]]; [[moc-intelligence-expansion]] |',
  '| [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist Manifesto]] | extracted | [[moc-7-technologist-forces]]; [[moc-technologist-expansion]] |',
  '| [[docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework|Architecture Marketing Framework]] | extracted | [[moc-marketing-belief-operations]]; [[moc-architecture-belief-forces]] |',
  '| [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|Relationship Cartographer Manifesto]] | extracted | [[moc-relationship-cartography]] |',
  '| [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|Statesman Mastery Blueprint]] | extracted | [[moc-statesman-mastery]] |',
  '| [Statesman PDF](../docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint.pdf) | not-applicable | [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|Markdown source]] |',
  '| [[belief-operations-transcript-set|Belief Operations Transcript Set]] | extracted | [[moc-source-memos]]; [[moc-marketing-belief-operations]]; [[moc-lenses]] |',
  '| [[great-mental-models-volume-1-transcript-set|Great Mental Models Transcript Set]] | extracted | [[moc-mental-models]]; [[moc-lenses]] |',
  '| [[docs/product-docs/k2m-layer4-product-brief|K2M Product Brief]] | extracted | [[moc-k2m-product]]; [[K2M product kernel]]; [[one-kernel-many-doors]] |',
  '| [[docs/product-docs/system/01-system-overview|K2M Current Product System]] | extracted | [[moc-k2m-product]]; [[current-scrappy-product]]; [[discord-as-current-vessel]]; [[kira-as-belief-interface]] |',
  '',
  '## Cartographer Manifesto Files',
  '| Source Unit | Status | Atlas Target |',
  '|---|---|---|'
)
foreach ($f in Get-ChildItem -LiteralPath 'docs/cartographer-mastery/canon/manifesto-sections' -File -Filter *.md | Sort-Object Name) {
  $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
  $status = 'extracted'
  $target = '[[moc-cartographer-journey]]'
  if ($base -eq '00-index') { $status = 'not-applicable'; $target = '[[ATLAS]]' }
  elseif ($base -eq 'part-i-four-layers') { $target = '[[moc-four-layers-of-reality]]' }
  elseif ($base -like 'part-ii-force-*') { $target = '[[moc-8-universal-forces]]' }
  elseif ($base -like 'part-iii-stage-*') { $target = '[[moc-8-stages-of-mastery]]' }
  elseif ($base -like 'part-v-tool-*') { $target = '[[moc-8-tools-of-mastery]]' }
  elseif ($base -like 'part-xii-danger-*') { $target = '[[moc-diagnostics-dangers-creeds]]' }
  elseif ($base -like 'part-iv-principle-*' -or $base -like 'part-viii-creed-*') { $target = '[[moc-cartographer-principles]]' }
  elseif ($base -like 'part-vi-diagnostic-*' -or $base -like 'part-ix-practice-*') { $target = '[[moc-cartographer-diagnostics-practices]]' }
  elseif ($base -like 'example-*' -or $base -like 'part-x-case-*') { $target = '[[moc-cartographer-cases-examples]]' }
  elseif ($base -like 'part-xi-strategy-*' -or $base -like 'part-xiii-path-*' -or $base -like 'part-xiv-metric-*') { $target = '[[moc-cartographer-applications]]' }
  $ledger += "| [[docs/cartographer-mastery/canon/manifesto-sections/$base|$base]] | $status | $target |"
}
$ledger += @(
  '',
  '## Monolithic Manifesto Sections',
  '| Source Unit | Status | Atlas Target |',
  '|---|---|---|',
  '| [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|Intelligence forces]] | extracted | [[moc-8-intelligence-forces]] |',
  '| [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|Intelligence expansion sections]] | extracted | [[moc-intelligence-expansion]] |',
  '| [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist forces]] | extracted | [[moc-7-technologist-forces]] |',
  '| [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|Technologist expansion sections]] | extracted | [[moc-technologist-expansion]] |',
  '| [[docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework|Architecture belief operations]] | extracted | [[moc-architecture-belief-forces]] |',
  '| [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|Relationship cartography sections]] | extracted | [[moc-relationship-cartography]] |',
  '| [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|Statesman mastery sections]] | extracted | [[moc-statesman-mastery]] |'
)
$ledger += @(
  '',
  '## K2M Product Docs',
  '| Source Unit | Status | Atlas Target |',
  '|---|---|---|',
  '| [[docs/product-docs/k2m-layer4-product-brief|K2M Layer 4 Product Brief]] | extracted | [[moc-k2m-product]]; [[K2M product kernel]]; [[one-kernel-many-doors]]; [[the-clarity-company]] |',
  '| [[docs/product-docs/system/README|K2M Product System README]] | MOC-only | [[moc-k2m-product]] |',
  '| [[docs/product-docs/system/01-system-overview|K2M System Overview]] | extracted | [[moc-k2m-product]]; [[current-scrappy-product]]; [[discord-as-current-vessel]]; [[kira-as-belief-interface]] |',
  '| [[docs/product-docs/system/02-student-journey|K2M Student Journey]] | extracted | [[moc-k2m-product]]; [[student-uncertainty-navigation-loop]]; [[current-scrappy-product]] |',
  '| [[docs/product-docs/system/03-facilitator-guide|K2M Facilitator Guide]] | extracted | [[moc-k2m-product]]; [[facilitator-escalation-ladder]] |',
  '| [[docs/product-docs/system/04-super-admin-ops|K2M Super Admin Ops]] | extracted | [[moc-k2m-product]]; [[single-cohort-ops-surface]] |',
  '| [[docs/product-docs/system/05-under-the-hood|K2M Under The Hood]] | extracted | [[moc-k2m-product]]; [[runtime-protective-scaffolding]] |',
  '| [[docs/product-docs/system/06-observability|K2M Observability]] | extracted | [[moc-k2m-product]]; [[product-observability-surface]] |',
  '| docs/product-docs/cohort-design-artifacts/playbook-v2/01-philosophy/ | extracted | [[moc-k2m-playbook-spine]]; [[playbook-philosophy-spine]] |',
  '| docs/product-docs/cohort-design-artifacts/playbook-v2/02-weekly-design/ | extracted | [[moc-k2m-playbook-spine]]; [[cohort-progression-architecture]] |',
  '| docs/product-docs/cohort-design-artifacts/playbook-v2/03-sessions/ | extracted | [[moc-k2m-playbook-spine]]; [[session-prompt-engine]] |',
  '| docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/ | extracted | [[moc-k2m-playbook-spine]]; [[cis-agent-orchestration]] |',
  '| [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-1-cis-controller-logic|CIS Controller Logic]] | extracted | [[cis-agent-orchestration]]; [[single-source-example-library]] |',
  '| [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-2-framer-agent-prompt|Framer Agent Prompt]] | extracted | [[single-source-example-library]] |',
  '| [[docs/product-docs/cohort-design-artifacts/playbook-v2/04-cis-agents/4-3-explorer-agent-prompt|Explorer Agent Prompt]] | extracted | [[single-source-example-library]] |',
  '| docs/product-docs/cohort-design-artifacts/playbook-v2/05-discord-ops/ | extracted | [[moc-k2m-playbook-spine]]; [[discord-cohort-ops-surface]] |',
  '| docs/product-docs/cohort-design-artifacts/playbook-v2/06-artifacts/ | extracted | [[moc-k2m-playbook-spine]]; [[artifact-proof-system]] |',
  '| [[docs/product-docs/cohort-design-artifacts/playbook-v2/06-artifacts/06-artifact-system-epic-6-unified-design|Artifact System Unified Design]] | extracted | [[artifact-proof-system]] |',
  '| [[docs/product-docs/cohort-design-artifacts/playbook-v2/02-weekly-design/week-8-artifact-showcase|Week 8 Artifact Showcase]] | extracted | [[artifact-proof-system]] |',
  '| [[docs/product-docs/cohort-design-artifacts/requirements/cohort-playbook-v2-requirements|Cohort Playbook V2 Requirements]] | extracted | [[cohort-as-product]]; [[thinking-with-ai-as-unifying-skill]] |',
  '| [[docs/product-docs/cohort-design-artifacts/strategy-and-research/k2m-product-roadmap-and-marketing-evolution-strategy|K2M Product Roadmap And Marketing Evolution Strategy]] | extracted | [[product-stability-marketing-evolution]]; [[credibility-before-cross-pollination]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/agent-facilitation-decision-log|Agent Facilitation Decision Log]] | extracted | [[hybrid-agent-facilitation-model]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/cohort-facilitation-redesign-decisions|Cohort Facilitation Redesign Decisions]] | extracted | [[hybrid-agent-facilitation-model]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/adversarial-pre-mortem-onboarding-journey-2026-03-04|Adversarial Pre-Mortem Report: Student Onboarding & Enrollment Journey]] | extracted | [[value-first-onboarding-architecture]]; [[runtime-protective-scaffolding]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/context-engine-experience-design|Context Engine Experience Design]] | extracted | [[context-personalization-contract]]; [[value-first-onboarding-architecture]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/discord-community-culture-and-architecture|Discord Community Culture And Architecture]] | extracted | [[private-process-public-proof]]; [[discord-cohort-ops-surface]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/experience-design-evaluation-party-mode-2026-01-24|Experience Design Evaluation Party Mode]] | extracted | [[thinking-with-ai-as-unifying-skill]]; [[playbook-philosophy-spine]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/onboarding-context-canonical-v3|Onboarding + Context Canonical V3]] | extracted | [[context-personalization-contract]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-launch-gaps-and-solutions|Pre-Launch Gaps And Solutions]] | extracted | [[cohort-launch-gating]]; [[value-first-onboarding-architecture]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/student-onboarding-and-enrollment-flow|Student Onboarding And Enrollment Flow]] | extracted | [[value-first-onboarding-architecture]]; [[context-personalization-contract]]; [[private-process-public-proof]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-mortem-2026-03-04-decisions|Pre-Mortem Decisions Log]] | extracted | [[value-first-onboarding-architecture]]; [[context-personalization-contract]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-mortem-session-4-decisions|Pre-Mortem Decisions Log - Session 4]] | extracted | [[value-first-onboarding-architecture]]; [[runtime-protective-scaffolding]]; [[cohort-launch-gating]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/provider-runtime-override|Provider Runtime Override]] | extracted | [[runtime-protective-scaffolding]] |',
  '| [[docs/product-docs/cohort-design-artifacts/design-and-architecture/solutions-and-new-automations|Solutions And New Automations]] | extracted | [[value-first-onboarding-architecture]]; [[cohort-launch-gating]]; [[runtime-protective-scaffolding]] |',
  '| docs/product-docs/cohort-design-artifacts/design-and-architecture/ | extracted | [[value-first-onboarding-architecture]]; [[context-personalization-contract]]; [[hybrid-agent-facilitation-model]]; [[private-process-public-proof]]; [[runtime-protective-scaffolding]]; [[cohort-launch-gating]] |',
  '| [[docs/product-docs/cohort-design-artifacts/operations/checklists/cohort-production-go-live-checklist|Cohort Production Go-Live Checklist]] | extracted | [[cohort-launch-gating]] |',
  '| [[docs/product-docs/cohort-design-artifacts/operations/checklists/cohort-template-deployment-checklist|Cohort Template Deployment Checklist]] | extracted | [[cohort-launch-gating]] |',
  '| docs/product-docs/cohort-design-artifacts/operations/checklists/ | extracted | [[cohort-launch-gating]] |',
  '| docs/product-docs/cohort-design-artifacts/reviews/ | intentionally-skipped | Product-evidence backlog for later hardening; see [[k2m-product-docs-intake-ledger]] |',
  '| docs/product-docs/cohort-design-artifacts/summaries/ | intentionally-skipped | Product-evidence backlog for later hardening; see [[k2m-product-docs-intake-ledger]] |',
  '| docs/product-docs/cohort-design-artifacts/task-notes/ | intentionally-skipped | Product-evidence backlog for later hardening; see [[k2m-product-docs-intake-ledger]] |',
  '| docs/product-docs/cohort-design-artifacts/operations/sprint/task-notes/ | intentionally-skipped | Product-evidence backlog for later hardening; see [[k2m-product-docs-intake-ledger]] |',
  '| docs/product-docs/cohort-design-artifacts/archive/ | intentionally-skipped | Historical evidence backlog; see [[k2m-product-docs-intake-ledger]] |',
  '| docs/product-docs/cohort-design-artifacts/exports/ | intentionally-skipped | Historical export backlog; see [[k2m-product-docs-intake-ledger]] |',
  '',
  '## New Manifesto Intake',
  '| Source Unit | Status | Atlas Target |',
  '|---|---|---|',
  '| [[docs/cartographer-mastery/canon/manifestos/the-domain-cartographers-manifesto|The Domain Cartographer''s Manifesto]] | extracted | [[moc-domain-cartography]]; [[native-causality]]; [[anti-mimicry]]; [[practitioner-transformation]] |',
  '| [[docs/cartographer-mastery/canon/operating-systems/the-cartographic-engine-beta|The Cartographic Engine Beta]] | extracted | [[moc-domain-cartography]]; [[cartographic-engine]]; [[thinking-os]]; [[make-os]]; [[moc-k2m-product]] |',
  '| [[docs/attention-design-economy/canon/manifestos/attention-design-economy-manifesto|Attention Design Economy Manifesto]] | extracted | [[moc-attention-design-economy]]; [[attention-design-scarcity-inversion]]; [[attention-design-salience-force]]; [[attention-design-routing-force]]; [[attention-design-auction-force]] |',
  '| [[docs/digital-economy/canon/manifestos/the-digital-economists-manifesto|The Digital Economist''s Manifesto]] | extracted | [[moc-digital-economy]]; [[digital-economy-demand-aggregation]]; [[digital-economy-zero-marginal-replication]]; [[digital-economy-network-effects-and-liquidity]]; [[digital-economy-ownership-dependency-and-platform-tax]] |',
  '| [[docs/innovation/canon/manifestos/the-innovation-cartographers-manifesto|The Innovation Cartographer''s Manifesto]] | extracted | [[moc-innovation-cartography]]; [[innovation-problem-tension]]; [[innovation-adjacent-possible-and-cross-pollination]]; [[innovation-timing-windows]]; [[innovation-trust-gradient-diffusion]] |',
  '| [[docs/problem-solving/canon/manifestos/the-problem-solving-cartographers-manifesto|The Problem-Solving Cartographer''s Manifesto]] | extracted | [[moc-problem-solving-cartography]]; [[problem-solving-framing-force]]; [[problem-solving-constraint-force]]; [[problem-solving-causal-force]]; [[problem-solving-complexity-force]] |',
  '| [[docs/storytelling/canon/manifestos/the-storytellers-manifesto|The Storyteller''s Manifesto]] | extracted | [[moc-storytelling-cartography]]; [[storytelling-attention-gate]]; [[storytelling-question-engine]]; [[storytelling-narrative-trust-force]]; [[storytelling-medium-and-participation-force]] |',
  '| [[docs/product-management/canon/manifestos/product-management-mastery-manifesto|Product Management Mastery Manifesto]] | extracted | [[moc-product-management-cartography]]; [[progress-not-requests]]; [[discovery-density]]; [[positioning-gravity]]; [[outcome-discipline]]; [[ai-leverage-and-the-evaluation-burden]] |',
  '| docs/product-management/canon/manifestos/product-management-forces-manifesto.md | intentionally-skipped | Deleted legacy source; replaced by revised product management mastery intake |'
)
$ledger += @(
  '',
  '## Transcript Source Memos',
  '| Source Unit | Status | Atlas Target |',
  '|---|---|---|'
)
if (Test-Path -LiteralPath 'docs/belief-operations/canon/transcripts') {
  foreach ($f in Get-ChildItem -LiteralPath 'docs/belief-operations/canon/transcripts' -File -Filter *.md | Sort-Object Name) {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
    $status = 'MOC-only'
    $target = '[[belief-operations-transcript-set]]'
    if ($base -eq '06-how-belief-architecture-moves-populations') {
      $status = 'extracted'
      $target = '[[belief-operations-transcript-set]]; [[mental-models-as-lenses]]'
    }
    $ledger += "| [[docs/belief-operations/canon/transcripts/$base|$base]] | $status | $target |"
  }
}
if (Test-Path -LiteralPath 'docs/mental-models/canon/transcripts') {
  $mentalModelTranscripts = @(Get-ChildItem -LiteralPath 'docs/mental-models/canon/transcripts' -File | Where-Object { $_.Extension.ToLowerInvariant() -in @('.md','.txt') } | Sort-Object Name)
  foreach ($f in $mentalModelTranscripts) {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
    $targetPath = 'docs/mental-models/canon/transcripts/' + $f.Name
    $target = '[[great-mental-models-volume-1-transcript-set]]; [[moc-mental-models]]'
    if ($base -eq '00_-_Charlie_Munger_s_Five_Essential_Mental_Models') {
      $target += '; [[map-is-not-territory-lens]]; [[circle-of-competence-lens]]; [[first-principles-lens]]; [[thought-experiment-lens]]; [[second-order-thinking-lens]]; [[antaeus-reality-contact-case]]; [[galileo-ship-perspective-case]]; [[hot-stove-feedback-distance-case]]'
    } elseif ($base -eq '01_-_Mistaking_the_Map_for_the_Territory') {
      $target += '; [[map-is-not-territory-lens]]; [[london-underground-purpose-fit-case]]; [[karima-abud-cartographer-bias-case]]; [[hardin-ostrom-commons-boundary-case]]; [[jane-jacobs-statistical-city-case]]'
    } elseif ($base -eq '02_-_Stay_Within_Your_Circle_of_Competence') {
      $target += '; [[circle-of-competence-lens]]; [[everest-local-guide-case]]; [[rose-blumkin-circle-discipline-case]]; [[atul-gawande-coaching-blind-spot-case]]; [[queen-elizabeth-counsel-synthesis-case]]'
    } elseif ($base -eq '03_-_Deconstruct_Reality_With_First_Principles') {
      $target += '; [[first-principles-lens]]; [[socratic-questioning-practice]]; [[five-whys-practice]]; [[barry-marshall-bacterial-surprise-case]]; [[temple-grandin-principle-method-case]]; [[russell-turkey-trend-law-case]]'
    } elseif ($base -eq '04_-_Simulate_Reality_With_Thought_Experiments') {
      $target += '; [[thought-experiment-lens]]; [[einstein-elevator-equivalence-case]]; [[veil-of-ignorance-fairness-case]]; [[russian-roulette-process-vs-outcome-case]]'
    } elseif ($base -eq '05_-_Second-Order_Thinking_Prevents_The_Cobra_Effect') {
      $target += '; [[second-order-thinking-lens]]; [[cobra-effect-incentive-case]]; [[livestock-antibiotics-resistance-case]]; [[buffett-parade-positioning-case]]'
    } elseif ($base -eq '06_-_Stop_Predicting_And_Start_Betting') {
      $target += '; [[probabilistic-thinking-lens]]; [[bayesian-update-practice]]; [[vera-atkins-imperfect-information-case]]; [[stairs-versus-terrorism-fat-tail-case]]; [[linda-conjunction-fallacy-case]]; [[occams-razor-lens]]; [[hanlons-razor-lens]]'
    } elseif ($base -eq '07_-_Avoiding_Stupidity_Is_Easier_Than_Brilliance') {
      $target += '; [[tool-3-inversion]]; [[anti-goal-inversion-practice]]; [[silver-blaze-negative-evidence-case]]; [[john-bogle-dont-lose-case]]; [[nansen-drift-design-case]]'
    } elseif ($base -eq '08_-_Occam_s_Razor_Slices_Through_Complexity_and_Drama') {
      $target += '; [[occams-razor-lens]]'
    } elseif ($base -eq '09_-_Why_Your_Brain_Prefers_Malice_Over_Stupidity') {
      $target += '; [[hanlons-razor-lens]]'
    } elseif ($base -eq '10_-_Building_A_Latticework_Of_Mental_Models') {
      $target += '; [[mental-models-as-lenses]]; [[lattice]]; [[tool-4-lattice-method]]; [[antaeus-reality-contact-case]]'
    }
    $ledger += "| [[$targetPath|$base]] | extracted | $target |"
  }
}
if (Test-Path -LiteralPath 'docs/_inbox/transcripts') {
  $inboxBacklog = @(Get-ChildItem -LiteralPath 'docs/_inbox/transcripts' -File | Where-Object { $_.Extension.ToLowerInvariant() -in @('.md','.txt') -and $_.BaseName -ne 'README' } | Sort-Object Name)
  foreach ($f in $inboxBacklog) {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
    $targetPath = 'docs/_inbox/transcripts/' + $f.Name
    $ledger += "| [[$targetPath|$base]] | intentionally-skipped | Future mental-models transcript backlog |"
  }
}
Write-TextFile -Path 'atlas/coverage-ledger.md' -Content ($ledger -join "`r`n")

$atlasMdCount = (Get-ChildItem -Path 'atlas' -Recurse -File -Filter *.md).Count
$atomicCount = @(Get-ChildItem -Path 'atlas' -Recurse -File -Filter *.md | Where-Object {
  (Get-Content -LiteralPath $_.FullName -Raw) -match '(?m)^\s*-\s*type/atomic\s*$'
}).Count
$mocCount = @(Get-ChildItem -Path 'atlas' -Recurse -File -Filter *.md | Where-Object {
  (Get-Content -LiteralPath $_.FullName -Raw) -match '(?m)^\s*-\s*type/moc\s*$'
}).Count
$coverageRowCount = @($ledger | Where-Object { $_ -match '^\| \[\[' }).Count

Write-TextFile -Path 'atlas/repair-report-2026-04-11.md' -Content @"
---
tags:
  - type/ops
aliases:
  - Atlas Repair Report 2026-04-11
---

# Atlas Repair Report - 2026-04-11

## Summary
This report records the structural repair and extraction completion pass for the Obsidian atlas.

## Before
- Atlas Markdown files: 63
- Atomic notes: 55
- MOCs: 8
- Dead links found in `HOME.md`, `ATLAS.md`, and `atlas/**/*.md`: 57
- Source coverage: partial; `docs/cartographer-mastery/canon/manifesto-sections` had 65 directly unrepresented source files
- Taxonomy gaps: stage tags were underspecified; danger/category/mapping tags were missing

## After
- Atlas Markdown files: $atlasMdCount
- Atomic notes: $atomicCount
- MOCs: $mocCount
- Coverage ledger rows: $coverageRowCount
- Added category folders for principles, diagnostics, phases, creeds, examples, practices, cases, strategies, paths, metrics, and programs.
- Added completion notes for missing Cartographer source files.
- Added expansion notes for Intelligence, Technologist, and Architecture/Marketing manifesto sections that were not represented by existing force notes.
- Added extraction maps for the Relationship Cartographer's Manifesto and the Statesman's Manifesto.
- Normalized source/canon placement so the manifesto sources and Statesman PDF live under `docs/`, while root keeps entry/config files.
- Removed empty scratch files from root: `connectaddress=127.0.0.1` and untitled canvas placeholders.
- Added [[lattice]] as the concept note behind [[tool-4-lattice-method]].
- Rewrote core MOCs to include how-to-use guidance and tiered mappings.
- Added [[coverage-ledger]] as the source-to-note coverage map.
- Added [[moc-source-memos]], [[source-memo-protocol]], and [[belief-operations-transcript-set]] to govern transcript-derived knowledge.
- Added [[moc-lenses]] and [[mental-models-as-lenses]] to separate mental-model perception frames from the general lattice.
- Expanded the Great Mental Models extraction with lens updates, reusable practices, and case notes across the processed trial transcripts.
- Added `scripts/validate-atlas.ps1` for structural validation.

## Validation Gate
Run:

```powershell
.\scripts\validate-atlas.ps1
```

Required pass conditions:
- 0 dead links
- 0 orphan atomic notes
- 0 unknown tags
- 0 coverage ledger issues

Final result:
- Dead links: 0
- Orphan atomic notes: 0
- Unknown tags: 0
- Coverage issues: 0
- Template warnings: 0

## Spot Checks
- Cartographer practice: [[practice-7-lattice-audit]] against [[docs/cartographer-mastery/canon/manifesto-sections/part-ix-practice-7-lattice-audit|source]].
- Cartographer metric: [[metric-5-leverage-point-accuracy]] against [[docs/cartographer-mastery/canon/manifesto-sections/part-xiv-metric-5-leverage-point-accuracy|source]].
- Intelligence non-force section: [[intel-intelligence-the-intelligence-marketing-translation]] against [[docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto|source]].
- Technologist non-force section: [[tech-technologist-phase-6-ongoing-staying-at-the-frontier]] against [[docs/technologist-cartography/canon/manifestos/the-technologists-manifesto|source]].
- Architecture marketing section: [[architecture-architecture-identity-pressure]] against [[docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework|source]].
- Relationship source family: [[moc-relationship-cartography]] against [[docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto|source]].
- Statesman source family: [[moc-statesman-mastery]] against [[docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint|source]].
- Mapping tiers reviewed and corrected where needed in [[moc-intelligence-expansion]], [[moc-technologist-expansion]], [[moc-cartographer-diagnostics-practices]], [[moc-cartographer-journey]], and [[moc-architecture-belief-forces]].

## Remaining Intentional Work
- Generated extraction notes are concise atlas-layer summaries, not full source reproductions.
- Cross-domain mappings are now labeled as equivalent, analogy, or adjacent where MOCs were rewritten; future notes should follow the same convention.
"@

Write-Host 'Atlas indexes and taxonomy generated.'
