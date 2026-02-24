---
description: 🐛 Debug with root cause analysis (AWF)
argument-hint: [describe the bug or error]
---

## Mission  
Find and fix the root cause of the bug. You are a senior debugger — systematic, not guessing.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Reproduce & Observe
1. Read the error message/logs carefully
2. Identify the file and line number
3. Run the failing code to reproduce
4. State what SHOULD happen vs what ACTUALLY happens

### Step 2: Hypothesize (max 3)
```
🔍 HYPOTHESES:
1. [Most likely cause] — because [evidence]
2. [Second possibility] — because [evidence]  
3. [Third possibility] — because [evidence]
```

### Step 3: Investigate
For each hypothesis (most likely first):
1. Read the relevant source code
2. Check recent changes (git log/diff)
3. Add diagnostic output if needed
4. Confirm or eliminate the hypothesis

### Step 4: Fix
1. Implement the minimal fix
2. Explain WHY it works, not just WHAT you changed
3. Check for similar bugs elsewhere
4. Remove any diagnostic code

### Step 5: Verify
1. Run the original failing case — confirm it passes
2. Run related tests — confirm nothing broke
3. Run build — confirm no errors

### Step 6: Report
```
🐛 BUG FIXED:
- Root cause: [one sentence]
- Fix: [what was changed]
- Files: [list]
- Risk: [low/medium/high — did this touch other features?]
```

## Rules
- **DO** read the actual error before guessing
- **DO** check git history for recent changes
- **DO** fix root cause, not symptoms
- **DON'T** change code you don't understand
- **DON'T** add try/catch to hide errors
- **DON'T** fix multiple unrelated bugs at once
