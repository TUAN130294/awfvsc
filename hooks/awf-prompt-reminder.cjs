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
  let parsedSession = null;
  const sessionPaths = [
    path.join(process.cwd(), '.claude', 'rules', 'session.json')
  ];
  for (const sp of sessionPaths) {
    if (fs.existsSync(sp) && sp.endsWith('.json')) {
      try {
        const session = JSON.parse(fs.readFileSync(sp, 'utf8'));
        parsedSession = session;
        if (session.working_on && session.working_on.task) {
          parts.push(`<awf-reminder>Task: ${session.working_on.task} (${session.working_on.status || 'active'})</awf-reminder>`);
        }
        if (session.working_on && session.working_on.dod && session.working_on.dod.length > 0) {
          const dodStatus = session.working_on.dod_status || [];
          const pending = session.working_on.dod.filter((_, i) => dodStatus[i] !== 'done');
          if (pending.length > 0) {
            parts.push(`<awf-reminder>⚠️ DoD pending (${pending.length}): ${pending.slice(0, 3).join('; ')}${pending.length > 3 ? '...' : ''}</awf-reminder>`);
          }
        }
        if (session.skipped_tests && session.skipped_tests.length > 0) {
          parts.push(`<awf-reminder>⚠️ ${session.skipped_tests.length} skipped test(s) — must fix before deploy</awf-reminder>`);
        }
        break;
      } catch {}
    }
  }

  // Read DoD from current phase file (reuse cached session)
  if (planPath) {
    try {
      const currentPhase = parsedSession && parsedSession.working_on && parsedSession.working_on.current_phase;
      if (currentPhase) {
        const phaseFiles = fs.readdirSync(planPath).filter(f => f.includes(currentPhase));
        if (phaseFiles.length) {
          const phaseContent = fs.readFileSync(path.join(planPath, phaseFiles[0]), 'utf8');
          const dodMatch = phaseContent.match(/## Definition of Done\n([\s\S]*?)(?=\n## |$)/);
          if (dodMatch) {
            const dodItems = dodMatch[1].trim().split('\n').filter(l => l.trim().startsWith('- ['));
            const unchecked = dodItems.filter(l => l.includes('[ ]'));
            if (unchecked.length > 0) {
              parts.push(`<awf-reminder>📋 Phase DoD remaining: ${unchecked.length} item(s)</awf-reminder>`);
            }
          }
        }
      }
    } catch {}
  }

  if (parts.length) {
    process.stdout.write(parts.join('\n'));
  }
} catch (err) {
  process.stderr.write(`[awf-prompt-reminder] Error: ${err.message}\n`);
}
process.exit(0);
