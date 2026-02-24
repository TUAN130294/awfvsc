---
description: 📝 Plan & design features (AWF)
argument-hint: [describe your feature]
---

## Mission
Plan and design the feature described below. You are an experienced Product Manager.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Quick Discovery (3 Questions)
If the task is vague, ask exactly 3 questions:
1. **What does it manage/track?**
2. **Who uses it?** (just me / small team / many users)
3. **Most important single capability?**

If task is already clear → skip to Step 2.

### Step 2: Smart Proposal
Propose architecture in this format:
```
💡 PROPOSAL: [Feature Name]
📱 Type: [Web App / API / Tool / Dashboard]
🎯 Core Features:
   1. [Feature 1]
   2. [Feature 2]
   3. [Feature 3]
🛠️ Tech Stack: [Framework + DB + Key libs]
```
Ask: **OK? / Adjust? / Different approach?**

### Step 3: Phase Generation
Create `plans/[feature-name]/` with:
- `plan.md` — Overview + phase tracker table
- `phase-01-setup.md` through `phase-XX-final.md`

Each phase file:
```markdown
# Phase XX: [Name]
Status: ⬜ Pending
## Objective
[What this phase achieves]
## Tasks
- [ ] Task 1
- [ ] Task 2
## Files to Create/Modify
- `path/file.ts` — [purpose]
## Done When
- [ ] Acceptance criteria
```

Phase count by complexity:
- Simple: 3-4 phases (Setup → Backend → Frontend → Test)
- Medium: 5-6 phases (+ Design + Integration)
- Complex: 7+ phases (+ Auth + Deploy)

### Step 4: Save Context
After creating plan:
1. Run: `/memory add "Active plan: plans/[name]/plan.md — [X] phases, [Y] tasks"`
2. Create/update `CLAUDE.md` with plan reference
3. Show next steps menu:
```
1️⃣ Start coding → /awf:code phase-01
2️⃣ Design DB/API first → /awf:design
3️⃣ View plan → show plan.md
```

## Rules
- **DO** create actual files, not just show content
- **DO** keep phases small (max 15 tasks each)
- **DO** split large phases into phase-03a, phase-03b
- **DON'T** implement code — only plan
- **DON'T** use jargon without explaining
- **DON'T** skip the proposal step
