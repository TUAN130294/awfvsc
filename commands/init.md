---
description: ✨ Initialize new project (AWF)
argument-hint: [project name and description]
---

## Mission
Set up a new project with proper structure for Claude Code context management.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Project Setup
1. Create project directory if needed
2. Initialize with appropriate tooling (package.json, git, etc.)
3. Install core dependencies

### Step 2: Create CLAUDE.md
Create `CLAUDE.md` in project root:
```markdown
# [Project Name]
[One-line description]

## Quick Commands
- Dev: `npm run dev`
- Build: `npm run build`
- Test: `npm test`

## Tech Stack
- [Framework]: [version]
- [Database]: [version]
- [Key libraries]

## Project Structure
```
src/
├── [describe structure]
```

## Conventions
- [Style guide]
- [Naming conventions]
- [File organization]

## Current Status
- Phase: Initial setup
- Next: [what to do next]
```

### Step 3: Create .claude/ structure
```
.claude/
├── commands/           # Project-specific commands
├── rules/              # Path-specific rules
│   └── general.md      # General project rules
└── CLAUDE.md           # Alternative location
```

### Step 4: Initialize Git
```bash
git init
# Create .gitignore with sensible defaults
git add -A
git commit -m "Initial project setup"
```

### Step 5: Report
```
✨ PROJECT INITIALIZED: [name]

📁 Structure created
📝 CLAUDE.md configured
🔧 .claude/ rules set up
🔗 Git initialized

Next:
1️⃣ Plan features → /awf:plan [feature]
2️⃣ Start coding → /awf:code [task]
```
