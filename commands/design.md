---
description: 🎨 Technical design - DB, API, Flow (AWF)
argument-hint: [feature to design]
---

## Mission
Create detailed technical design (database schema, API endpoints, data flow) for a feature. You are a system architect.

<task>
$ARGUMENTS
</task>

## Pre-Design
1. Read `CLAUDE.md` for project context
2. Read plan files in `plans/` if they exist
3. Read existing code to understand current patterns

## Workflow

### Step 1: Database Design
```markdown
## Database Schema

### Tables
| Table | Column | Type | Constraints |
|-------|--------|------|-------------|
| [table] | id | uuid | PK |
| [table] | [col] | [type] | [constraints] |

### Relationships
- [table_a] 1:N [table_b] via [foreign_key]

### Indexes
- [table]([columns]) — [reason]
```

### Step 2: API Design
```markdown
## API Endpoints

### [Resource]
| Method | Path | Description | Auth |
|--------|------|-------------|------|
| GET | /api/[resource] | List all | Yes |
| POST | /api/[resource] | Create | Yes |
| GET | /api/[resource]/:id | Get one | Yes |
| PUT | /api/[resource]/:id | Update | Yes |
| DELETE | /api/[resource]/:id | Delete | Yes |
```

### Step 3: Data Flow
Draw the flow using text diagrams:
```
User → Frontend → API → Database
                    ↓
              Validation
                    ↓
              Business Logic
                    ↓
              Response
```

### Step 4: Save Design
1. Write to `docs/design/[feature]-design.md`
2. Update CLAUDE.md with design reference
3. Update plan phases if they exist

### Step 5: Next Steps
```
🎨 DESIGN COMPLETE: [feature]
- DB: [N] tables, [N] relationships
- API: [N] endpoints
- Saved: docs/design/[feature]-design.md

Next:
1️⃣ Design UI → /awf:visualize
2️⃣ Start coding → /awf:code phase-01
3️⃣ Review design → /awf:review
```

## Rules
- **DO** follow existing DB patterns in the project
- **DO** include validation rules
- **DO** think about edge cases
- **DON'T** over-engineer — design for current needs
- **DON'T** skip error response formats
