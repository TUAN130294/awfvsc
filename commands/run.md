---
description: ▶️ Run application (AWF)
argument-hint: [optional: specific service to run]
---

## Mission
Start the application and verify it runs correctly.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Check Prerequisites
1. Read CLAUDE.md for run commands
2. Check if dependencies installed (`node_modules/`, `venv/`, etc.)
3. Check for `.env` file (copy from `.env.example` if needed)
4. Check if required services are running (DB, Redis, etc.)

### Step 2: Install Dependencies (if needed)
Only if `node_modules/` or equivalent is missing:
```bash
npm install  # or pnpm install, pip install -r requirements.txt
```

### Step 3: Start Application
Run the dev command from CLAUDE.md or detect from package.json/Makefile:
```bash
npm run dev  # or equivalent
```

### Step 4: Verify
- Check for startup errors in output
- Confirm port is listening
- Try a basic health check if applicable

### Step 5: Report
```
▶️ APP RUNNING:
- URL: [http://localhost:XXXX]
- Command: [what was run]
- Status: [OK / Error details]

If issues:
1️⃣ Debug → /awf:debug [error]
2️⃣ Check logs → [log location]
```

## Common Issues
- Port in use → kill existing process or change port
- Missing env vars → check `.env.example`
- DB not running → start database service
- Dependencies outdated → `npm install`
