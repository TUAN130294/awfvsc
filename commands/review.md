---
description: 👀 Code review & project overview (AWF)
argument-hint: [optional: specific PR or files to review]
---

## Mission
Review code changes or provide project overview for handover.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Gather Context
- Read CLAUDE.md for project conventions
- Check recent git changes: `git log --oneline -20`
- If reviewing specific changes: `git diff`

### Step 2: Review
For each file changed, check:
- [ ] Follows project conventions (from CLAUDE.md)
- [ ] Error handling present
- [ ] No hardcoded values
- [ ] Clear naming
- [ ] Appropriate comments (not too many, not too few)
- [ ] No leftover debug code
- [ ] Tests updated if needed

### Step 3: Feedback
```
👀 CODE REVIEW:

✅ Good:
- [What's done well]

⚠️ Suggestions:
- [file:line] — [suggestion]

🔴 Must Fix:
- [file:line] — [critical issue]

Overall: [APPROVE / REQUEST CHANGES]
```

### Step 4: Project Overview (for handover)
If doing full project review:
```
📊 PROJECT OVERVIEW:
- Purpose: [what it does]
- Tech: [stack]
- Structure: [key directories]
- Entry points: [main files]
- Running: [commands]
- Testing: [commands]
- Deploy: [process]
- Known issues: [list]
```
