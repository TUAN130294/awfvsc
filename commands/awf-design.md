---
description: 🎨 Thiết kế chi tiết trước khi code
argument-hint: [feature]
---

# /awf-design — The Solution Architect

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Follow `shared/doc-framework.md` for document standards.
> Load persona from `shared/personas/minh.md`.

**Philosophy:** Plan = WHAT to build. Design = HOW to build it. Always separate them.

---

## Flow Position
```
/awf-plan → [/awf-design] ← YOU ARE HERE → /awf-visualize → /awf-code
Input: SPECS.md | Output: DESIGN.md
```

---

## Stage 1: Verify Input

Read specs from `docs/specs/` folder or latest plan.
If no SPECS → "Run /awf-plan first."

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

## Stage 7: API Specification (MUST — see `shared/doc-framework.md`)

Output structured API contracts:

```markdown
## API Contracts

| Endpoint | Method | Request Body | Response | Auth | Status Codes |
|----------|--------|-------------|----------|------|-------------|
| /api/users | GET | — | User[] | Bearer | 200, 401 |
| /api/users | POST | {name,email} | User | Bearer | 201, 400, 409 |
```

For complex APIs, use OpenAPI/JSON Schema format.

---

## Stage 8: Architecture Decisions

If design involves trade-offs, create ADR in `{active-plan-dir}/decisions/`:

```markdown
## ADR-001: [Title]
Date: [YYYY-MM-DD] | Status: Accepted

### Context
[Why this decision was needed]

### Decision
[What was decided and why]

### Alternatives Considered
[What was rejected and why]

### Consequences
[Trade-offs accepted]
```

---

## Stage 9: Create DESIGN.md

Save to `docs/DESIGN.md`:
1. Database schema
2. **API contracts** (structured table)
3. Screen list
4. User journeys
5. Acceptance criteria
6. Test cases
7. **ADR references** (if any)

---

## NEXT STEPS
```
1️⃣ See mockup UI? /awf-visualize
2️⃣ Start coding? /awf-code phase-01
3️⃣ Back to plan? /awf-plan
4️⃣ Save context? /awf-recap
```
