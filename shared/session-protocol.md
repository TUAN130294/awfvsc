# Session State Protocol

## State Files

| File | Purpose | Update frequency | Tokens |
|------|---------|-----------------|--------|
| `session.json` | Current working state | Per PHASE completion | ~450 |
| `session_log.txt` | Append-only activity log | Per TASK completion | ~20 |
| `brain.json` | Static project knowledge | Rarely (end of session) | ~400 |
| `handover.md` | Context transfer on limit | When context > 80% | ~500 |

Location: `CLAUDE.md + .claude/rules/` or project root `.claude/rules/`

---

## session.json Structure
```json
{
  "working_on": {
    "feature": "Order Management",
    "current_plan_path": "plans/260117-1430-orders/",
    "current_phase": "phase-02",
    "task": "Implement database schema",
    "status": "coding"
  },
  "pending_tasks": [],
  "errors_encountered": [],
  "skipped_tests": [],
  "decisions_made": [],
  "updated_at": "2026-01-17T14:30:00Z"
}
```

## session_log.txt Format (Append-only)
```
[HH:MM] START phase-01-setup
[HH:MM] DONE task: Create folder structure
[HH:MM] DECISION: Use Prisma (reason: type-safe)
[HH:MM] END phase-01-setup ✅
[HH:MM] RUN SUCCESS: App running at http://localhost:3000
[HH:MM] RUN FAILED: EADDRINUSE port 3000
```

## brain.json Structure
```json
{
  "project": { "name": "", "description": "", "created_at": "" },
  "tech_stack": { "frontend": {}, "backend": {}, "database": {} },
  "features": [],
  "decisions": [],
  "gotchas": []
}
```

---

## Read Order (for /recap, /next)
```
1. handover.md → if exists, use it, then delete after resume
2. session.json + session_log.txt (last 20 lines) → primary state
3. brain.json → static project knowledge
4. Fallback: git log + file scan
```

## Write Rules

| Trigger | Action |
|---------|--------|
| After each TASK | Append 1 line to session_log.txt |
| After each PHASE | Update session.json + plan.md progress |
| Before user input | Append "WAITING: [question]" to log |
| Context > 80% | Write handover.md with full state |
| End of session | Update brain.json if new knowledge |

---

## Step Confirmation Protocol

### After each TASK:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ DONE: [Task name]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Files:
  + path/to/new-file.ts (new)
  ~ path/to/modified.ts (modified)

Progress: ████████░░ 80% (4/5 tasks)

→ Next task? (y/adjust/stop)
```

### After each PHASE:
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎉 PHASE XX COMPLETE!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Tasks: X/X done
✅ Tests: Passed
📁 Files: X created, Y modified

Total progress: ██░░░░░░░░ 17% (1/6 phases)

Next?
1️⃣ Continue to next phase
2️⃣ Save and rest (/awf:recap)
3️⃣ Review this phase
```

---

## Skipped Tests Tracking
```json
{
  "skipped_tests": [
    { "test": "create-order.test.ts", "reason": "Fix later", "date": "..." }
  ]
}
```
- Add `// TODO: FIX TEST` comment in code
- Show warning in every handover
- BLOCK /deploy if skipped tests exist
- Remind at start of each session via /recap
