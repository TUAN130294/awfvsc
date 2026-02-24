# AWF for Claude Code VSC 🚀

**Antigravity Workflow Framework** — optimized for **Claude Code** (CLI & VS Code Extension).

15 production-tested workflows that give Claude Code structured development processes — plan, code, debug, deploy, and more. Built on Claude Code's native context management (`CLAUDE.md`, `/memory`, `.claude/rules/`).

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

### 🔄 Development Flow
```
/awf:init → /awf:brainstorm → /awf:plan → /awf:design → /awf:code → /awf:run → /awf:test → /awf:deploy
```

| Command | Description | Tokens |
|---------|-------------|--------|
| `/awf:init` | ✨ Initialize project with CLAUDE.md & .claude/ structure | ~600 |
| `/awf:brainstorm` | 💡 Explore ideas, research, create BRIEF.md | ~700 |
| `/awf:plan` | 📝 Plan features with Smart Proposal & phase generation | ~900 |
| `/awf:design` | 🎨 Technical design — DB schema, API, data flow | ~800 |
| `/awf:visualize` | 🖼️ UI/UX wireframes & component specs | ~600 |
| `/awf:code` | 💻 Implement code following plan phases | ~800 |
| `/awf:run` | ▶️ Start app with prerequisite checks | ~500 |
| `/awf:debug` | 🐛 Systematic root cause analysis | ~700 |
| `/awf:test` | 🧪 Write & run tests | ~500 |
| `/awf:deploy` | 🚀 Production deployment with checklist | ~500 |
| `/awf:refactor` | 🔧 Code cleanup without behavior changes | ~500 |
| `/awf:audit` | 🔒 Security & code quality audit | ~600 |
| `/awf:review` | 👀 Code review & project handover | ~500 |
| `/awf:recap` | 📖 Save context using Claude Code native features | ~800 |
| `/awf:next` | ➡️ Smart next-step suggestions | ~500 |

## 🧠 Context Management

AWF-VSC uses **Claude Code's native mechanisms** for context persistence:

| Mechanism | What it does | When AWF uses it |
|-----------|-------------|-----------------|
| `CLAUDE.md` | Project instructions loaded every session | `/awf:init`, `/awf:recap` create/update |
| `/memory` | Persistent key-value notes | `/awf:code`, `/awf:plan` save progress |
| `.claude/rules/` | Path-specific rules | `/awf:init` sets up structure |
| `plans/` folder | Phase-based tracking on disk | `/awf:plan` creates, `/awf:code` updates |
| `docs/` folder | Design docs & specs | `/awf:design`, `/awf:brainstorm` save here |

### Anti-Hallucination Strategy
Every workflow includes:
1. **Read before write** — always check existing code/context first
2. **Scope lock** — explicitly state what WILL and WON'T be done
3. **Plan reference** — check plan files to stay on track
4. **Progress tracking** — update plan/CLAUDE.md after each phase
5. **Compact prompts** — workflows average ~650 tokens (vs 4000+ in unoptimized versions)

## 🎯 Usage Examples

```bash
# Initialize a new project
/awf:init My todo app with auth

# Plan a feature
/awf:plan Add user authentication with Google OAuth

# Design the database
/awf:design User auth tables and session management

# Start coding
/awf:code phase-01

# Something broken?
/awf:debug Login returns 401 even with valid credentials

# Save your progress
/awf:recap

# What should I do next?
/awf:next
```

## 📦 What Gets Installed

Files are copied to `~/.claude/commands/awf/` (global Claude Code commands directory).

- ✅ Does NOT modify existing settings or commands
- ✅ Does NOT conflict with other slash commands
- ✅ Works with both CLI and VS Code extension
- ✅ Uses standard Claude Code command format

## 🔗 Credits

Based on the [Antigravity Workflow Framework (AWF)](https://github.com/maihde/awf) — rewritten and optimized for Claude Code's context model.

## 📄 License

MIT
