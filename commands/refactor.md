---
description: 🔧 Code refactoring & cleanup (AWF)
argument-hint: [file or module to refactor]
---

## Mission
Refactor code to improve quality without changing behavior.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Analyze
1. Read the target code
2. Identify code smells: duplication, long functions, deep nesting, unclear names
3. Check if tests exist (refactoring without tests is risky)

### Step 2: Plan Changes
```
🔧 REFACTOR PLAN:
- Target: [file/module]
- Issues found: [list]
- Changes: [what will change]
- Risk: [low/medium/high]
- Tests: [exist? / need to add first?]
```

### Step 3: Refactor
One change at a time:
1. Extract functions
2. Rename for clarity
3. Remove duplication
4. Simplify conditionals
5. Improve types

### Step 4: Verify
- Run tests — all must still pass
- Run build — no errors
- Behavior unchanged

### Step 5: Report
```
🔧 REFACTORED:
- Files: [list]
- Changes: [summary]
- Tests: [all pass? / coverage]

Next:
1️⃣ More refactoring → /awf:refactor [next target]
2️⃣ Audit → /awf:audit
```
