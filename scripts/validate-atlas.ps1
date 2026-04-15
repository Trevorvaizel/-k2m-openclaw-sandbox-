$ErrorActionPreference = 'Stop'
$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $Root

function Get-RelPath([string]$FullName) {
  return $FullName.Substring($Root.Length + 1).Replace('\','/')
}

$allLinkTargets = Get-ChildItem -Path . -Recurse -File | Where-Object {
  $_.Extension.ToLowerInvariant() -in @('.md','.txt') -and $_.FullName -notmatch '\\.git\\|\\node_modules\\|\\.venv\\'
}
$atlasMd = Get-ChildItem -Path atlas -Recurse -File -Filter *.md
$checkFiles = @((Get-Item HOME.md), (Get-Item ATLAS.md)) + $atlasMd

$index = @{}
foreach ($f in $allLinkTargets) {
  $rel = Get-RelPath $f.FullName
  $noext = $rel -replace '\.(md|txt)$',''
  $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
  foreach ($k in @($rel.ToLowerInvariant(), $noext.ToLowerInvariant(), $base.ToLowerInvariant())) {
    if (-not $index.ContainsKey($k)) { $index[$k] = New-Object System.Collections.Generic.List[string] }
    $index[$k].Add($rel) | Out-Null
  }
}

function Normalize-Target([string]$Raw) {
  $clean = $Raw -replace '\\\|','|'
  $t = ($clean -split '\|')[0]
  $t = ($t -split '#')[0]
  $t = $t.Trim() -replace '\\','/'
  if ($t.EndsWith('.md')) { $t = $t.Substring(0, $t.Length - 3) }
  return $t
}

function Test-LinkExists([string]$Target) {
  if ([string]::IsNullOrWhiteSpace($Target)) { return $true }
  $key = $Target.ToLowerInvariant()
  if ($index.ContainsKey($key)) { return $true }
  if ($index.ContainsKey(($Target + '.md').ToLowerInvariant())) { return $true }
  $base = [System.IO.Path]::GetFileName($Target).ToLowerInvariant()
  return $index.ContainsKey($base)
}

$rx = [regex]'\[\[([^\]]+)\]\]'
$links = New-Object System.Collections.Generic.List[object]
foreach ($f in $checkFiles) {
  $rel = Get-RelPath $f.FullName
  $content = Get-Content -LiteralPath $f.FullName -Raw
  foreach ($m in $rx.Matches($content)) {
    $target = Normalize-Target $m.Groups[1].Value
    $links.Add([pscustomobject]@{ Source=$rel; Target=$target; Exists=(Test-LinkExists $target); Raw=$m.Value }) | Out-Null
  }
}
$dead = @($links | Where-Object { -not $_.Exists })

$inbound = @{}
foreach ($l in $links) {
  if (-not $l.Exists) { continue }
  $base = [System.IO.Path]::GetFileName($l.Target).ToLowerInvariant()
  if (-not $inbound.ContainsKey($base)) { $inbound[$base] = 0 }
  $inbound[$base] += 1
}

$orphans = @()
foreach ($f in $atlasMd) {
  $content = Get-Content -LiteralPath $f.FullName -Raw
  if ($content -notmatch 'type/atomic') { continue }
  $base = [System.IO.Path]::GetFileNameWithoutExtension($f.Name).ToLowerInvariant()
  if (-not $inbound.ContainsKey($base)) { $orphans += (Get-RelPath $f.FullName) }
}

$taxonomy = Get-Content -LiteralPath 'vault-taxonomy.md' -Raw
$allowed = @{}
foreach ($m in [regex]::Matches($taxonomy, '`#([^`]+)`')) { $allowed[$m.Groups[1].Value] = $true }
$unknownTags = New-Object System.Collections.Generic.List[object]
foreach ($f in $atlasMd + (Get-Item ATLAS.md)) {
  $content = Get-Content -LiteralPath $f.FullName -Raw
  if ($content -notmatch '(?s)^---\s*(.*?)\s*---') { continue }
  $front = $Matches[1]
  $mode = ''
  foreach ($line in ($front -split "`r?`n")) {
    if ($line -match '^tags:\s*$') { $mode = 'tags'; continue }
    if ($line -match '^aliases:\s*$') { $mode = 'aliases'; continue }
    if ($line -match '^\S') { $mode = '' }
    if ($mode -eq 'tags' -and $line -match '^\s*-\s*(.+?)\s*$') {
      $tag = $Matches[1].Trim()
      if (-not $allowed.ContainsKey($tag)) {
        $unknownTags.Add([pscustomobject]@{ File=(Get-RelPath $f.FullName); Tag=$tag }) | Out-Null
      }
    }
  }
}

$coverageIssues = @()
if (-not (Test-Path -LiteralPath 'atlas/coverage-ledger.md')) {
  $coverageIssues += 'missing coverage ledger'
} else {
  $ledger = Get-Content -LiteralPath 'atlas/coverage-ledger.md' -Raw
  if ($ledger -match 'not-covered|TODO|TBD') { $coverageIssues += 'coverage ledger contains not-covered/TODO/TBD' }
  if ($ledger -notmatch '\| .* \| (extracted|MOC-only|intentionally-skipped|not-applicable) \|') {
    $coverageIssues += 'coverage ledger has no recognized status rows'
  }
  $transcripts = @(Get-ChildItem -Path docs -Recurse -File | Where-Object {
    $rel = Get-RelPath $_.FullName
    $_.Extension.ToLowerInvariant() -in @('.md','.txt') -and $rel -match '/canon/transcripts/' -and $_.BaseName -ne 'README'
  })
  foreach ($t in $transcripts) {
    $rel = Get-RelPath $t.FullName
    $relNoExt = $rel -replace '\.(md|txt)$',''
    if ($ledger -notmatch [regex]::Escape($rel) -and $ledger -notmatch [regex]::Escape($relNoExt)) {
      $coverageIssues += "transcript missing coverage row: $relNoExt"
    }
  }
  $inboxTranscripts = @(Get-ChildItem -Path 'docs/_inbox/transcripts' -File -ErrorAction SilentlyContinue | Where-Object {
    $_.Extension.ToLowerInvariant() -in @('.md','.txt') -and $_.BaseName -ne 'README'
  })
  foreach ($t in $inboxTranscripts) {
    $rel = Get-RelPath $t.FullName
    $relNoExt = $rel -replace '\.(md|txt)$',''
    if ($ledger -notmatch [regex]::Escape($rel) -and $ledger -notmatch [regex]::Escape($relNoExt)) {
      $coverageIssues += "unprocessed transcript in inbox: $rel"
    }
  }
}

$templateWarnings = @()
foreach ($f in $atlasMd) {
  $content = Get-Content -LiteralPath $f.FullName -Raw
  $rel = Get-RelPath $f.FullName
  $frontBlock = ''
  if ($content -match '(?s)^---\s*(.*?)\s*---') { $frontBlock = $Matches[1] }
  if ($frontBlock -match '(?m)^\s*-\s*type/source-memo\s*$') {
    foreach ($section in @('Source','Parent Territory','Role','New Knowledge','Extraction Decision','Extraction Targets','Related')) {
      if ($content -notmatch "(?m)^##\s+$([regex]::Escape($section))\s*$") { $templateWarnings += "$rel missing $section section" }
    }
    continue
  }
  if ($frontBlock -match '(?m)^\s*-\s*type/atomic\s*$') {
    if ($content -notmatch '^---') { $templateWarnings += "$rel missing frontmatter" }
    if ($content -notmatch '(?m)^##\s+Related\s*$') { $templateWarnings += "$rel missing Related section" }
    if ($content -notmatch 'Source:') { $templateWarnings += "$rel missing Source reference" }
  }
}

Write-Host 'Atlas validation'
Write-Host "- Dead links: $($dead.Count)"
Write-Host "- Orphan atomic notes: $($orphans.Count)"
Write-Host "- Unknown tags: $($unknownTags.Count)"
Write-Host "- Coverage issues: $($coverageIssues.Count)"
Write-Host "- Template warnings: $($templateWarnings.Count)"

if ($dead.Count) { $dead | Sort-Object Target,Source | Format-Table -AutoSize }
if ($orphans.Count) { $orphans | Sort-Object | ForEach-Object { Write-Host "ORPHAN $_" } }
if ($unknownTags.Count) { $unknownTags | Sort-Object Tag,File | Format-Table -AutoSize }
if ($coverageIssues.Count) { $coverageIssues | ForEach-Object { Write-Host "COVERAGE $_" } }
if ($templateWarnings.Count) { $templateWarnings | Select-Object -First 80 | ForEach-Object { Write-Host "TEMPLATE $_" } }

if ($dead.Count -or $orphans.Count -or $unknownTags.Count -or $coverageIssues.Count) { exit 1 }
exit 0
