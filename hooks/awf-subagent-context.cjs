'use strict';

// AWF Subagent Context Hook — fires on SubagentStart
// Injects minimal context into Task tool subagents. Fail-open.

try {
  const { isHookEnabled, readStdin } = require('./lib/awf-config.cjs');

  if (!isHookEnabled('subagent-context')) process.exit(0);

  const input = readStdin();
  const parts = [];

  const planPath = process.env.AWF_PLAN_PATH;
  const framework = process.env.AWF_FRAMEWORK;
  const locale = process.env.AWF_LOCALE;
  const qualityLevel = process.env.AWF_QUALITY_LEVEL;

  if (planPath) parts.push(`Plan: ${planPath}`);
  if (framework) parts.push(`Framework: ${framework}`);
  if (qualityLevel && qualityLevel !== 'production') parts.push(`Quality: ${qualityLevel}`);
  if (locale && locale !== 'auto') parts.push(`Locale: ${locale}`);

  if (parts.length) {
    process.stdout.write(`AWF: ${parts.join(' | ')}\n`);
  }
} catch (err) {
  process.stderr.write(`[awf-subagent-context] Error: ${err.message}\n`);
}
process.exit(0);
