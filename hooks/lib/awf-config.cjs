'use strict';

const fs = require('fs');
const path = require('path');
const os = require('os');
const { execSync } = require('child_process');

const DEFAULT_CONFIG = {
  locale: 'auto',
  techLevel: 'auto',
  qualityLevel: 'production',
  persona: 'default',
  plan: { namingFormat: '{date}-{slug}', dateFormat: 'YYMMDD-HHmm' },
  paths: { plans: 'plans', docs: 'docs', reports: 'plans/reports' },
  hooks: { 'session-init': true, 'prompt-reminder': true, 'subagent-context': true }
};

function deepMerge(target, source) {
  const out = { ...target };
  for (const key of Object.keys(source)) {
    if (source[key] && typeof source[key] === 'object' && !Array.isArray(source[key])
        && target[key] && typeof target[key] === 'object' && !Array.isArray(target[key])) {
      out[key] = deepMerge(target[key], source[key]);
    } else {
      out[key] = source[key];
    }
  }
  return out;
}

function loadConfig() {
  let cfg = { ...DEFAULT_CONFIG };
  // Global config
  const globalPath = path.join(os.homedir(), '.awf.json');
  if (fs.existsSync(globalPath)) {
    try { cfg = deepMerge(cfg, JSON.parse(fs.readFileSync(globalPath, 'utf8'))); } catch {}
  }
  // Local config
  const localPath = path.join(process.cwd(), '.awf.json');
  if (fs.existsSync(localPath)) {
    try { cfg = deepMerge(cfg, JSON.parse(fs.readFileSync(localPath, 'utf8'))); } catch {}
  }
  return cfg;
}

function writeEnv(key, value) {
  const envFile = process.env.CLAUDE_ENV_FILE;
  if (!envFile || value == null) return;
  try {
    const escaped = String(value).replace(/\\/g, '\\\\').replace(/"/g, '\\"');
    fs.appendFileSync(envFile, `export ${key}="${escaped}"\n`);
  } catch {}
}

function safeExec(cmd, timeout) {
  try { return execSync(cmd, { timeout: timeout || 5000, encoding: 'utf8' }).trim(); } catch { return null; }
}

function detectProject() {
  const cwd = process.cwd();
  const result = { type: 'single-repo', packageManager: null, framework: null,
    gitBranch: null, gitRoot: null, pythonVersion: null, nodeVersion: null };

  // Package manager
  const lockFiles = { 'bun.lockb': 'bun', 'pnpm-lock.yaml': 'pnpm', 'yarn.lock': 'yarn', 'package-lock.json': 'npm' };
  for (const [file, pm] of Object.entries(lockFiles)) {
    if (fs.existsSync(path.join(cwd, file))) { result.packageManager = pm; break; }
  }

  // Project type
  if (fs.existsSync(path.join(cwd, 'pnpm-workspace.yaml')) || fs.existsSync(path.join(cwd, 'lerna.json'))) {
    result.type = 'monorepo';
  } else {
    try {
      const pkg = JSON.parse(fs.readFileSync(path.join(cwd, 'package.json'), 'utf8'));
      if (pkg.workspaces) result.type = 'monorepo';
    } catch {}
  }

  // Framework
  try {
    const pkg = JSON.parse(fs.readFileSync(path.join(cwd, 'package.json'), 'utf8'));
    const deps = { ...pkg.dependencies, ...pkg.devDependencies };
    const frameworks = [['next', 'next'], ['nuxt', 'nuxt'], ['vue', 'vue'], ['svelte', 'svelte'],
      ['@angular/core', 'angular'], ['express', 'express'], ['fastify', 'fastify'], ['react', 'react']];
    for (const [dep, name] of frameworks) {
      if (deps[dep]) { result.framework = name; break; }
    }
  } catch {}

  // Git
  result.gitBranch = safeExec('git rev-parse --abbrev-ref HEAD');
  result.gitRoot = safeExec('git rev-parse --show-toplevel');

  // Node
  result.nodeVersion = safeExec('node --version');

  // Python
  result.pythonVersion = safeExec('python3 --version') || safeExec('python --version');

  return result;
}

function isHookEnabled(hookName) {
  const cfg = loadConfig();
  return cfg.hooks[hookName] !== false;
}

function readStdin() {
  try { return JSON.parse(fs.readFileSync(0, 'utf8')); } catch { return {}; }
}

function findLatestPlan() {
  const cfg = loadConfig();
  const plansDir = path.join(process.cwd(), cfg.paths.plans);
  if (!fs.existsSync(plansDir)) return null;
  try {
    const dirs = fs.readdirSync(plansDir, { withFileTypes: true })
      .filter(d => d.isDirectory() && /^\d{6}/.test(d.name))
      .map(d => d.name).sort().reverse();
    return dirs.length ? path.join(plansDir, dirs[0]) : null;
  } catch { return null; }
}

module.exports = { DEFAULT_CONFIG, deepMerge, loadConfig, writeEnv, safeExec,
  detectProject, isHookEnabled, readStdin, findLatestPlan };
