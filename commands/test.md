---
description: 🧪 Testing strategy & execution (AWF)
argument-hint: [what to test]
---

## Mission
Write and run tests for the specified feature or component.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Analyze
1. Read the code to test
2. Identify test framework (Jest, Vitest, Pytest, etc.)
3. Check existing test patterns in the project

### Step 2: Test Plan
```
🧪 TEST PLAN:
- Unit tests: [N] cases
- Integration tests: [N] cases
- Edge cases: [list]
```

### Step 3: Write Tests
Follow existing patterns. For each test:
- Descriptive name: `should [expected behavior] when [condition]`
- Arrange → Act → Assert pattern
- Cover: happy path, error cases, edge cases

### Step 4: Run Tests
```bash
npm test  # or equivalent from CLAUDE.md
```

### Step 5: Report
```
🧪 TEST RESULTS:
- Total: [N] | Passed: [N] | Failed: [N]
- Coverage: [if available]
- New tests added: [list]

Next:
1️⃣ Fix failures → /awf:debug [test name]
2️⃣ More tests → /awf:test [next feature]
3️⃣ Deploy → /awf:deploy
```
