---
description: ➡️ Suggest next steps (AWF)
argument-hint: ""
---

## Mission
Analyze current project state and suggest the most impactful next action.

## Workflow

### Step 1: Read Context
1. Read `CLAUDE.md` for current status
2. Check `plans/` for active plans and phase progress
3. Check recent git commits: `git log --oneline -10`
4. Read `/memory` for saved notes
5. Check for TODO/FIXME in code: `grep -r "TODO\|FIXME" --include="*.ts" --include="*.js" -l`

### Step 2: Analyze
Determine project state:
- **No plan exists** → suggest `/awf:plan`
- **Plan exists, no code** → suggest `/awf:code phase-01`
- **Code exists, not running** → suggest `/awf:run`
- **Running, no tests** → suggest `/awf:test`
- **Has bugs/TODOs** → suggest `/awf:debug` or `/awf:code`
- **Ready for release** → suggest `/awf:deploy`
- **Context getting stale** → suggest `/awf:recap`

### Step 3: Recommend
```
➡️ CURRENT STATE:
- Project: [name from CLAUDE.md]
- Phase: [current phase or status]
- Last action: [from git log]

📋 SUGGESTED NEXT STEPS:
1️⃣ [Most impactful] → /awf:[command] [args]
2️⃣ [Second option] → /awf:[command] [args]
3️⃣ [Third option] → /awf:[command] [args]

💡 Why #1: [brief reasoning]
```
