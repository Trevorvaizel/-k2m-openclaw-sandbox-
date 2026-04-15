$ErrorActionPreference = 'Stop'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $Root

function Assert-InWorkspace([string]$Path) {
  $full = [System.IO.Path]::GetFullPath((Join-Path $Root $Path))
  if (-not $full.StartsWith($Root, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Path escapes workspace: $Path"
  }
  return $full
}

function Move-WorkspaceItem([string]$From, [string]$To) {
  $fromFull = Assert-InWorkspace $From
  $toFull = Assert-InWorkspace $To
  $toParent = Split-Path -Parent $toFull
  if (-not (Test-Path -LiteralPath $fromFull)) {
    if (Test-Path -LiteralPath $toFull) {
      Write-Host "SKIP already moved: $To"
      return
    }
    Write-Warning "Missing source: $From"
    return
  }
  if (Test-Path -LiteralPath $toFull) {
    throw "Destination already exists while source still exists: $To"
  }
  New-Item -ItemType Directory -Force -Path $toParent | Out-Null
  Move-Item -LiteralPath $fromFull -Destination $toFull
  Write-Host "MOVED $From -> $To"
}

$moves = @(
  @{ From = 'docs/cartographers_manifesto'; To = 'docs/cartographer-mastery/canon/manifesto-sections' },
  @{ From = 'docs/THE_INTELLIGENCE_CARTOGRAPHERS_MANIFESTO.md'; To = 'docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto.md' },
  @{ From = 'docs/the-technologists-manifesto.md'; To = 'docs/technologist-cartography/canon/manifestos/the-technologists-manifesto.md' },
  @{ From = 'docs/architecture-industry-marketing-framework.md'; To = 'docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework.md' },
  @{ From = 'docs/THE_RELATIONSHIP_CARTOGRAPHERS_MANIFESTO.md'; To = 'docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto.md' },
  @{ From = 'docs/boyd-were-statesman-mastery-blueprint.md'; To = 'docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint.md' },
  @{ From = 'docs/boyd-were-statesman-mastery-blueprint.pdf'; To = 'docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint.pdf' },
  @{ From = 'docs/ai_curriculum_framework'; To = 'docs/ai-proficiency/curriculum-framework' },
  @{ From = 'docs/ai_proficiency_territory_map'; To = 'docs/ai-proficiency/territory-map' },
  @{ From = 'docs/invisible-writing-frameworks'; To = 'docs/invisible-writing/frameworks' }
)

foreach ($move in $moves) {
  Move-WorkspaceItem -From $move.From -To $move.To
}

$transcriptFolders = @(
  'docs/cartographer-mastery/canon/transcripts',
  'docs/intelligence-cartography/canon/transcripts',
  'docs/technologist-cartography/canon/transcripts',
  'docs/architecture-marketing/canon/transcripts',
  'docs/relationship-cartography/canon/transcripts',
  'docs/statesman-mastery/canon/transcripts',
  'docs/ai-proficiency/canon/transcripts',
  'docs/invisible-writing/canon/transcripts'
)
foreach ($folder in $transcriptFolders) {
  $full = Assert-InWorkspace $folder
  New-Item -ItemType Directory -Force -Path $full | Out-Null
}

$replacements = [ordered]@{
  'docs/cartographers_manifesto' = 'docs/cartographer-mastery/canon/manifesto-sections'
  'docs/THE_INTELLIGENCE_CARTOGRAPHERS_MANIFESTO' = 'docs/intelligence-cartography/canon/manifestos/the-intelligence-cartographers-manifesto'
  'docs/the-technologists-manifesto' = 'docs/technologist-cartography/canon/manifestos/the-technologists-manifesto'
  'docs/architecture-industry-marketing-framework' = 'docs/architecture-marketing/canon/manifestos/architecture-industry-marketing-framework'
  'docs/THE_RELATIONSHIP_CARTOGRAPHERS_MANIFESTO' = 'docs/relationship-cartography/canon/manifestos/the-relationship-cartographers-manifesto'
  'docs/boyd-were-statesman-mastery-blueprint' = 'docs/statesman-mastery/canon/manifestos/boyd-were-statesman-mastery-blueprint'
  'docs/ai_curriculum_framework' = 'docs/ai-proficiency/curriculum-framework'
  'docs/ai_proficiency_territory_map' = 'docs/ai-proficiency/territory-map'
  'docs/invisible-writing-frameworks' = 'docs/invisible-writing/frameworks'
}

$textFiles = Get-ChildItem -Path . -Recurse -File -Include *.md,*.ps1 | Where-Object {
  $_.FullName -notmatch '\\.git\\|\\node_modules\\|\\.venv\\' -and $_.FullName -ne $PSCommandPath
}

foreach ($file in $textFiles) {
  $content = Get-Content -LiteralPath $file.FullName -Raw
  $updated = $content
  foreach ($key in $replacements.Keys) {
    $updated = $updated.Replace($key, $replacements[$key])
  }
  if ($updated -ne $content) {
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($file.FullName, $updated, $utf8NoBom)
    Write-Host "UPDATED $(Resolve-Path -Relative $file.FullName)"
  }
}

Write-Host 'Docs reorganization complete.'
