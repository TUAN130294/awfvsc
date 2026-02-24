'use strict';

// AWF Prompt Reminder Hook — fires on UserPromptSubmit
// Injects concise plan/phase context. Fail-open.

try {
  const fs = require('fs');
  const path = require('path');
  const { isHookEnabled, readStdin } = require('./lib/awf-config.cjs');

  if (!isHookEnabled('prompt-reminder')) process.exit(0);

  const input = readStdin();
  const planPath = process.env.AWF_PLAN_PATH;
  const parts = [];

  // Read plan progress if available
  if (planPath) {
    const planMd = path.join(planPath, 'plan.md');
    if (fs.existsSync(planMd)) {
      try {
        const content = fs.readFileSync(planMd, 'utf8');
        // Extract phase progress table
        const lines = content.split('\n');
        const tableLines = lines.filter(l => /^\|.*\|$/.test(l.trim()) && /phase|setup|database|backend|frontend|integration|testing/i.test(l));
        if (tableLines.length) {
          const inProgress = tableLines.find(l => /In Progress|🟡/i.test(l));
          if (inProgress) {
            parts.push(`<awf-reminder>Active phase: ${inProgress.replace(/\|/g, '').trim()}</awf-reminder>`);
          }
        }
      } catch {}
    }
  }

  // Read session state
  const sessionPaths = [
    path.join(process.cwd(), '.claude', 'rules', 'session.json'),
    path.join(process.cwd(), 'CLAUDE.md')
  ];
  for (const sp of sessionPaths) {
    if (fs.existsSync(sp) && sp.endsWith('.json')) {
      try {
        const session = JSON.parse(fs.readFileSync(sp, 'utf8'));
        if (session.working_on && session.working_on.task) {
          parts.push(`<awf-reminder>Task: ${session.working_on.task} (${session.working_on.status || 'active'})</awf-reminder>`);
        }
        if (session.skipped_tests && session.skipped_tests.length > 0) {
          parts.push(`<awf-reminder>⚠️ ${session.skipped_tests.length} skipped test(s) — must fix before deploy</awf-reminder>`);
        }
        break;
      } catch {}
    }
  }

  if (parts.length) {
    process.stdout.write(parts.join('\n'));
  }
} catch (err) {
  process.stderr.write(`[awf-prompt-reminder] Error: ${err.message}\n`);
}
process.exit(0);
