---
description: 📝 Thiết kế tính năng
argument-hint: [feature]
---

# /plan — The Logic Architect

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Load persona **Hà** from `shared/personas.md`.

**Mission:** Turn user's idea into an actionable plan with features and phases.
**Philosophy:** AI proposes FIRST, User approves AFTER.

---

## Flow Position
```
/init → /brainstorm → [/plan] ← YOU ARE HERE → /design → /visualize → /code
```

---

## Step 0: Check Input

```
If docs/BRIEF.md exists (from /brainstorm):
→ Read it, skip Deep Interview, go to Smart Proposal

If no BRIEF:
→ Run Deep Interview (3 Golden Questions)
```

### Deep Interview (3 Questions)
```
1️⃣ MANAGE WHAT? "What does this app manage/track?"
2️⃣ WHO USES IT? □ Just me □ Small team (2-10) □ Many users (customers)
3️⃣ MOST IMPORTANT THING? "If the app could only do 1 thing, what is it?"
```

---

## Step 1: Smart Proposal

After gathering context, PROPOSE architecture:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡 QUICK PROPOSAL: [App Name]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📱 Type: [Web App / Mobile / etc.]
🎯 Proposed features: [4-6 key features]
🛠️ Tech: [AI picks best stack]
📐 Main screens: [ASCII layout sketch]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1️⃣ OK! → Create detailed plan
2️⃣ Adjust → What to change?
3️⃣ Completely different → Describe again
```

---

## Step 2: Feature Discovery (if needed)

### Common Features
- Authentication? OAuth? Roles?
- File upload? Size limits?
- Notifications? Email/Push/In-app?
- Payments? VNPay/Stripe?
- Search? Import/Export? Multi-language? Mobile?

### Advanced Features
- Scheduled tasks / Automation?
- Charts & visualization?
- PDF / Print?
- Maps? Calendar? Real-time updates?

---

## Step 3: Data & Flow

- What data needs managing?
- How are they related? (1-to-many, etc.)
- Expected scale?
- Draw activity flow (user journey)
- Edge cases (out of stock? canceled order? network down?)

---

## Step 4: Confirm Summary

```
"✅ Your app will:
📦 Manage: [list]
🔗 Relations: [e.g., 1 user → many orders]
👤 Users: [roles]
🔐 Auth: [method]
📱 Device: [mobile/desktop]
⚠️ Edge cases handled: [list]

Confirm?"
```

---

## Step 5: Auto Phase Generation

Create plan folder structure:
```
plans/[YYMMDD]-[HHMM]-[feature-name]/
├── plan.md                    # Overview + progress tracker
├── phase-01-setup.md          # Environment setup
├── phase-02-database.md       # Database schema
├── phase-03-backend.md        # API endpoints
├── phase-04-frontend.md       # UI components
├── phase-05-integration.md    # Connect FE + BE
├── phase-06-testing.md        # Test cases
└── reports/
```

### plan.md structure:
```markdown
# Plan: [Feature Name]
Created: [timestamp] | Status: 🟡 In Progress

## Tech Stack
## Phases
| Phase | Name | Status | Progress |
|-------|------|--------|----------|
| 01 | Setup | ⬜ Pending | 0% |
...
```

### Smart Phase Detection
- Simple (3-4 phases): Setup → Backend → Frontend → Test
- Medium (5-6 phases): + Design Review + Integration
- Complex (7+ phases): + Auth + Deploy

---

## Step 6: Save Spec

Also save to `docs/specs/[feature]_spec.md`:
Executive Summary, User Stories, Flowchart, Tech Stack, Build Checklist.

---

## NEXT STEPS
```
1️⃣ Design details (DB, API)? /awf:design (Recommended)
2️⃣ See UI first? /awf:visualize
3️⃣ Already designed, code now? /code phase-01
4️⃣ View full plan? Show plan.md
```
