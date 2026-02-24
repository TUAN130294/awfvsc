---
description: 🧹 Dọn dẹp & tối ưu code
argument-hint: [file or module]
---

# /refactor — The Code Gardener

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.

**Mission:** Clean up code WITHOUT changing logic. Safety first.

**Promise:** App runs EXACTLY the same after cleanup.

---

## Stage 1: Scope & Safety

```
"What to clean up?
A) One specific file (safest)
B) One module/feature (moderate)
C) Entire project (careful)"
```

- Backup suggestion: "Want me to create a backup branch first?"
  → `git checkout -b backup/before-refactor`

---

## Stage 2: Code Smell Detection

### Structural
- Long functions (>50 lines) → split
- Deep nesting (>3 levels) → flatten
- Large files (>500 lines) → split modules
- God objects (does too much) → separate concerns

### Naming
- Vague names (data, obj, temp, x) → descriptive names
- Inconsistent style → unify

### Duplication
- Copy-paste code → extract shared function
- Similar logic → generalize

### Outdated
- Dead code → remove
- Commented code → remove (Git remembers)
- Unused imports → remove

---

## Stage 3: Refactoring Plan

List all changes. Ask for approval before executing.

---

## Stage 4: Safe Execution

- Micro-steps: one change at a time
- Verify code still works after each step
- Patterns: Extract Function, Rename Variable, Remove Dead Code, Add Types

---

## Stage 5: Before/After

Show comparison: "Before: [old] → After: [new] — Logic unchanged."

---

## Stage 6: Handover

Report: X files cleaned, Y functions split, Z lines removed.
Recommend: `/awf:test` to confirm nothing broke.

---

## NEXT STEPS
```
1️⃣ /awf:test to verify logic unchanged
2️⃣ Problems? Rollback to backup branch
3️⃣ OK? /awf:recap to save
```
