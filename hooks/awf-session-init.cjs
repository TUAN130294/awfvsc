'use strict';

// AWF Session Init Hook — fires on SessionStart (startup|resume|clear|compact)
// Zero dependencies. Fail-open.

try {
  const { loadConfig, writeEnv, detectProject, isHookEnabled, readStdin, findLatestPlan } = require('./lib/awf-config.cjs');

  if (!isHookEnabled('session-init')) process.exit(0);

  const input = readStdin();
  const cfg = loadConfig();
  const project = detectProject();
  const planPath = findLatestPlan();

  // Write env vars
  writeEnv('AWF_PROJECT_TYPE', project.type);
  writeEnv('AWF_PACKAGE_MANAGER', project.packageManager);
  writeEnv('AWF_FRAMEWORK', project.framework);
  writeEnv('AWF_GIT_BRANCH', project.gitBranch);
  writeEnv('AWF_GIT_ROOT', project.gitRoot);
  writeEnv('AWF_NODE_VERSION', project.nodeVersion);
  writeEnv('AWF_PYTHON_VERSION', project.pythonVersion);
  writeEnv('AWF_LOCALE', cfg.locale);
  writeEnv('AWF_TECH_LEVEL', cfg.techLevel);
  writeEnv('AWF_QUALITY_LEVEL', cfg.qualityLevel);
  writeEnv('AWF_PLAN_PATH', planPath);

  // Output context summary
  const parts = [];
  parts.push('## AWF Context');

  if (planPath) {
    const planName = require('path').basename(planPath);
    parts.push(`Plan: \`${planName}\``);
  }

  const env = [];
  if (project.type !== 'single-repo') env.push(`Project: ${project.type}`);
  if (project.packageManager) env.push(`PM: ${project.packageManager}`);
  if (project.framework) env.push(`Framework: ${project.framework}`);
  if (project.gitBranch) env.push(`Branch: ${project.gitBranch}`);
  if (env.length) parts.push(env.join(' | '));

  parts.push('');
  parts.push('AWF commands: /awf:plan, /awf:code, /awf:debug, /awf:test, /awf:deploy, /awf:recap, /awf:next');
  parts.push('Shared rules: Read shared/rules.md for safety rules. Read shared/language-detect.md for language.');

  process.stdout.write(parts.join('\n'));
} catch (err) {
  process.stderr.write(`[awf-session-init] Error: ${err.message}\n`);
}
process.exit(0);
