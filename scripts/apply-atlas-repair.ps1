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

function Read-TextFile([string]$Path) {
  $full = $Path
  if (-not [System.IO.Path]::IsPathRooted($full)) { $full = Join-Path $Root $Path }
  return [System.IO.File]::ReadAllText($full, [System.Text.Encoding]::UTF8)
}

function Slugify([string]$Text) {
  return (($Text.ToLowerInvariant() -replace '&',' and ' -replace '[^a-z0-9]+','-').Trim('-'))
}

function Clean-Title([string]$Text) {
  $t = $Text -replace '^#{1,6}\s*','' -replace '^\*\*','' -replace '\*\*$',''
  $t = $t -replace '^PART\s+[IVX]+:\s*','' -replace '^Part\s+\d+:\s*',''
  return $t.Trim()
}

function Frontmatter([string[]]$Tags, [string[]]$Aliases) {
  $lines = @('---','tags:')
  foreach ($tag in $Tags) { $lines += "  - $tag" }
  $lines += 'aliases:'
  foreach ($alias in $Aliases) { $lines += '  - "' + ($alias -replace '"','\"') + '"' }
  $lines += '---'
  return ($lines -join "`r`n")
}

function Get-Block([string[]]$Lines, [int]$Start) {
  $items = New-Object System.Collections.Generic.List[string]
  $startLevel = 6
  if ($Lines[$Start] -match '^(#{1,6})\s+') { $startLevel = $Matches[1].Length }
  for ($i = $Start + 1; $i -lt $Lines.Count; $i++) {
    $line = $Lines[$i].Trim()
    if (-not $line -or $line -match '^---+$' -or $line -match '^\|[- :|]+\|$') { continue }
    if ($line -match '^(#{1,6})\s+(.+)$') {
      $level = $Matches[1].Length
      if ($level -le $startLevel -and $items.Count -gt 0) { break }
      $line = $Matches[2].Trim()
    }
    $line = $line -replace '\*\*','' -replace '^[-*]\s+','' -replace '^\d+\.\s+',''
    if ($line.Trim()) { $items.Add($line.Trim()) | Out-Null }
    if ($items.Count -ge 14) { break }
  }
  return @($items)
}

function Related-Links([string]$Text) {
  $links = New-Object System.Collections.Generic.List[string]
  $rules = @(
    @('leverage|80/20|position','[[asymmetric-leverage]]'),
    @('time|velocity|density|lattice|compound','[[time-compression]]'),
    @('constraint|limit','[[constraint-catalyst]]'),
    @('beginner|unlearn|certainty|empty chair','[[beginners-mind]]'),
    @('emerg|interaction|combine','[[emergent-complexity]]'),
    @('context|transfer|world','[[context-spectrum]]'),
    @('failure|mistake|adversarial|wrong','[[failure-gradients]]'),
    @('attention|focus|silence|signal','[[attention-economics]]'),
    @('belief|trust|identity|friction|marketing|client','[[trust-gradient]]'),
    @('network|source|channel|intelligence','[[intel-structural-positioning]]'),
    @('model|data|ai|ml|loss|benchmark|compute','[[tech-interpretive]]'),
    @('relationship|marriage|intimacy|attachment|neuroception|desire|trust','[[trust-gradient]]'),
    @('politic|statesman|power|coalition|kenya|governance','[[asymmetric-leverage]]'),
    @('map|territory','[[map-territory]]')
  )
  foreach ($rule in $rules) {
    if ($Text -match $rule[0] -and -not $links.Contains($rule[1])) { $links.Add($rule[1]) | Out-Null }
  }
  if ($links.Count -eq 0) { $links.Add('[[moc-8-universal-forces]]') | Out-Null }
  return @($links)
}

function Note-Content($Title,$Tags,$Definition,$Pattern,$Use,$Trap,$Related,$Source,$MappingTier) {
  $fm = Frontmatter -Tags $Tags -Aliases @($Title)
  $relatedText = ($Related | ForEach-Object { "- $_" }) -join "`r`n"
  return @"
$fm

# $Title

> $Definition

## Definition
$Definition

## Pattern
$Pattern

## Diagnostic / Use
$Use

## Trap or Limitation
$Trap

## Mapping Tier
$MappingTier

## Related
$relatedText
- Source: $Source
"@
}

function Bullet-List([string[]]$Items, [string]$Fallback) {
  $clean = @($Items | Where-Object { $_ -and $_.Trim() } | Select-Object -First 9)
  if ($clean.Count -eq 0) { return "- $Fallback" }
  return (($clean | ForEach-Object { "- $_" }) -join "`r`n")
}

function Is-SectionLabel([string]$Text) {
  if (-not $Text) { return $true }
  $t = $Text.Trim()
  if ($t -eq 'Once per week:') { return $false }
  return ($t -match '^(The )?[A-Z][A-Za-z /-]+:$' -or $t -match '^(Measurement|Benchmark Progression|What It Measures|The Process|The Result|The shift is):$')
}

function Clean-Evidence([string[]]$Items) {
  return @($Items | Where-Object { $_ -and -not (Is-SectionLabel $_) })
}

function Items-Between([string[]]$Items, [string]$StartLabel, [string]$EndLabel) {
  $out = New-Object System.Collections.Generic.List[string]
  $active = $false
  foreach ($item in $Items) {
    $t = $item.Trim()
    if ($t -eq $StartLabel) { $active = $true; continue }
    if ($EndLabel -and $t -eq $EndLabel) { break }
    if ($active -and -not (Is-SectionLabel $t)) { $out.Add($t) | Out-Null }
  }
  return @($out)
}

function First-Meaningful([string[]]$Items, [string]$Fallback) {
  foreach ($item in $Items) {
    if ($item -match '[\.\?\!"]') { return $item }
  }
  foreach ($item in $Items) {
    if ($item.Trim()) { return $item }
  }
  return $Fallback
}

function New-GeneratedNote($SourcePath,$HeadingIndex,$Title,$TargetPath,$CategoryTag,$DomainTag,$MappingTier='Adjacent mapping unless a MOC explicitly marks it stronger.') {
  $raw = Read-TextFile $SourcePath
  $lines = $raw -split "`r?`n"
  $block = @(Get-Block -Lines $lines -Start $HeadingIndex)
  if ($block.Count -eq 0) { $block = @('This source unit is represented as a concise atlas note. Read the source for full doctrine.') }
  $definition = $block[0]
  $evidence = Clean-Evidence @($block | Select-Object -Skip 1)
  $pattern = Bullet-List $evidence 'The source gives this unit its operational detail; keep the note tied to that evidence.'
  $use = 'Ask: Where does this source unit change the next diagnostic, decision, or practice?'
  $trap = 'Treating this concise note as a replacement for the source, or linking it as equivalent without checking the mapping tier.'
  $related = Related-Links ($Title + ' ' + ($block -join ' '))
  $sourceLink = '[[' + ($SourcePath -replace '\.md$','') + '|Source]]'
  $fm = Frontmatter -Tags @('type/atomic',$CategoryTag,$DomainTag,'layer/invisible') -Aliases @($Title)
  $relatedText = ($related | ForEach-Object { "- $_" }) -join "`r`n"
  if ($CategoryTag -match 'practice|instrument') {
    $processItems = Items-Between $block 'The Process:' 'The Result:'
    if ($processItems.Count -eq 0) { $processItems = $evidence }
    $resultItems = Items-Between $block 'The Result:' $null
    $processText = Bullet-List $processItems 'Run the source procedure as written, then review the evidence it produces.'
    $resultText = Bullet-List $resultItems 'The result should match the source unit''s stated payoff or evidence pattern.'
    $content = @"
$fm

# $Title

> $definition

## Purpose
$definition

## Process
$processText

## Result
$resultText

## When To Use
$use

## Failure Mode
$trap

## Mapping Tier
$MappingTier

## Related
$relatedText
- Source: $sourceLink
"@
  } elseif ($CategoryTag -match 'stage|phase|path') {
    $content = @"
$fm

# $Title

> $definition

## State
$definition

## Visible Signs
$pattern

## Transition Trigger
$use

## Trap
$trap

## Next / Previous
- Follow the source sequence and the relevant MOC rather than treating this state as isolated.

## Mapping Tier
$MappingTier

## Related
$relatedText
- Source: $sourceLink
"@
  } else {
    $example = First-Meaningful $evidence $definition
    $content = @"
$fm

# $Title

> $definition

## Definition
$definition

## Pattern
$pattern

## Source-Grounded Example
$example

## Diagnostic / Use
$use

## Trap or Limitation
$trap

## Mapping Tier
$MappingTier

## Related
$relatedText
- Source: $sourceLink
"@
  }
  Write-TextFile -Path $TargetPath -Content $content
}

foreach ($dir in @('atlas/principles','atlas/diagnostics','atlas/phases','atlas/creeds','atlas/examples','atlas/practices','atlas/cases','atlas/strategies','atlas/paths','atlas/metrics','atlas/programs','scripts')) {
  New-Item -ItemType Directory -Force -Path (Join-Path $Root $dir) | Out-Null
}

$cartographerRules = @(
  @{ Filter='00-preamble.md'; Folder='atlas/concepts'; Category='category/concept'; Prefix='' },
  @{ Filter='epilogue.md'; Folder='atlas/concepts'; Category='category/concept'; Prefix='' },
  @{ Filter='final-invitation.md'; Folder='atlas/concepts'; Category='category/concept'; Prefix='' },
  @{ Filter='appendix-implementation-checklist.md'; Folder='atlas/programs'; Category='category/program'; Prefix='' },
  @{ Filter='part-xv-90-day-program.md'; Folder='atlas/programs'; Category='category/program'; Prefix='part-xv-' },
  @{ Filter='example-*.md'; Folder='atlas/examples'; Category='category/example'; Prefix='' },
  @{ Filter='part-iv-principle-*.md'; Folder='atlas/principles'; Category='category/principle'; Prefix='part-iv-' },
  @{ Filter='part-vi-diagnostic-*.md'; Folder='atlas/diagnostics'; Category='category/diagnostic'; Prefix='part-vi-' },
  @{ Filter='part-vii-phase-*.md'; Folder='atlas/phases'; Category='category/phase'; Prefix='part-vii-' },
  @{ Filter='part-viii-creed-*.md'; Folder='atlas/creeds'; Category='category/creed'; Prefix='part-viii-' },
  @{ Filter='part-ix-practice-*.md'; Folder='atlas/practices'; Category='category/practice'; Prefix='part-ix-' },
  @{ Filter='part-x-case-*.md'; Folder='atlas/cases'; Category='category/case'; Prefix='part-x-' },
  @{ Filter='part-xi-strategy-*.md'; Folder='atlas/strategies'; Category='category/strategy'; Prefix='part-xi-' },
  @{ Filter='part-xiii-path-*.md'; Folder='atlas/paths'; Category='category/path'; Prefix='part-xiii-' },
  @{ Filter='part-xiv-metric-*.md'; Folder='atlas/metrics'; Category='category/metric'; Prefix='part-xiv-' }
)

foreach ($rule in $cartographerRules) {
  foreach ($file in Get-ChildItem -LiteralPath (Join-Path $Root 'docs/cartographer-mastery/canon/manifesto-sections') -File -Filter $rule.Filter | Sort-Object Name) {
    $source = 'docs/cartographer-mastery/canon/manifesto-sections/' + $file.Name
    $lines = (Read-TextFile $file.FullName) -split "`r?`n"
    $headingIndex = 0
    $title = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    for ($i = 0; $i -lt $lines.Count; $i++) {
      if ($lines[$i] -match '^#{1,3}\s+') { $headingIndex = $i; $title = Clean-Title $lines[$i]; break }
    }
    $slug = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    if ($rule.Prefix) { $slug = $slug -replace ('^' + [regex]::Escape($rule.Prefix)), '' }
    New-GeneratedNote $source $headingIndex $title ($rule.Folder + '/' + $slug + '.md') $rule.Category 'domain/mastery'
  }
}

$lattice = Note-Content 'Lattice Density' @('type/atomic','concept/lattice','category/concept','domain/mastery','layer/invisible') 'Lattice density is the connectedness of understanding: new knowledge becomes faster to acquire when it attaches to many existing nodes.' "- Individual facts remain slow until they connect.`r`n- Dense connections create time compression.`r`n- Bad concepts create lattice overload, so connection quality matters more than link count." 'Ask: Is this idea connected to strong concepts, or am I just making the graph denser?' 'Confusing many links with meaningful understanding. A dense lattice of weak concepts is worse than a sparse map.' @('[[tool-4-lattice-method]]','[[time-compression]]','[[danger-lattice-overload]]','[[emergent-complexity]]') '[[docs/cartographer-mastery/canon/manifesto-sections/part-v-tool-4-the-lattice-method|Cartographer Tool 4]]' 'Equivalent inside the Cartographer domain: this is the concept behind the Lattice Method tool.'
Write-TextFile -Path 'atlas/concepts/lattice.md' -Content $lattice

function Generate-HeadingNotes($SourcePath,$DomainTag,$Rules) {
  $lines = (Read-TextFile $SourcePath) -split "`r?`n"
  for ($i = 0; $i -lt $lines.Count; $i++) {
    foreach ($rule in $Rules) {
      if ($lines[$i] -match $rule.Pattern) {
        $title = (Clean-Title $lines[$i])
        if ($rule.TitlePrefix) { $title = $rule.TitlePrefix + $title }
        $slug = Slugify $title
        if ($rule.SlugPrefix) { $slug = $rule.SlugPrefix + '-' + $slug }
        New-GeneratedNote $SourcePath $i $title ($rule.Folder + '/' + $slug + '.md') $rule.Category $DomainTag
      }
    }
  }
}

$intelRules = @(
  @{ Pattern='^## PART I:'; Folder='atlas/layers'; Category='category/layer'; SlugPrefix='intel'; TitlePrefix='Intelligence: ' },
  @{ Pattern='^### Stage '; Folder='atlas/stages'; Category='category/stage'; SlugPrefix='intel'; TitlePrefix='Intelligence ' },
  @{ Pattern='^### Principle '; Folder='atlas/principles'; Category='category/principle'; SlugPrefix='intel'; TitlePrefix='Intelligence ' },
  @{ Pattern='^### Fatal Error '; Folder='atlas/dangers'; Category='category/fatal-error'; SlugPrefix='intel'; TitlePrefix='Intelligence ' },
  @{ Pattern='^### Instrument '; Folder='atlas/tools'; Category='category/instrument'; SlugPrefix='intel'; TitlePrefix='Intelligence ' },
  @{ Pattern='^### Phase '; Folder='atlas/phases'; Category='category/phase'; SlugPrefix='intel'; TitlePrefix='Intelligence ' },
  @{ Pattern='^## PART VIII:'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='intel'; TitlePrefix='Intelligence: ' },
  @{ Pattern='^## PART IX:'; Folder='atlas/creeds'; Category='category/creed'; SlugPrefix='intel'; TitlePrefix='Intelligence: ' },
  @{ Pattern='^## APPENDIX:'; Folder='atlas/programs'; Category='category/program'; SlugPrefix='intel'; TitlePrefix='Intelligence: ' }
)
Generate-HeadingNotes 'docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto.md' 'domain/intelligence' $intelRules

$techRules = @(
  @{ Pattern='^# PART I:'; Folder='atlas/layers'; Category='category/layer'; SlugPrefix='tech'; TitlePrefix='Technologist: ' },
  @{ Pattern='^### STAGE '; Folder='atlas/stages'; Category='category/stage'; SlugPrefix='tech'; TitlePrefix='Technologist ' },
  @{ Pattern='^### CURRENT FORCE '; Folder='atlas/forces'; Category='category/current-force'; SlugPrefix='tech'; TitlePrefix='Current AI ' },
  @{ Pattern='^### THE TRACK DECISION'; Folder='atlas/tools'; Category='category/instrument'; SlugPrefix='tech'; TitlePrefix='Technologist: ' },
  @{ Pattern='^### THE TOOLING MAP BY LAYER'; Folder='atlas/tools'; Category='category/instrument'; SlugPrefix='tech'; TitlePrefix='Technologist: ' },
  @{ Pattern='^## THE CANONICAL TEXTS'; Folder='atlas/programs'; Category='category/program'; SlugPrefix='tech'; TitlePrefix='Technologist: ' },
  @{ Pattern='^### Before Building Any ML System'; Folder='atlas/diagnostics'; Category='category/diagnostic'; SlugPrefix='tech'; TitlePrefix='Technologist Diagnostic: ' },
  @{ Pattern='^### When Evaluating a Result'; Folder='atlas/diagnostics'; Category='category/diagnostic'; SlugPrefix='tech'; TitlePrefix='Technologist Diagnostic: ' },
  @{ Pattern='^### When Encountering a Failure'; Folder='atlas/diagnostics'; Category='category/diagnostic'; SlugPrefix='tech'; TitlePrefix='Technologist Diagnostic: ' },
  @{ Pattern='^### For Self-Assessment'; Folder='atlas/diagnostics'; Category='category/diagnostic'; SlugPrefix='tech'; TitlePrefix='Technologist Diagnostic: ' },
  @{ Pattern='^### PHASE '; Folder='atlas/phases'; Category='category/phase'; SlugPrefix='tech'; TitlePrefix='Technologist ' },
  @{ Pattern='^# THE TECHNOLOGIST''S CREED'; Folder='atlas/creeds'; Category='category/creed'; SlugPrefix='tech'; TitlePrefix='Technologist: ' }
)
Generate-HeadingNotes 'docs/technologist-cartography/canon/manifestos/the-technologists-manifesto.md' 'domain/ai' $techRules

$archRules = @(
  @{ Pattern='^## Part [1-7]:'; Folder='atlas/principles'; Category='category/content-module'; SlugPrefix='architecture'; TitlePrefix='Architecture: ' },
  @{ Pattern='^### The Four Layers of Architecture'; Folder='atlas/layers'; Category='category/layer'; SlugPrefix='architecture'; TitlePrefix='Architecture: ' },
  @{ Pattern='^### The Three-Level Problem in Architecture'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='architecture'; TitlePrefix='Architecture: ' },
  @{ Pattern='^### The Trust Gradient Applied to Architecture'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='architecture'; TitlePrefix='Architecture: ' },
  @{ Pattern='^### The Invisible Writing Mode Applied'; Folder='atlas/principles'; Category='category/content-module'; SlugPrefix='architecture'; TitlePrefix='Architecture: ' },
  @{ Pattern='^### Copy Patterns'; Folder='atlas/tools'; Category='category/instrument'; SlugPrefix='architecture'; TitlePrefix='Architecture: ' },
  @{ Pattern='^## Appendix:'; Folder='atlas/diagnostics'; Category='category/diagnostic'; SlugPrefix='architecture'; TitlePrefix='Architecture: ' }
)
Generate-HeadingNotes 'docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework.md' 'domain/marketing' $archRules

$archLines = (Read-TextFile 'docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework.md') -split "`r?`n"
$archTargets = @{ 3='network-architecture'; 5='timing-window'; 6='value-realization-gap'; 7='expansion-loop' }
for ($i = 0; $i -lt $archLines.Count; $i++) {
  if ($archLines[$i] -match '^\*\*Force\s+(\d+):\s+(.+?)\*\*\s*$') {
    $num = [int]$Matches[1]
    if ($archTargets.ContainsKey($num)) {
      New-GeneratedNote 'docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework.md' $i $Matches[2].Trim() ('atlas/concepts/' + $archTargets[$num] + '.md') 'category/concept' 'domain/marketing' 'Adjacent or equivalent mapping is declared in [[moc-architecture-belief-forces]].'
    }
  }
}

$relationshipRules = @(
  @{ Pattern='^## PART I:'; Folder='atlas/layers'; Category='category/layer'; SlugPrefix='relationship'; TitlePrefix='Relationship: ' },
  @{ Pattern='^### Force '; Folder='atlas/forces'; Category='category/force'; SlugPrefix='relationship'; TitlePrefix='Relationship ' },
  @{ Pattern='^### Stage '; Folder='atlas/stages'; Category='category/stage'; SlugPrefix='relationship'; TitlePrefix='Relationship ' },
  @{ Pattern='^## PART (IV|V|VI|VII|VIII|IX):'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='relationship'; TitlePrefix='Relationship: ' },
  @{ Pattern='^### The (Jungian|Attachment|Imago|Network Architecture|Social Debt Architecture|Modernity-Tradition Tension|Spiritual Dimension)'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='relationship'; TitlePrefix='Relationship: ' },
  @{ Pattern='^### Diagnostic '; Folder='atlas/diagnostics'; Category='category/diagnostic'; SlugPrefix='relationship'; TitlePrefix='Relationship ' },
  @{ Pattern='^### TIER |^### FOR THE KENYAN'; Folder='atlas/programs'; Category='category/program'; SlugPrefix='relationship'; TitlePrefix='Relationship Library: ' },
  @{ Pattern='^### Case Study '; Folder='atlas/cases'; Category='category/case'; SlugPrefix='relationship'; TitlePrefix='Relationship ' },
  @{ Pattern='^### Danger '; Folder='atlas/dangers'; Category='category/danger'; SlugPrefix='relationship'; TitlePrefix='Relationship ' },
  @{ Pattern='^### Principle '; Folder='atlas/creeds'; Category='category/creed'; SlugPrefix='relationship'; TitlePrefix='Relationship ' },
  @{ Pattern='^### Days '; Folder='atlas/programs'; Category='category/program'; SlugPrefix='relationship'; TitlePrefix='Relationship Program: ' },
  @{ Pattern='^## EPILOGUE:'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='relationship'; TitlePrefix='Relationship: ' }
)
Generate-HeadingNotes 'docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto.md' 'domain/relationship' $relationshipRules

$statesmanRules = @(
  @{ Pattern='^## PART I:'; Folder='atlas/layers'; Category='category/layer'; SlugPrefix='statesman'; TitlePrefix='Statesman: ' },
  @{ Pattern='^### Territory '; Folder='atlas/layers'; Category='category/layer'; SlugPrefix='statesman'; TitlePrefix='Statesman ' },
  @{ Pattern='^### Force '; Folder='atlas/forces'; Category='category/force'; SlugPrefix='statesman'; TitlePrefix='Statesman ' },
  @{ Pattern='^### Stage '; Folder='atlas/stages'; Category='category/stage'; SlugPrefix='statesman'; TitlePrefix='Statesman ' },
  @{ Pattern='^## PART IV:'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='statesman'; TitlePrefix='Statesman: ' },
  @{ Pattern='^#### Layer '; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='statesman'; TitlePrefix='Statesman Kenyan Politics ' },
  @{ Pattern='^#### Trap '; Folder='atlas/dangers'; Category='category/danger'; SlugPrefix='statesman'; TitlePrefix='Statesman Kenyan Politics ' },
  @{ Pattern='^### Tool '; Folder='atlas/tools'; Category='category/instrument'; SlugPrefix='statesman'; TitlePrefix='Statesman ' },
  @{ Pattern='^### Weekly Self-Assessment'; Folder='atlas/diagnostics'; Category='category/diagnostic'; SlugPrefix='statesman'; TitlePrefix='Statesman Diagnostic: ' },
  @{ Pattern='^### Phase '; Folder='atlas/phases'; Category='category/phase'; SlugPrefix='statesman'; TitlePrefix='Statesman ' },
  @{ Pattern='^## THE STATESMAN''S CREED'; Folder='atlas/creeds'; Category='category/creed'; SlugPrefix='statesman'; TitlePrefix='Statesman: ' },
  @{ Pattern='^## EPILOGUE:'; Folder='atlas/concepts'; Category='category/concept'; SlugPrefix='statesman'; TitlePrefix='Statesman: ' }
)
Generate-HeadingNotes 'docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint.md' 'domain/politics' $statesmanRules

$replaceMap = [ordered]@{
  'structural-positioning'='intel-structural-positioning'; 'scale-force'='tech-scale'; 'network-mirror'='intel-network-mirror';
  'interpretive-force'='tech-interpretive'; 'data-force'='tech-data'; 'four-layers-of-reality'='moc-four-layers-of-reality';
  'geometry-force'='tech-geometry'; 'identity-loyalty'='intel-identity-loyalty'; 'informal-channel'='intel-informal-channel';
  'information-asymmetry'='intel-information-asymmetry'; 'navigation-force'='tech-navigation'; 'reality-gap'='tech-reality-gap';
  'representation-force'='tech-representation'; 'fate-alignment'='intel-fate-alignment'; 'social-debt'='intel-social-debt';
  'sentiment-behavior'='intel-sentiment-behavior'; 'concept/lattice'='lattice'; 'expertise-is-service'='stage-7-the-empty-chair'
}
$editable = Get-ChildItem -Path 'atlas' -Recurse -File -Filter *.md
$editable += Get-Item 'ATLAS.md'
$editable += Get-Item 'HOME.md'
foreach ($file in $editable) {
  $c = Read-TextFile $file.FullName
  foreach ($key in $replaceMap.Keys) {
    $c = $c -replace ('\[\[' + [regex]::Escape($key) + '([\|#\]])'), ('[[' + $replaceMap[$key] + '$1')
  }
  $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
  [System.IO.File]::WriteAllText($file.FullName, $c, $utf8NoBom)
}

$tool4Path = Join-Path $Root 'atlas/tools/tool-4-lattice-method.md'
if (Test-Path -LiteralPath $tool4Path) {
  $tool4 = Read-TextFile $tool4Path
  if ($tool4 -notmatch '\[\[lattice\]\]') {
    $tool4 = $tool4 -replace '(?m)^## Related\s*$', "## Related`r`n- Concept: [[lattice]]"
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($tool4Path, $tool4, $utf8NoBom)
  }
}

Write-Host 'Atlas extraction notes generated.'
