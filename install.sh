#!/bin/sh
# AWF for Claude Code VSC - macOS/Linux Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.sh | sh

set -e

REPO="https://github.com/TUAN130294/awfvsc.git"
DEST="$HOME/.claude/commands/awf"
TMP=$(mktemp -d)

echo ""
echo "  ╔═══════════════════════════════════════╗"
echo "  ║   AWF for Claude Code VSC Installer   ║"
echo "  ║   15 Workflows • Plan Code Deploy     ║"
echo "  ╚═══════════════════════════════════════╝"
echo ""

# Check git
if ! command -v git &> /dev/null; then
    echo "  [X] Git not found. Install git first."
    exit 1
fi

# Clone
echo "  [1/3] Downloading workflows..."
git clone --depth 1 --quiet "$REPO" "$TMP" 2>/dev/null

# Install
echo "  [2/3] Installing to $DEST ..."
mkdir -p "$DEST"
cp -r "$TMP/commands/"* "$DEST/"

# Cleanup
rm -rf "$TMP"

# Verify
COUNT=$(ls "$DEST"/*.md 2>/dev/null | wc -l | tr -d ' ')
echo "  [3/3] Installed $COUNT workflows!"
echo ""
echo "  ✅ Done! Use in Claude Code:"
echo "     /awf:plan   - Plan features"
echo "     /awf:code   - Write code"
echo "     /awf:debug  - Fix bugs"
echo "     /awf:deploy - Deploy to prod"
echo ""
echo "  Full list: /awf:<TAB> in Claude Code"
echo ""
