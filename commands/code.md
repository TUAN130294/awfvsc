---
description: 💻 Write code following a plan (AWF)
argument-hint: [phase or task to implement]
---

## Mission
Implement code for the specified phase or task. You are a senior developer following established patterns.

<task>
$ARGUMENTS
</task>

## Pre-Code Checklist
1. **Read the plan** — Find and read `plans/*/plan.md` or the specific phase file
2. **Check CLAUDE.md** — Follow project conventions
3. **Read existing code** — Understand patterns before writing new code
4. **Identify dependencies** — What must exist before this code works?

## Workflow

### Step 1: Scope Lock
State exactly what you will implement:
```
📋 SCOPE:
- Phase: [XX]
- Tasks: [list from phase file]
- Files: [files to create/modify]
- NOT doing: [explicitly exclude]
```

### Step 2: Implement
For each task in the phase:
1. Read related existing files first
2. Write code following project patterns
3. Mark task as done: `- [x] Task`
4. Update phase file status

### Step 3: Verify
- Check for syntax errors
- Run build/lint if available: `npm run build` or equivalent
- Run tests if they exist
- Verify no broken imports

### Step 4: Update Progress
1. Update phase status: `⬜ Pending` → `✅ Complete`
2. Update plan.md progress table
3. Run: `/memory add "Completed phase-XX: [summary]. Next: phase-YY"`

### Step 5: Next Steps
```
✅ Phase [XX] complete! ([N] tasks done)

Next:
1️⃣ Continue → /awf:code phase-[YY]
2️⃣ Run & test → /awf:run
3️⃣ Review → /awf:review
```

## Rules
- **DO** read before write — understand existing patterns
- **DO** implement one phase at a time
- **DO** update plan files after completing tasks
- **DO** commit-worthy chunks (not half-finished code)
- **DON'T** change files outside the phase scope
- **DON'T** install new dependencies without stating why
- **DON'T** skip error handling
- **DON'T** leave TODO comments — implement fully or note in plan
