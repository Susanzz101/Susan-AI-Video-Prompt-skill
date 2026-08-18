$ErrorActionPreference = "Stop"

$skillName = "jimeng-video-prompt"
$repoZip = "https://github.com/Susanzz101/Susan-AI-Video-Prompt-skill/archive/refs/heads/main.zip"
$tmp = Join-Path $env:TEMP "susan-ai-video-prompt-skill-install"
$zip = Join-Path $env:TEMP "susan-ai-video-prompt-skill.zip"
$destRoot = Join-Path $HOME ".codex\skills"
$dest = Join-Path $destRoot $skillName

Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -LiteralPath $zip -Force -ErrorAction SilentlyContinue

Invoke-WebRequest -Uri $repoZip -OutFile $zip
Expand-Archive -LiteralPath $zip -DestinationPath $tmp -Force

New-Item -ItemType Directory -Force -Path $destRoot | Out-Null
Remove-Item -LiteralPath $dest -Recurse -Force -ErrorAction SilentlyContinue

$source = Get-ChildItem -LiteralPath $tmp -Directory | Select-Object -First 1
$skillSource = Join-Path $source.FullName $skillName

if (!(Test-Path -LiteralPath (Join-Path $skillSource "SKILL.md"))) {
  throw "SKILL.md not found in downloaded repository."
}

Copy-Item -Recurse -LiteralPath $skillSource -Destination $dest

Write-Host "Installed Susan-AI视频提示词生成智能体 to $dest"
Write-Host "Restart Codex or open a new chat if the skill does not appear immediately."
