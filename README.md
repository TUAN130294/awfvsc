# AWF for Claude Code VSC 🚀

**Antigravity Workflow Framework** — the complete development workflow system, adapted for **Claude Code** (CLI & VS Code Extension).

15 battle-tested workflows ported from AWF with **full methodology preserved**. Only the context/brain storage is adapted to use Claude Code's native mechanisms (`CLAUDE.md`, `/memory`, `.claude/rules/`).

## ⚡ Quick Install

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
# Windows
xcopy /E /Y awfvsc\commands "%USERPROFILE%\.claude\commands\awf\"
# Mac/Linux
cp -r awfvsc/commands/ ~/.claude/commands/awf/
```

## 📋 Workflows

### 🔄 Recommended Flow
```
/awf:init → /awf:brainstorm → /awf:plan → /awf:design → /awf:visualize → /awf:code → /awf:run → /awf:test → /awf:deploy
```

| Command | Description |
|---------|-------------|
| `/awf:init` | ✨ Initialize project with proper structure |
| `/awf:brainstorm` | 💡 Brainstorm & research ideas, create BRIEF.md |
| `/awf:plan` | 📝 Smart Proposal + Deep Interview + Phase Generation |
| `/awf:design` | 🎨 Technical design — DB schema, API, data flow |
| `/awf:visualize` | 🖼️ UI/UX mockup design with component library |
| `/awf:code` | 💻 Implement code with scope lock & safety protocols |
| `/awf:run` | ▶️ Start application with prerequisite checks |
| `/awf:debug` | 🐛 Systematic debugging with root cause analysis |
| `/awf:test` | 🧪 Testing strategy & execution |
| `/awf:deploy` | 🚀 Production deployment with checklist |
| `/awf:refactor` | 🔧 Code refactoring & cleanup |
| `/awf:audit` | 🔒 Security & code quality audit |
| `/awf:review` | 👀 Code review & project handover |
| `/awf:recap` | 📖 Save/restore context via CLAUDE.md & /memory |
| `/awf:next` | ➡️ Smart next-step suggestions |

## 🧠 Context Persistence

AWF workflows use **Claude Code's native mechanisms** instead of AWF's KI/brain system:

| AWF (Antigravity) | Claude Code (VSC) |
|-------------------|-------------------|
| `.brain/context.md` | `CLAUDE.md` (auto-loaded every session) |
| `.brain/preferences.json` | `~/.claude/CLAUDE.md` (user-level) |
| Knowledge Items (KIs) | `/memory` (persistent notes) |
| `awf-auto-save` skill | Update CLAUDE.md after each phase |
| `awf-session-restore` skill | CLAUDE.md auto-loaded each session |
| `/save-brain` | `/awf:recap` → CLAUDE.md + /memory |

See [CONTEXT.md](./CONTEXT.md) for detailed context management guide.

## 🎯 Key Features (Preserved from AWF)

- **Smart Proposal System** — AI proposes architecture, user approves
- **Deep Interview (3 Golden Questions)** — Structured requirement gathering
- **Phase-based Development** — Break features into manageable phases
- **Scope Lock Protocol** — Prevents scope creep during coding
- **Non-Tech Friendly Mode** — Adapts language to user's technical level
- **Resilience Patterns** — Auto-recovery from common errors
- **Vietnamese & English** — Bilingual support built-in
- **Battle-tested** — Used in production for 100k+ LOC projects

## 📦 What Gets Installed

Files are copied to `~/.claude/commands/awf/` (global Claude Code commands directory).

- ✅ Full AWF methodology preserved (100% content, only brain storage adapted)
- ✅ Does NOT modify existing settings or commands
- ✅ Works with both CLI and VS Code extension
- ✅ Standard Claude Code custom command format

## 🔗 Credits

Ported from the [Antigravity Workflow Framework (AWF)](https://github.com/maihde/awf).

## 📄 License

MIT
