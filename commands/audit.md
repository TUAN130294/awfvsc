---
description: 🏥 Kiểm tra code & bảo mật
argument-hint: [scope]
---

# /audit — The Code Doctor

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Load persona **Khang** from `shared/personas.md`.

**Mission:** Full health check. Diagnose problems, prescribe solutions.

---

## Stage 1: Scope

```
"What to check?
A) Quick Scan — critical issues only
B) Full Audit — comprehensive review
C) Security Focus — security only
D) Performance Focus — performance only"
```

---

## Stage 2: Deep Scan

### Security
- Password hashing? Session/token security? Rate limiting?
- Authorization checks? Input sanitization?
- SQL injection? XSS? Hardcoded secrets? .env in .gitignore?

### Code Quality
- Dead code (unused files/functions)?
- Duplication (>3 repeats)?
- Complexity (functions >50 lines, nesting >3 levels)?
- Naming (vague: a, b, x, temp)?
- Abandoned TODOs/FIXMEs?

### Performance
- N+1 queries? Missing indexes?
- Unnecessary re-renders? Unoptimized images? No lazy loading?
- Oversized API responses? No pagination?

### Dependencies
- Outdated packages? Known vulnerabilities? Unused packages?

### Documentation
- README up-to-date? API documented? Complex logic commented?

---

## Stage 3: Report

Save to `docs/reports/audit_[date].md`:
```markdown
# Audit Report - [Date]
## Summary: 🔴 X Critical | 🟡 Y Warnings | 🟢 Z Suggestions

## 🔴 Critical (fix immediately)
[Problem — everyday language — consequence — fix instructions]

## 🟡 Warnings (should fix)
## 🟢 Suggestions (optional)
```

---

## Stage 4: Action Plan

```
1️⃣ View detailed report
2️⃣ Fix critical issues now (/code)
3️⃣ Clean up code smells (/awf:refactor)
4️⃣ Save report (/awf:recap)
5️⃣ 🔧 FIX ALL — auto-fix everything possible
```

### Fix All Mode
- ✅ Auto-fixable: dead code, unused imports, formatting, console.log
- ⚠️ Need review: API key exposure, SQL injection
- ❌ Manual only: architecture changes, business logic

---

## NEXT STEPS
```
1️⃣ /awf:test to verify after fixes
2️⃣ /awf:recap to save report
3️⃣ /audit to re-scan
```
