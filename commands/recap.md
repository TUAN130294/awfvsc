---
description: 📖 Save & restore project context (AWF)
argument-hint: [optional: what to save]
---

## Mission
Save current project context so future sessions can resume without re-reading everything.

## How Context Works in Claude Code
Claude Code has these native memory mechanisms:
1. **CLAUDE.md** (project root) — loaded every session
2. **~/.claude/CLAUDE.md** — global user memory
3. **.claude/rules/*.md** — modular rules per path
4. **/memory** command — quick persistent notes
5. **MEMORY.md** — auto-saved learnings
6. **~/.claude/projects/<project>/memory/** — project-specific memories

## Workflow

### Step 1: Gather Current State
Read and summarize:
1. What was accomplished this session
2. Active plan (if any in `plans/`)
3. Key decisions made
4. Current blockers or TODOs
5. Important file paths discovered

### Step 2: Update CLAUDE.md
Read existing `CLAUDE.md` in project root. Update or create with:

```markdown
# Project: [Name]

## Quick Commands
- Dev: `[command]`
- Build: `[command]`
- Test: `[command]`

## Architecture
- [Key architectural decisions]

## Active Work
- Current phase: [phase name/link]
- Status: [what's done, what's next]
- Key files: [important paths]

## Conventions
- [Naming patterns]
- [File structure patterns]
- [Error handling patterns]
```

### Step 3: Save via /memory
For quick facts, use `/memory add`:
- Active plan path
- Tech stack summary
- Critical gotchas discovered
- Environment setup notes

### Step 4: Create .claude/rules/ (if needed)
For path-specific rules:
```
.claude/rules/
├── api.md          — Rules for backend code
├── components.md   — Rules for UI components
├── database.md     — Rules for DB queries
└── testing.md      — Rules for test files
```

### Step 5: Confirm
```
💾 CONTEXT SAVED:
- CLAUDE.md: [updated/created]
- /memory entries: [N] added
- .claude/rules/: [N] files
- Next session: Claude will auto-load all of this
```

## Rules
- **DO** keep CLAUDE.md under 200 lines (concise = better)
- **DO** use bullet points, not paragraphs
- **DO** include runnable commands
- **DON'T** duplicate info already in code comments
- **DON'T** store sensitive data (keys, passwords)
