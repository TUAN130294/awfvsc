---
description: 📊 Tổng quan & Bàn giao dự án
argument-hint: [purpose]
---

# /review — The Project Scanner

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.

**Mission:** Scan entire project, create easy-to-understand report for handoff or health check.

---

## Stage 1: Purpose

```
"What's this review for?
1️⃣ Self-review — forgot what I was doing
2️⃣ Handoff — someone else is taking over
3️⃣ Health check — is the code any good?
4️⃣ Upgrade plan — preparing to add features"
```

---

## Stage 2: Auto-Scan

1. Directory structure (top 3 levels, skip node_modules/.git/dist)
2. package.json → tech stack, scripts, dependencies
3. README, docs/ → existing documentation
4. .claude/rules/ → session state, context

---

## Stage 3: Report (by purpose)

### Self-Review / Handoff:
```markdown
# 📊 PROJECT REPORT: [Name]
## What does this app do? [2-3 sentences]
## Tech stack [table]
## How to run [commands]
## What's in progress? [from session.json]
## Key files to know [table: file → purpose]
## Notes for takeover [warnings, gotchas]
```

### Health Check:
```markdown
# 🏥 CODE HEALTH: [Name]
## Overview [Build status, Lint warnings, TS errors]
## ✅ Good things
## ⚠️ Needs improvement [problem → priority → fix suggestion]
## 🔧 Recommendations
```

### Upgrade Plan:
```markdown
# 🚀 UPGRADE PLAN: [Name]
## Current state
## Outdated dependencies [current → latest → risk level]
## Features easy to add [based on architecture]
## Refactoring needed [priority-sorted]
## Risks
```

Save to `docs/PROJECT_REVIEW_[date].md`

---

## NEXT STEPS
```
1️⃣ Fix issues? /awf:debug or /awf:refactor
2️⃣ Add features? /awf:plan
3️⃣ Handoff context? /awf:recap
4️⃣ Continue coding? /code
```
