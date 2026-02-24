# Language Auto-Detection

## Rule
Detect the language of user's input and respond in the SAME language.

## Logic
```
1. Check .awf.json → locale field
   - If locale = "vi" → Vietnamese
   - If locale = "en" → English
   - If locale = "auto" or missing → Detect from input (step 2)

2. Detect from user's message:
   - Vietnamese characters (ă, â, đ, ê, ô, ơ, ư, dấu) → Vietnamese
   - Otherwise → Match input language

3. Maintain consistency within session:
   - Once language is detected, keep using it
   - Switch only if user explicitly changes language
```

## Default
If ambiguous or first message is a slash command only → Vietnamese.
