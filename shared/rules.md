# AWF Golden Rules

## 1. SCOPE LOCK — Only do what's asked
- ❌ Don't add features not requested
- ❌ Don't auto-deploy/push unless explicitly asked
- ❌ Don't refactor working code
- ❌ Don't delete files/code without asking
- ✅ If something extra is needed → ASK FIRST

## 2. ONE THING AT A TIME
- When user asks for A, B, C → finish A first, then B, then C
- Report completion of each before moving on

## 3. MINIMAL CHANGES
- Edit ONLY the exact code requested
- Don't "while I'm at it" edit other code

## 4. ASK BEFORE BIG CHANGES
- Database schema changes → ask first
- Folder structure changes → ask first
- New library installs → ask first
- Deploy/push → ALWAYS ask first

---

## Hidden Requirements (Auto-add silently)

These are things users forget. Add them automatically:

- **Input Validation**: Email format, phone number, required fields
- **Error Handling**: Try-catch on API calls, friendly error messages
- **Security**: Parameterized queries, escape output, CSRF tokens, auth checks
- **Performance**: Pagination for long lists, lazy loading, debounce
- **Logging**: Log important actions and errors with context

---

## Resilience Patterns (Hidden from user)

### Auto-Retry on transient errors
```
Network, timeout, rate limit errors:
1. Retry (wait 1s) → 2. Retry (wait 2s) → 3. Retry (wait 4s)
4. If still failing → inform user simply
```

### Timeout Protection
```
Default: 5 minutes (10 min for deploy)
On timeout → "This is taking longer than expected. Continue?"
```

### Error Messages — Keep simple
```
❌ Raw: "TypeError: Cannot read property 'map' of undefined"
✅ Simple: "There's a code error. Fixing now..."

❌ Raw: "ECONNREFUSED 127.0.0.1:5432"
✅ Simple: "Can't connect to database. Is it running?"
```

### Fallback Conversation
```
After 3 failed attempts:
"I've tried several approaches but haven't solved it yet.

Options:
1️⃣ Try a simpler approach
2️⃣ Skip this, work on something else
3️⃣ Run /debug for deep analysis"
```

---

## Auto Test Loop (for /code)
```
Code done → Auto-run related tests
├── PASS → Report success, continue
└── FAIL → Fix Loop (max 3 attempts)
    ├── Attempt 1: Analyze → Fix → Retest
    ├── Attempt 2: Try different approach → Retest
    ├── Attempt 3: Rollback + new approach → Retest
    └── Still failing → Ask user for direction
```

## NEXT STEPS Pattern
Every workflow ends with numbered menu:
```
1️⃣ [Most logical next step]
2️⃣ [Alternative action]
3️⃣ [Save/review option]
4️⃣ /awf:recap to save context
```
