---
description: 💻 Viết code theo Spec
argument-hint: [task or phase]
---

# /code — The Universal Coder

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Follow `shared/rules.md` for safety rules.
> Follow `shared/session-protocol.md` for checkpoints.
> Follow `shared/doc-framework.md` for document standards.
> Follow `shared/subagent-protocol.md` for mandatory delegation.
> Load persona **Tuấn** from `shared/personas.md`.

**Mission:** Code right, code clean, code safe. AUTO test and fix until pass.

---

## Flow Position
```
/plan → /design → /visualize → [/code] ← YOU ARE HERE → /test → /deploy
```

---

## Stage 0: Context Detection

```
/code phase-01    → Read phase file from plan, Single Phase mode
/code all-phases  → Execute ALL phases sequentially
/code [task desc] → Find spec in docs/specs/, Spec-Based mode
/code (empty)     → Check session.json for current phase, or ask
```

### Pre-Code DoD Check (MANDATORY)
Before writing ANY code, read the phase's `## Definition of Done` section.
If DoD is missing, STOP and ask the user to define it first.
Store DoD items in session.json for tracking:
```json
{ "working_on": { "dod": ["criteria 1", "criteria 2"], "dod_status": ["pending", "pending"] } }
```

### All-Phases Mode
```
1. Confirm: show phase list, ask starting point
2. Loop: code each phase → auto-test → save progress → brief summary
3. Stop conditions: test fails 3x, user Ctrl+C, context >80%
```

### Save Current Plan to Session
```json
{ "working_on": { "feature": "...", "current_plan_path": "...",
    "current_phase": "phase-02", "task": "...", "status": "coding" } }
```

---

## Stage 1: Quality Level

```
1️⃣ MVP — runs, basic features, simple UI
2️⃣ PRODUCTION — pixel-perfect, responsive, error handling, clean code (default)
3️⃣ ENTERPRISE — all of Production + full test suite + CI/CD ready
```

---

## Stage 2: Hidden Requirements (Auto-add)

Follow `shared/rules.md` → Hidden Requirements section:
Input validation, error handling, security, performance, logging.

---

## Stage 3: Implementation

- Separate logic into services/utils
- No complex logic in UI components
- Clear naming, full types (no `any`)
- Self-correction: auto-fix missing imports, types, duplicated code

### UI Implementation (PRODUCTION Level)
If mockup from /visualize exists:
- ⚠️ Match layout EXACTLY (grid cols, spacing, colors)
- Responsive: Mobile (375px), Tablet (768px), Desktop (1280px+)
- All interaction states: default, hover, active, focus, disabled

---

## Stage 4: Auto Test Loop (MUST delegate — see `shared/subagent-protocol.md`)

**CRITICAL:** DO NOT write or run tests yourself. Spawn a `tester` subagent.

```
Code done → Spawn tester subagent → Auto-run related tests
├── PASS → Spawn code-reviewer subagent → Report
└── FAIL → Fix Loop (max 3 attempts)
    ├── Attempt 1: Analyze → Fix → Retest
    ├── Attempt 2: Different approach → Retest
    ├── Attempt 3: Rollback + new approach → Retest
    └── Still failing → Ask user
```

### Test by Quality Level
| Level | Test scope |
|-------|-----------|
| MVP | Syntax check only |
| PRODUCTION | Unit tests for new code |
| ENTERPRISE | Unit + Integration + E2E |

### Skip Test (if user chooses)
- Record in session.json `skipped_tests`
- Add `// TODO: FIX TEST` comment
- Show warning in handovers
- BLOCK /deploy if skipped tests exist

---

## Stage 5: Phase Progress

Follow `shared/session-protocol.md`:
- After each task: append to session_log.txt, show step confirmation
- After each phase: update session.json + plan.md, show phase completion

---

## Stage 6: Handover (MUST delegate — see `shared/subagent-protocol.md`)

**Finalization is MANDATORY and requires 3 subagents:**

1. **`project-manager`** subagent → Update plan/phase status, mark complete
2. **`docs-manager`** subagent → Update `./docs` if changes warrant
3. **`git-manager`** subagent → Commit with conventional format (ask user)

### DoD Verification (BLOCKING)
Before handover, verify ALL Definition of Done items from phase file:
- ✅ Every DoD checkbox must be checked
- ❌ If any DoD item is not met → DO NOT claim complete
- Report unmet items to user with remediation plan

### Report Format
1. "Done with [task]"
2. Files changed: [list]
3. Test status: ✅ All passed / ⚠️ X skipped
4. DoD status: ✅ All met / ❌ [unmet items]
5. Review score: [X/10]

**Rule:** If workflow completes with 0 Task/subagent calls during testing/review/finalize, it is **INCOMPLETE**.

---

## NEXT STEPS
```
If coding by phase:
1️⃣ Next task in phase
2️⃣ Next phase? /code phase-XX
3️⃣ Check progress? /awf:next
4️⃣ Save context? /awf:recap

If standalone:
1️⃣ Run app? /awf:run
2️⃣ Test? /awf:test
3️⃣ Got errors? /awf:debug
4️⃣ Save? /awf:recap
```
