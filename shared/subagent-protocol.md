# Subagent Protocol

> Delegate, don't DIY. Mandatory subagents ensure quality at every gate.

## Mandatory Subagents by Phase

| Phase | Subagent | Required? | Role |
|-------|----------|-----------|------|
| Research | `researcher` | Optional (skip in fast/code) | Gather context, prior art |
| Scout | `scout` | Optional (skip in code) | Analyze codebase, find patterns |
| Plan | `planner` | Optional (skip in code) | Architecture decisions |
| UI Work | `ui-ux-designer` | If frontend | Component design, accessibility |
| **Testing** | `tester` | **MUST** | Write & run tests |
| **Review** | `code-reviewer` | **MUST** | Quality, security, patterns |
| **Finalize** | `project-manager` | **MUST** | Update plan status |
| **Finalize** | `docs-manager` | **MUST** | Update documentation |
| **Finalize** | `git-manager` | **MUST** | Commit with conventional format |

**CRITICAL:** Steps marked MUST cannot be skipped or self-performed. The main agent MUST delegate to subagents.

## Review Gates

```
Research → [GATE: approve findings] → Plan → [GATE: approve plan]
  → Code → [GATE: approve code] → Test → [GATE: approve results] → Finalize
```

### Gate Behavior by Mode

| Mode | Gates | Auto-approve criteria |
|------|-------|-----------------------|
| interactive | **Blocking** — waits for human | N/A |
| auto | Auto-pass if score ≥ 9.5 AND 0 critical issues | Review score + zero criticals |
| fast | **Blocking** — waits for human | N/A |

### Gate Checklist

At each gate, verify:
1. ✅ All phase DoD items checked (see `doc-framework.md`)
2. ✅ No critical or high-severity issues
3. ✅ Subagent reports reviewed
4. ✅ Scope has not crept beyond original plan

## Task Tracking

Use Claude's Task tool for subagent management:

```
TaskCreate  → Spawn subagent with specific task
TaskGet     → Check subagent progress
TaskUpdate  → Mark complete or add notes
TaskList    → Overview all active tasks
```

**Rule:** If a workflow completes with 0 Task tool calls during testing/review/finalize, it is **INCOMPLETE**.

## Subagent Context Injection

The `awf-subagent-context` hook automatically provides:
- Active plan path
- Framework detected
- Quality level
- Locale preference

Subagents inherit this context — no manual re-briefing needed.

## Error Escalation

```
Subagent fails → Retry once with refined prompt
  → Still fails → Escalate to human with:
    - What was attempted
    - Error details
    - Suggested alternatives
```
