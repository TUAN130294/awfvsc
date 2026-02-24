# AWF for Claude Code VSC - Windows Installer
# Usage: irm https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.ps1 | iex

$ErrorActionPreference = "Stop"
$repo = "https://github.com/TUAN130294/awfvsc.git"
$claudeDir = Join-Path $env:USERPROFILE ".claude"
$cmdDest = Join-Path $claudeDir "commands\awf"
$hookDest = Join-Path $claudeDir "hooks\awf"
$settingsFile = Join-Path $claudeDir "settings.json"
$tmp = Join-Path $env:TEMP "awfvsc-install-$(Get-Random)"

Write-Host ""
Write-Host "  +========================================+" -ForegroundColor Cyan
Write-Host "  |   AWF for Claude Code VSC Installer    |" -ForegroundColor Cyan
Write-Host "  |   15 Workflows + 3 Hooks + Config      |" -ForegroundColor Cyan
Write-Host "  +========================================+" -ForegroundColor Cyan
Write-Host ""

# Check git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "  [X] Git not found. Install git first." -ForegroundColor Red
    exit 1
}

# Clone
Write-Host "  [1/5] Downloading AWF..." -ForegroundColor Yellow
git clone --depth 1 --quiet $repo $tmp 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "  [X] Clone failed. Check internet connection." -ForegroundColor Red
    exit 1
}

# Install commands + shared
Write-Host "  [2/5] Installing commands..." -ForegroundColor Yellow
if (-not (Test-Path $cmdDest)) { New-Item -ItemType Directory -Path $cmdDest -Force | Out-Null }
Copy-Item "$tmp\commands\*" $cmdDest -Force -Recurse
$sharedDest = Join-Path $cmdDest "shared"
if (-not (Test-Path $sharedDest)) { New-Item -ItemType Directory -Path $sharedDest -Force | Out-Null }
Copy-Item "$tmp\shared\*" $sharedDest -Force -Recurse

# Install hooks
Write-Host "  [3/5] Installing hooks..." -ForegroundColor Yellow
if (-not (Test-Path $hookDest)) { New-Item -ItemType Directory -Path $hookDest -Force | Out-Null }
$hookLib = Join-Path $hookDest "lib"
if (-not (Test-Path $hookLib)) { New-Item -ItemType Directory -Path $hookLib -Force | Out-Null }
Copy-Item "$tmp\hooks\*.cjs" $hookDest -Force
Copy-Item "$tmp\hooks\lib\*" $hookLib -Force

# Merge hooks into settings.json
Write-Host "  [4/5] Configuring hooks..." -ForegroundColor Yellow
try {
    $settings = @{}
    if (Test-Path $settingsFile) {
        $settings = Get-Content $settingsFile -Raw | ConvertFrom-Json -AsHashtable
    }
    if (-not $settings.ContainsKey("hooks")) { $settings["hooks"] = @{} }

    $hookBase = $hookDest.Replace('\', '/')

    # SessionStart hook
    if (-not $settings.hooks.ContainsKey("SessionStart")) { $settings.hooks["SessionStart"] = @() }
    $existing = $settings.hooks["SessionStart"] | Where-Object { $_.hooks | Where-Object { $_.command -like "*awf-session-init*" } }
    if (-not $existing) {
        $settings.hooks["SessionStart"] += @{
            matcher = "startup|resume|clear|compact"
            hooks = @(@{ type = "command"; command = "node `"$hookBase/awf-session-init.cjs`"" })
        }
    }

    # UserPromptSubmit hook
    if (-not $settings.hooks.ContainsKey("UserPromptSubmit")) { $settings.hooks["UserPromptSubmit"] = @() }
    $existing = $settings.hooks["UserPromptSubmit"] | Where-Object { $_.hooks | Where-Object { $_.command -like "*awf-prompt-reminder*" } }
    if (-not $existing) {
        $settings.hooks["UserPromptSubmit"] += @{
            hooks = @(@{ type = "command"; command = "node `"$hookBase/awf-prompt-reminder.cjs`"" })
        }
    }

    # SubagentStart hook
    if (-not $settings.hooks.ContainsKey("SubagentStart")) { $settings.hooks["SubagentStart"] = @() }
    $existing = $settings.hooks["SubagentStart"] | Where-Object { $_.hooks | Where-Object { $_.command -like "*awf-subagent-context*" } }
    if (-not $existing) {
        $settings.hooks["SubagentStart"] += @{
            matcher = "*"
            hooks = @(@{ type = "command"; command = "node `"$hookBase/awf-subagent-context.cjs`"" })
        }
    }

    $settings | ConvertTo-Json -Depth 10 | Set-Content $settingsFile -Encoding UTF8
    Write-Host "  [OK] Hooks registered in settings.json" -ForegroundColor DarkGray
} catch {
    Write-Host "  [!] Could not auto-configure hooks. Manual setup needed." -ForegroundColor Yellow
    Write-Host "      See README for manual hook configuration." -ForegroundColor DarkGray
}

# Create default .awf.json if not exists
$globalAwf = Join-Path $env:USERPROFILE ".awf.json"
if (-not (Test-Path $globalAwf)) {
    Copy-Item "$tmp\.awf.json.example" $globalAwf
}

# Cleanup
Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue

# Verify
$count = (Get-ChildItem $cmdDest -Filter "*.md").Count
Write-Host "  [5/5] Installed $count workflows + 3 hooks!" -ForegroundColor Green
Write-Host ""
Write-Host "  Done! Use in Claude Code:" -ForegroundColor Green
Write-Host "     /awf:plan   - Plan features" -ForegroundColor White
Write-Host "     /awf:code   - Write code" -ForegroundColor White
Write-Host "     /awf:debug  - Fix bugs" -ForegroundColor White
Write-Host "     /awf:deploy - Deploy to prod" -ForegroundColor White
Write-Host ""
Write-Host "  Full list: /awf:<TAB> in Claude Code" -ForegroundColor DarkGray
Write-Host "  Config: ~/.awf.json (customize locale, quality, etc.)" -ForegroundColor DarkGray
Write-Host ""
