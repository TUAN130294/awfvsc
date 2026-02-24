# AWF for Claude Code VSC 🚀

**Antigravity Workflow Framework** ported for **Claude Code** (CLI & VS Code Extension).

15 production-tested workflows to supercharge your AI-assisted development — plan, code, debug, deploy, and more.

## ⚡ Quick Install

### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.ps1 | iex
```

### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/TUAN130294/awfvsc/main/install.sh | sh
```

### Manual Install
```bash
git clone https://github.com/TUAN130294/awfvsc.git
# Windows
xcopy /E /Y awfvsc\commands "%USERPROFILE%\.claude\commands\awf\"
# Mac/Linux
cp -r awfvsc/commands/ ~/.claude/commands/awf/
```

## 📋 Available Workflows

| Command | Description |
|---------|-------------|
| `/awf:plan` | 📝 Plan & design features with Smart Proposal |
| `/awf:code` | 💻 Write code safely with phase tracking |
| `/awf:design` | 🎨 Technical design (DB, API, Flow) |
| `/awf:visualize` | 🖼️ UI/UX mockup design |
| `/awf:debug` | 🐛 Deep debugging with root cause analysis |
| `/awf:test` | 🧪 Testing strategy & execution |
| `/awf:run` | ▶️ Run application |
| `/awf:deploy` | 🚀 Deploy to production |
| `/awf:brainstorm` | 💡 Brainstorm & research ideas |
| `/awf:recap` | 📖 Summarize project context |
| `/awf:refactor` | 🔧 Code refactoring & cleanup |
| `/awf:audit` | 🔒 Security & code audit |
| `/awf:review` | 👀 Code review & handover |
| `/awf:init` | ✨ Initialize new project |
| `/awf:next` | ➡️ Suggest next steps |

## 🎯 Usage

In Claude Code (terminal or VS Code extension):

```
/awf:plan Build a todo app with authentication
/awf:code Implement user login API
/awf:debug Why is the database connection timing out
/awf:deploy Push to production on Vercel
```

## 🔄 Recommended Flow

```
/awf:init → /awf:brainstorm → /awf:plan → /awf:design → /awf:code → /awf:run → /awf:test → /awf:deploy
```

## 🌟 Features

- **Smart Proposal System** — AI suggests architecture, you approve
- **Phase-based Development** — Break features into manageable phases
- **Non-Tech Friendly** — Adapts language to your technical level
- **Vietnamese & English** — Bilingual support built-in
- **Battle-tested** — Used in production for 100k+ LOC projects

## 📦 What Gets Installed

Files are copied to `~/.claude/commands/awf/` (global Claude Code commands directory).

This does NOT modify any existing Claude Code settings or commands.

## 🔗 Credits

Built on top of the [Antigravity Workflow Framework (AWF)](https://github.com/maihde/awf) — a comprehensive AI-native development framework.

## 📄 License

MIT
