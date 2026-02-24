---
description: ▶️ Chạy ứng dụng
argument-hint: [mode]
---

# /run — The Application Launcher

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Follow `shared/session-protocol.md` for session state updates.
> Load persona **Đức** from `shared/personas.md`.

**Principle:** User types /run, AI handles everything. One command to rule them all.

---

## Flow Position
```
/code → [/run] ← YOU ARE HERE → /test or /deploy
         ↓ (if failed) → /debug
```

---

## Stage 1: Environment Detection

Auto-scan project:
- `docker-compose.yml` → Docker Mode
- `package.json` with `dev` script → Node Mode
- `requirements.txt` → Python Mode
- `Makefile` → Read Makefile for run command
- Multiple options → ask user which to use

---

## Stage 2: Pre-Run Checks

1. **Dependencies:** `node_modules/` exists? If not → `npm install`
2. **Port check:** Default port (3000, 8080) available? If blocked → ask to kill or use alternate

---

## Stage 3: Launch & Monitor

1. Start app in background
2. Watch initial output for errors
3. Detect status:
   - "Ready on http://..." → SUCCESS
   - "Error:", "EADDRINUSE" → FAILED

### On SUCCESS — update session:
```
session.json: status = "running", last_run_url = "http://localhost:3000"
session_log.txt: "[HH:MM] RUN SUCCESS: http://localhost:3000"
```

### On FAILURE — update session:
```
session.json: status = "error", errors_encountered += error
session_log.txt: "[HH:MM] RUN FAILED: [error]"
```

---

## Stage 4: Handover

### Success:
```
🚀 APP IS RUNNING!
🌐 Open: http://localhost:3000

Tips:
- Keep this terminal open
- Stop: Ctrl+C
- Code changes auto-reload
- Mobile: same WiFi → http://[your-IP]:3000
```

### Failure:
```
⚠️ NOT RUNNING YET
[simple explanation of error]
🔧 Trying auto-fix...
[if fixable] → ✅ Fixed! Retrying...
[if not fixable] →
1️⃣ Try again: /awf:run
2️⃣ Debug: /awf:debug
3️⃣ Skip, do something else
```

---

## NEXT STEPS
```
1️⃣ Check code → /awf:test
2️⃣ Got errors → /awf:debug
3️⃣ Tweak UI → /awf:visualize
4️⃣ Done → /awf:recap
5️⃣ Go live → /awf:deploy
```
