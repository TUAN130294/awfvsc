# AWF Context Persistence for Claude Code

## How AWF saves "brain" in Claude Code

Unlike Antigravity (which uses KIs and .brain/), Claude Code uses these native mechanisms:

### 1. CLAUDE.md (Project Level)
- **Location:** `./CLAUDE.md` or `./.claude/CLAUDE.md`
- **Loaded:** Automatically at every session start
- **Use for:** Project conventions, commands, architecture, active work status
- **AWF creates/updates via:** `/awf:init`, `/awf:recap`, `/awf:code` (post-implementation)

### 2. /memory (Persistent Notes)
- **Command:** `/memory add "note"` or `/memory` to view/edit
- **Stored at:** `~/.claude/projects/<project>/memory/`
- **Use for:** Key decisions, progress tracking, quick facts
- **AWF saves via:** `/awf:code` (phase completion), `/awf:plan` (active plan)

### 3. .claude/rules/ (Path-Specific Rules)
- **Location:** `.claude/rules/*.md`
- **Loaded:** When working on files matching the rule's scope
- **Use for:** Code style per directory, API patterns, test conventions
- **AWF creates via:** `/awf:init`

### 4. Plan Files on Disk
- **Location:** `plans/[feature-name]/`
- **Contains:** plan.md + phase-XX files with task checklists
- **Use for:** Progress tracking, scope management
- **AWF creates via:** `/awf:plan`, updated by `/awf:code`

### 5. Design Docs
- **Location:** `docs/design/`, `docs/specs/`, `docs/BRIEF.md`
- **Use for:** Technical designs, specifications, brainstorm results
- **AWF creates via:** `/awf:design`, `/awf:brainstorm`

## Mapping: AWF Brain → Claude Code

| AWF (Antigravity) | Claude Code (VSC) |
|-------------------|-------------------|
| `.brain/context.md` | `CLAUDE.md` |
| `.brain/preferences.json` | `~/.claude/CLAUDE.md` |
| Knowledge Items (KIs) | `/memory` entries |
| `awf-auto-save` skill | Update CLAUDE.md after each phase |
| `awf-session-restore` skill | CLAUDE.md auto-loaded each session |
| `/save-brain` command | `/awf:recap` → CLAUDE.md + /memory |
| `/recap` command | Read CLAUDE.md + plans/ + /memory |
| `docs/SPECS.md` | `docs/specs/[feature].md` |

## Best Practices

1. **Keep CLAUDE.md under 200 lines** — it loads every session
2. **Use /memory for quick facts** — decisions, gotchas, active plan path
3. **Use .claude/rules/ for code patterns** — loaded only when relevant
4. **Store detailed info in docs/** — Claude reads on demand
5. **Update after each /awf:code phase** — keep progress current
