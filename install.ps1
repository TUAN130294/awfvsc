# AWF for Claude Code VSC - Windows Installer
# Usage: irm https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.ps1 | iex

$ErrorActionPreference = "Stop"
$repo = "https://github.com/TUAN130294/awfvsc.git"
$dest = Join-Path $env:USERPROFILE ".claude\commands\awf"
$tmp = Join-Path $env:TEMP "awfvsc-install-$(Get-Random)"

Write-Host ""
Write-Host "  ╔═══════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "  ║   AWF for Claude Code VSC Installer   ║" -ForegroundColor Cyan
Write-Host "  ║   15 Workflows • Plan Code Deploy     ║" -ForegroundColor Cyan
Write-Host "  ╚═══════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Check git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "  [X] Git not found. Install git first." -ForegroundColor Red
    exit 1
}

# Clone
Write-Host "  [1/3] Downloading workflows..." -ForegroundColor Yellow
git clone --depth 1 --quiet $repo $tmp 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "  [X] Clone failed. Check your internet connection." -ForegroundColor Red
    exit 1
}

# Install
Write-Host "  [2/3] Installing to $dest ..." -ForegroundColor Yellow
if (-not (Test-Path $dest)) {
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
}
Copy-Item "$tmp\commands\*" $dest -Force -Recurse

# Cleanup
Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue

# Verify
$count = (Get-ChildItem $dest -Filter "*.md").Count
Write-Host "  [3/3] Installed $count workflows!" -ForegroundColor Green
Write-Host ""
Write-Host "  ✅ Done! Use in Claude Code:" -ForegroundColor Green
Write-Host "     /awf:plan   - Plan features" -ForegroundColor White
Write-Host "     /awf:code   - Write code" -ForegroundColor White
Write-Host "     /awf:debug  - Fix bugs" -ForegroundColor White
Write-Host "     /awf:deploy - Deploy to prod" -ForegroundColor White
Write-Host ""
Write-Host "  Full list: /awf:<TAB> in Claude Code" -ForegroundColor DarkGray
Write-Host ""
