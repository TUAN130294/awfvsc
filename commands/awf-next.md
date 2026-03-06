---
description: ➡️ Không biết làm gì tiếp?
argument-hint: [context]
---

# /awf-next — The Compass

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.

**Mission:** Analyze current state, suggest the BEST next step.

---

## Workflow Chain
```
/awf-init → /awf-plan → /awf-design → /awf-visualize → /awf-code → /awf-test → /awf-deploy → /awf-recap
         │                                 │
         └→ /awf-brainstorm (if unclear)       └→ /awf-debug (if errors)
```

---

## Stage 1: Quick Status Check (AUTO — don't ask user)

### Read Context:
```
1. session.json → working_on, pending_tasks, errors
2. session_log.txt → last 20 lines
3. plans/*/plan.md → phase progress
4. docs/ → SPECS.md, DESIGN.md existence
5. Fallback: git status, git log -5, scan for TODO/FIXME
```

### Detect Phase:
- Nothing exists → suggest /awf-brainstorm or /awf-plan
- Has SPECS, no DESIGN → suggest /awf-design
- Has DESIGN, no code → suggest /awf-visualize or /awf-code
- Coding in progress → suggest /awf-code (continue) or /awf-test
- Has errors → suggest /awf-debug
- Tests pass → suggest /awf-deploy
- End of session → suggest /awf-recap

---

## Stage 2: Smart Recommendation

### With Plan + Phases:
```
🧭 PROJECT PROGRESS

📁 Plan: `plans/260117-coffee-shop/`
📊 Progress: ████████░░░░ 40% (2/5 phases)

| Phase | Status |
|-------|--------|
| 01 Setup | ✅ Done |
| 02 Database | ✅ Done |
| 03 Backend | 🟡 In Progress (3/8 tasks) |
| 04 Frontend | ⬜ Pending |
| 05 Testing | ⬜ Pending |

📍 Current: Phase 03 — Backend API
   └─ Task: Implement /api/orders endpoint

Next:
1️⃣ Continue Phase 3? /awf-code phase-03
2️⃣ View phase details?
3️⃣ Save progress? /awf-recap
```

### Without Plan:
Suggest based on detected state (see Detect Phase above).

---

## Stage 3: Personalized Tips

- Long time since last commit → "Remember to commit regularly!"
- Many TODOs in code → "You have X TODOs to address"
- End of day → "Remember /awf-recap to save for tomorrow!"

---

## Output Format
```
🧭 WHERE YOU ARE: [current state]
➡️ WHAT TO DO: [specific suggestion with command]
💡 TIP: [bonus advice if applicable]
```

---

## Rules
- DON'T ask user lots of questions — analyze and suggest
- Suggestions must be SPECIFIC with exact commands to type
- Friendly, simple, no jargon
