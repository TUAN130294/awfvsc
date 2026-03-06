# Document Framework for AI Agent Development

> Feed the right docs at the right time. Structured > prose. Explicit > implicit.

## Document Tiers

| Tier | Documents | Purpose | Required For |
|------|-----------|---------|-------------|
| ① **MUST** | PRD, Tech Spec, API Spec | WHAT + HOW + Contract | All agents |
| ② **GOOD** | Functional Spec, Design Spec, ADR | Edge cases + UI + Past decisions | Coding & Full-stack |
| ③ **NICE** | Blueprint, UX Research, Test Plan, Runbook | Broader context | Complex projects |
| ④ **CONTEXT** | Vision/Strategy, MRD/Business Case | Background only | Extract principles, RAG |

## Feed Pipeline

```
System Prompt (Principles + Conventions)
  → Context Window (PRD + Tech Spec + API Spec)
    → Per-Task (Functional Spec + Design Spec + ADR)
      → RAG on-demand (Test Plan + Runbook + Blueprint)
        → Verify (Acceptance Criteria + Definition of Done)
```

## 6 Principles

1. **Structured over prose** — tables, bullets, JSON > paragraphs
2. **Explicit over implicit** — state every constraint directly
3. **Chunk by task** — feed only relevant sections, never dump everything
4. **Version everything** — date + version in every document
5. **Separate What and How** — PRD (what) ≠ Tech Spec (how), never mix
6. **Define Done** — every task needs a clear DoD; agents don't decide "done"

## Document Templates

### PRD Section (Minimum)

```markdown
## Feature: [Name]
Version: [X.Y] | Date: [YYYY-MM-DD]

### What
- [Core capability in 1 sentence]

### User Stories
| As a... | I want to... | So that... | Priority |
|---------|-------------|------------|----------|

### Constraints
- [Hard limits: performance, budget, compatibility]

### Out of Scope
- [Explicitly excluded items]

### Definition of Done
- [ ] [Measurable acceptance criteria]
- [ ] [Testable condition]
- [ ] [User-facing verification]
```

### API Contract (Minimum)

```markdown
| Endpoint | Method | Request | Response | Auth | Notes |
|----------|--------|---------|----------|------|-------|
```

### ADR (Architecture Decision Record)

```markdown
## ADR-[NNN]: [Title]
Date: [YYYY-MM-DD] | Status: [Accepted/Rejected/Superseded]

### Context
[Why this decision was needed]

### Decision
[What was decided]

### Consequences
[Trade-offs and implications]
```

## Phase-Level DoD

Every phase file (`phase-XX-*.md`) MUST end with:

```markdown
## Definition of Done
- [ ] [Specific, testable criteria]
- [ ] All tests passing
- [ ] No critical/high issues in code review
- [ ] Documentation updated (if applicable)
```

Agents MUST NOT claim a phase complete unless ALL DoD items are checked.
