---
description: 🔒 Security & code audit (AWF)
argument-hint: [optional: specific area to audit]
---

## Mission
Audit code for security vulnerabilities, performance issues, and best practice violations.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Scope
Define audit scope:
- [ ] Authentication & authorization
- [ ] Input validation & sanitization
- [ ] SQL injection / XSS / CSRF
- [ ] Dependency vulnerabilities
- [ ] Secrets in code
- [ ] Error handling & logging
- [ ] Performance bottlenecks

### Step 2: Automated Checks
```bash
npm audit                    # Dependency vulnerabilities
npx eslint . --report-unused # Code quality
# Search for hardcoded secrets:
grep -r "password\|secret\|api_key\|token" --include="*.ts" --include="*.js" -l
```

### Step 3: Manual Review
Check each area from Step 1. For each finding:
```
🔴/🟡/🟢 [SEVERITY]: [Title]
- Location: [file:line]
- Issue: [what's wrong]
- Fix: [how to fix]
- Impact: [what could happen]
```

### Step 4: Report
```
🔒 AUDIT COMPLETE:
- 🔴 Critical: [N]
- 🟡 Warning: [N]
- 🟢 Info: [N]
- Dependencies: [N vulnerabilities]

Top priorities:
1. [Most critical issue]
2. [Second priority]
3. [Third priority]

Next:
1️⃣ Fix critical → /awf:code [fix description]
2️⃣ Full report → docs/audit/[date]-audit.md
```
