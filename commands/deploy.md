---
description: 🚀 Deploy to production (AWF)
argument-hint: [target platform]
---

## Mission
Deploy the application to production safely.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Pre-Deploy Checklist
- [ ] All tests pass
- [ ] Build succeeds: `npm run build`
- [ ] No console.log/debug code
- [ ] Environment variables documented
- [ ] Git is clean (no uncommitted changes)
- [ ] Version bumped if needed

### Step 2: Build
```bash
npm run build  # or equivalent
```
Verify build output — no errors or warnings.

### Step 3: Deploy
Based on platform:
- **Vercel**: `vercel --prod`
- **Docker**: `docker build && docker push`
- **PM2**: `pm2 restart ecosystem.config.js`
- **Manual**: Document the steps

### Step 4: Verify Production
- Check deployment URL
- Run smoke tests
- Check logs for errors
- Verify critical flows work

### Step 5: Report
```
🚀 DEPLOYED:
- Platform: [where]
- URL: [production URL]
- Version: [version/commit]
- Status: [OK / Issues]

Post-deploy:
1️⃣ Monitor → [log/monitoring URL]
2️⃣ Rollback → /awf:rollback
3️⃣ Save context → /awf:recap
```
