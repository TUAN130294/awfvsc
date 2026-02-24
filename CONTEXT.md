# AWF Context Persistence for Claude Code

## State Files

| File | Location | Purpose |
|------|----------|---------|
| `session.json` | `.claude/rules/` | Current working state (updated per phase) |
| `session_log.txt` | `.claude/rules/` | Append-only activity log (updated per task) |
| `brain.json` | `.claude/rules/` | Static project knowledge (updated rarely) |
| `handover.md` | `.claude/rules/` | Context transfer when hitting limit |
| `CLAUDE.md` | Project root | Auto-loaded every session |
| `~/.claude/CLAUDE.md` | Home dir | User-level preferences |

## Workflow → File Mapping

| Workflow | Reads | Writes |
|----------|-------|--------|
| `/awf:init` | — | brain.json, README.md |
| `/awf:brainstorm` | BRIEF.md (if exists) | docs/BRIEF.md |
| `/awf:plan` | BRIEF.md, SPECS.md | plans/\*/plan.md + phase files, SPECS.md |
| `/awf:design` | SPECS.md | docs/DESIGN.md |
| `/awf:visualize` | DESIGN.md, SPECS.md | docs/design-specs.md |
| `/awf:code` | Phase files, session.json | session.json, session_log.txt, plan.md |
| `/awf:run` | session.json, package.json | session.json, session_log.txt |
| `/awf:debug` | Logs, code files | session.json (errors_encountered) |
| `/awf:test` | Test files | — |
| `/awf:deploy` | session.json (skipped_tests) | — |
| `/awf:audit` | All code files | docs/reports/audit_[date].md |
| `/awf:refactor` | Target files | — |
| `/awf:review` | All project files | docs/PROJECT_REVIEW_[date].md |
| `/awf:recap` | All state files | session.json, brain.json |
| `/awf:next` | session.json, plan.md | — |

## Hooks → Environment Variables

The `awf-session-init` hook sets these env vars automatically:

| Variable | Source | Example |
|----------|--------|---------|
| `AWF_PROJECT_TYPE` | Lock files, package.json | `single-repo`, `monorepo` |
| `AWF_PACKAGE_MANAGER` | Lock file detection | `npm`, `pnpm`, `yarn`, `bun` |
| `AWF_FRAMEWORK` | package.json deps | `next`, `react`, `vue`, `express` |
| `AWF_GIT_BRANCH` | `git rev-parse` | `main`, `feature/auth` |
| `AWF_PLAN_PATH` | Latest plans/ directory | `plans/260117-1430-orders` |
| `AWF_LOCALE` | .awf.json | `auto`, `vi`, `en` |
| `AWF_TECH_LEVEL` | .awf.json | `auto`, `newbie`, `technical` |
| `AWF_QUALITY_LEVEL` | .awf.json | `production`, `mvp`, `enterprise` |

## Config Resolution

```
1. Hardcoded defaults (in hooks/lib/awf-config.cjs)
2. Global ~/.awf.json (user-wide overrides)
3. Local .awf.json (project-level overrides)
→ Deep merge: objects recurse, arrays replace, local wins
```
