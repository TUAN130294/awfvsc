#!/bin/sh
# AWF for Claude Code VSC - macOS/Linux Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.sh | sh

set -e

REPO="https://github.com/TUAN130294/awfvsc.git"
CLAUDE_DIR="$HOME/.claude"
CMD_DEST="$CLAUDE_DIR/commands/awf"
HOOK_DEST="$CLAUDE_DIR/hooks/awf"
SETTINGS="$CLAUDE_DIR/settings.json"
TMP=$(mktemp -d)

echo ""
echo "  +========================================+"
echo "  |   AWF for Claude Code VSC Installer    |"
echo "  |   15 Workflows + 3 Hooks + Config      |"
echo "  +========================================+"
echo ""

# Check git
if ! command -v git >/dev/null 2>&1; then
    echo "  [X] Git not found. Install git first."
    exit 1
fi

# Clone
echo "  [1/5] Downloading AWF..."
git clone --depth 1 --quiet "$REPO" "$TMP" 2>/dev/null

# Install commands + shared
echo "  [2/5] Installing commands..."
mkdir -p "$CMD_DEST/shared"
cp -r "$TMP/commands/"* "$CMD_DEST/"
cp -r "$TMP/shared/"* "$CMD_DEST/shared/"

# Install hooks
echo "  [3/5] Installing hooks..."
mkdir -p "$HOOK_DEST/lib"
cp "$TMP/hooks/"*.cjs "$HOOK_DEST/"
cp "$TMP/hooks/lib/"* "$HOOK_DEST/lib/"

# Merge hooks into settings.json
echo "  [4/5] Configuring hooks..."
if command -v node >/dev/null 2>&1; then
    node -e "
const fs = require('fs');
const settingsPath = '$SETTINGS';
const hookBase = '$HOOK_DEST';

let settings = {};
try { settings = JSON.parse(fs.readFileSync(settingsPath, 'utf8')); } catch {}
if (!settings.hooks) settings.hooks = {};

const hookDefs = [
  ['SessionStart', 'awf-session-init.cjs', 'startup|resume|clear|compact'],
  ['UserPromptSubmit', 'awf-prompt-reminder.cjs', null],
  ['SubagentStart', 'awf-subagent-context.cjs', '*']
];

for (const [event, file, matcher] of hookDefs) {
  if (!settings.hooks[event]) settings.hooks[event] = [];
  const exists = settings.hooks[event].some(e =>
    e.hooks && e.hooks.some(h => h.command && h.command.includes(file))
  );
  if (!exists) {
    const entry = { hooks: [{ type: 'command', command: 'node \"' + hookBase + '/' + file + '\"' }] };
    if (matcher) entry.matcher = matcher;
    settings.hooks[event].push(entry);
  }
}

fs.writeFileSync(settingsPath, JSON.stringify(settings, null, 2));
" 2>/dev/null && echo "  [OK] Hooks registered" || echo "  [!] Auto-config failed. See README for manual setup."
else
    echo "  [!] Node.js not found. Hooks installed but not registered."
    echo "      See README for manual hook configuration."
fi

# Create default .awf.json if not exists
if [ ! -f "$HOME/.awf.json" ] && [ -f "$TMP/.awf.json.example" ]; then
    cp "$TMP/.awf.json.example" "$HOME/.awf.json"
fi

# Cleanup
rm -rf "$TMP"

# Verify
COUNT=$(ls "$CMD_DEST"/*.md 2>/dev/null | wc -l | tr -d ' ')
echo "  [5/5] Installed $COUNT workflows + 3 hooks!"
echo ""
echo "  Done! Use in Claude Code:"
echo "     /awf:plan   - Plan features"
echo "     /awf:code   - Write code"
echo "     /awf:debug  - Fix bugs"
echo "     /awf:deploy - Deploy to prod"
echo ""
echo "  Full list: /awf:<TAB> in Claude Code"
echo "  Config: ~/.awf.json (customize locale, quality, etc.)"
echo ""
