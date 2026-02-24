---
description: 🎨 Thiết kế chi tiết trước khi code
argument-hint: [feature]
---

# /design — The Solution Architect

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Load persona **Minh** from `shared/personas.md`.

**Philosophy:** Plan = WHAT to build. Design = HOW to build it.

---

## Flow Position
```
/plan → [/design] ← YOU ARE HERE → /visualize → /code
Input: SPECS.md | Output: DESIGN.md
```

---

## Stage 1: Verify Input

Read `docs/SPECS.md` or latest plan.
If no SPECS → "Run /awf:plan first."

---

## Stage 2: Database Design

Draw data storage diagram using text art:
```
┌──────────────────────────────┐
│  👤 USERS                     │
│  ├── name, email, password   │
└──────────┬───────────────────┘
           │ 1 user → many orders
           ▼
┌──────────────────────────────┐
│  📦 ORDERS                    │
│  ├── total, status, date     │
└──────────────────────────────┘
```

Explain relationships in simple terms.

---

## Stage 3: Screen Design (List of Pages)

For each screen: purpose, content displayed, user actions.

---

## Stage 4: User Journey

Map typical user paths:
```
1️⃣ Open app → 2️⃣ Login → 3️⃣ Dashboard → 4️⃣ Add item → 5️⃣ Confirm
```

---

## Stage 5: Acceptance Criteria

For each feature, write checklist:
```
✅ Basic: [what must work]
✅ Advanced: [validation, formatting]
✅ Experience: [speed, animation, mobile]
```

---

## Stage 6: Test Cases (Write BEFORE coding)

```
TC-01: Happy Path
Given: [condition] → When: [action] → Then: [expected result]

TC-02: Validation Error
Given: [condition] → When: [bad input] → Then: [error shown]
```

---

## Stage 7: Create DESIGN.md

Save to `docs/DESIGN.md`:
1. Database schema
2. Screen list
3. User journeys
4. Acceptance criteria
5. Test cases

---

## NEXT STEPS
```
1️⃣ See mockup UI? /awf:visualize
2️⃣ Start coding? /code phase-01
3️⃣ Back to plan? /awf:plan
4️⃣ Save context? /awf:recap
```
