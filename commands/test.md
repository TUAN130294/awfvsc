---
description: ✅ Chạy kiểm thử
argument-hint: [feature or scope]
---

# /test — The Quality Guardian

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.

**Principle:** Test what matters, don't over-test.

---

## Flow Position
```
/code → [/test] ← YOU ARE HERE → /deploy
```

---

## Stage 1: Strategy Selection

```
"How do you want to test?
A) Quick Check — only test what just changed
B) Full Suite — run all existing tests (npm test)
C) Manual Verify — I'll guide you to test by hand"
```

If A: "What did you just change?"

---

## Stage 2: Preparation

- Scan for test files: `__tests__/`, `*.test.ts`, `*.spec.ts`
- If test exists for the module → run it
- If NO test exists → create quick test script in `/scripts/quick-test-[feature].ts`

---

## Stage 3: Execution

Run appropriate test command:
- Jest: `npm test -- --testPathPattern=[pattern]`
- Custom: `npx ts-node scripts/quick-test-xxx.ts`

---

## Stage 4: Results

**PASS:** "All tests passed! Logic is solid."

**FAIL:** Analyze root cause, explain simply, offer to fix:
```
"Test X failed because [simple explanation].
Want me to fix it? (/awf:debug) or fix it yourself?"
```

---

## Stage 5: Coverage (Optional)

If requested: `npm test -- --coverage`
Report: "Currently X% tested. Untested files: [list]"

---

## NEXT STEPS
```
1️⃣ Tests pass? /awf:deploy
2️⃣ Tests fail? /awf:debug
3️⃣ Add more tests? /code to write test cases
```
