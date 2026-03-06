---
description: 🧠 Tóm tắt & phục hồi context
argument-hint: [scope]
---

# /awf-recap — The Memory Retriever

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Follow `shared/session-protocol.md` for state file handling.

**Mission:** Help user "remember everything" in 2 minutes after returning to a project.

**Principle:** Read everything, summarize simply.

---

## Stage 1: Fast Context Load

### Load Order:
See `shared/session-protocol.md` Read Order section.

### If no state files:
- Scan: docs/specs/ (in-progress specs), package.json (tech stack)
- Git: `git log -10 --oneline`, `git status`
- Suggest: "No memory files yet. Run /awf-recap at end of session to create them!"

---

## Stage 2: Executive Summary

### With session.json (Fast Mode):
```
📋 {project.name} | {type} | {status}
🛠️ Tech: {frontend} + {backend} + {database}
📊 Stats: {X} tables | {Y} APIs | {Z} features

📍 Working on: {feature}
   └─ Task: {task} ({status})

⏭️ Pending: {pending_tasks}
⚠️ Gotchas: {gotchas}
🔧 Recent decisions: {decisions}
❌ Skipped tests: {skipped_tests} ← MUST fix before deploy!
🕐 Last saved: {timestamp}
```

### Without session.json (Legacy Mode):
```
📋 PROJECT: [Name]
🎯 What it does: [1-2 sentences]
📍 Last working on: [feature/module]
📂 Key files: [list with roles]
⏭️ Next tasks: [list]
⚠️ Notes: [pending bugs, deadlines]
```

---

## Stage 3: Confirmation & Direction

```
"What do you want to do?
A) Continue where I left off → /awf-code or /awf-debug
B) Start something new → /awf-plan
C) Check everything first → /awf-audit"
```

---

## Tips
- Use `/awf-recap` every morning before starting
- Use `/awf-recap` every evening to save progress for tomorrow
