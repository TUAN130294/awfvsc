# AWF for Claude Code VSC

**Antigravity Workflow Framework** — 15 development workflows + hooks system for **Claude Code** (CLI & VS Code Extension).

## Quick Install

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.ps1 | iex
```

### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.sh | sh
```

### Manual
```bash
git clone https://github.com/TUAN130294/awfvsc.git
# Copy commands + shared
cp -r awfvsc/commands/ ~/.claude/commands/awf/
cp -r awfvsc/shared/ ~/.claude/commands/awf/shared/
# Copy hooks
mkdir -p ~/.claude/hooks/awf/lib
cp awfvsc/hooks/*.cjs ~/.claude/hooks/awf/
cp awfvsc/hooks/lib/* ~/.claude/hooks/awf/lib/
# Register hooks manually (see Hook Configuration below)
```

## Workflows

### Recommended Flow
```
/awf-init → /awf-brainstorm → /awf-plan → /awf-design → /awf-visualize → /awf-code → /awf-run → /awf-test → /awf-deploy
```

| Command | Description |
|---------|-------------|
| `/awf-init` | Initialize project workspace |
| `/awf-brainstorm` | Brainstorm & research ideas → BRIEF.md |
| `/awf-plan` | Smart Proposal + Phase Generation |
| `/awf-design` | Technical design — DB, API, data flow |
| `/awf-visualize` | UI/UX mockups + design specs |
| `/awf-code` | Implement with scope lock & auto-test loop |
| `/awf-run` | Start app with prerequisite checks |
| `/awf-debug` | Systematic debugging with root cause analysis |
| `/awf-test` | Testing strategy & execution |
| `/awf-deploy` | Production deployment with full checklist |
| `/awf-refactor` | Safe code cleanup |
| `/awf-audit` | Security & code quality audit |
| `/awf-review` | Project scanner & handover |
| `/awf-recap` | Save/restore context |
| `/awf-next` | Smart next-step suggestions |

## Architecture

```
~/.claude/
├── commands/awf/           # 15 workflow commands
│   ├── awf-init.md ... awf-next.md
│   └── shared/             # Shared context (extracted from commands)
│       ├── doc-framework.md     # 4-tier document hierarchy + templates
│       ├── subagent-protocol.md # Mandatory delegation + review gates
│       ├── language-detect.md   # Auto language detection
│       ├── personas/            # 8 AI personas (split per command)
│       ├── non-tech-mode.md     # Tech level adaptation
│       ├── session-protocol.md  # State management
│       └── rules.md             # Safety rules & patterns
├── hooks/awf/              # 3 context injection hooks
│   ├── awf-session-init.cjs     # Project detection on startup
│   ├── awf-prompt-reminder.cjs  # Phase + DoD progress reminders
│   ├── awf-subagent-context.cjs # Subagent context injection
│   └── lib/awf-config.cjs       # Shared config loader
└── settings.json           # Hooks auto-registered here
```

## Configuration

Create `.awf.json` in your project root (or `~/.awf.json` for global defaults):

```json
{
  "locale": "auto",
  "techLevel": "auto",
  "qualityLevel": "production",
  "persona": "default",
  "paths": { "plans": "plans", "docs": "docs" },
  "hooks": { "session-init": true, "prompt-reminder": true, "subagent-context": true }
}
```

- `locale`: `"auto"` (detect from input), `"vi"`, `"en"`
- `techLevel`: `"auto"`, `"newbie"`, `"basic"`, `"technical"`
- `qualityLevel`: `"mvp"`, `"production"`, `"enterprise"`

## Hook Configuration (Manual)

If auto-registration failed, add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "SessionStart": [{
      "matcher": "startup|resume|clear|compact",
      "hooks": [{"type": "command", "command": "node ~/.claude/hooks/awf/awf-session-init.cjs"}]
    }],
    "UserPromptSubmit": [{
      "hooks": [{"type": "command", "command": "node ~/.claude/hooks/awf/awf-prompt-reminder.cjs"}]
    }],
    "SubagentStart": [{
      "matcher": "*",
      "hooks": [{"type": "command", "command": "node ~/.claude/hooks/awf/awf-subagent-context.cjs"}]
    }]
  }
}
```

### How Hooks Config Works
- `settings.json` controls hook **registration** (whether Claude Code calls the hook)
- `.awf.json` `hooks` section controls hook **execution** (hook checks this and exits early if disabled)
- To fully disable a hook: set `false` in `.awf.json` (hooks respect this flag internally)

## Uninstall

```bash
rm -rf ~/.claude/commands/awf
rm -rf ~/.claude/hooks/awf
# Remove hook entries from ~/.claude/settings.json manually
```

## Key Features

- **Document Framework** — 4-tier document hierarchy (MUST/GOOD/NICE/CONTEXT) with structured templates for PRD, API specs, ADRs
- **Definition of Done** — Every phase requires explicit DoD; agents cannot self-declare completion
- **Subagent Protocol** — Mandatory delegation for testing, review, and finalization (no DIY)
- **Review Gates** — Blocking approval gates between phases (auto-approve in auto mode if score ≥ 9.5)
- **Auto Language Detection** — responds in user's language (Vietnamese, English, etc.)
- **Smart Proposal System** — AI proposes architecture, user approves
- **Phase-based Development** — break features into manageable phases
- **Scope Lock Protocol** — prevents scope creep during coding
- **Non-Tech Friendly Mode** — adapts language to user's technical level
- **Session State Management** — persist context across sessions
- **Zero Dependencies** — hooks use Node.js builtins only
- **Standalone** — works without any additional frameworks

## License

MIT
