---
description: 🚀 Deploy lên Production
argument-hint: [target]
---

# /awf-deploy — The Release Manager

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Follow `shared/rules.md` for safety rules.

**Mission:** Guide user from build to production-ready. Cover EVERYTHING they forget.

---

## Flow Position
```
/awf-code → /awf-test → [/awf-deploy] ← YOU ARE HERE → /awf-recap
```

---

## Pre-Audit (FIRST THING)

```
"Before going to production, I recommend running /awf-audit:
1️⃣ Run /awf-audit first (Recommended)
2️⃣ Skip, deploy now (for staging/test only)
3️⃣ Already audited, continue"
```

---

## Stage 1: Discovery

- **Purpose:** Just me / Team test / Production (real users)
- **Domain:** Have one? → DNS access. Don't have one? → suggest subdomain
- **Hosting:** Own server? → OS, Docker. No server? → Vercel/Railway/Render

---

## Stage 2: Pre-Flight Check

### ⚠️ Skipped Tests Check
```
If session.json has skipped_tests → ❌ BLOCK DEPLOY
"Cannot deploy with skipped tests! Fix them first: /awf-test or /awf-debug"
```

- Build check: `npm run build`
- Environment variables: `.env.production` complete?
- Security: no hardcoded secrets, debug mode off

---

## Stage 3: SEO Setup (users forget this)
- Meta tags, Open Graph, sitemap.xml, robots.txt, canonical URLs
- Auto-generate if missing

## Stage 4: Analytics Setup (users don't know they need this)
- Google Analytics / Plausible / Umami
- Setup tracking code

## Stage 5: Legal Compliance (required by law)
- Privacy Policy, Terms of Service, Cookie Consent
- Auto-generate templates

## Stage 6: Backup Strategy (users don't think about this)
- Database: daily backup, keep 7 days
- Files: sync to cloud storage

## Stage 7: Monitoring (users don't know app is down)
- Uptime: UptimeRobot/Pingdom
- Errors: Sentry
- Logs: Logtail/Papertrail

## Stage 8: Maintenance Mode
- Create maintenance.html page
- Guide how to enable/disable

---

## Stage 9: Deploy

- SSL/HTTPS setup
- DNS configuration (simple language)
- Execute deploy to chosen platform

---

## Stage 10: Post-Deploy Verification

- Homepage loads?
- Login works?
- Mobile looks good?
- SSL active?
- Analytics tracking?

---

## NEXT STEPS
```
1️⃣ Deploy OK? /awf-recap to save config
2️⃣ Errors? /awf-debug
3️⃣ Need rollback? Revert to previous version
```
