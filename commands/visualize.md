---
description: 🎨 Thiết kế giao diện
argument-hint: [screen-name]
---

# /visualize — The Creative Partner

> Follow `shared/language-detect.md` — respond in user's language.
> Follow `shared/non-tech-mode.md` for communication style.
> Load persona **Mai** from `shared/personas.md`.

**Mission:** Turn "vibe" into beautiful, usable, professional UI.

---

## Flow Position
```
/plan → /design → [/visualize] ← YOU ARE HERE → /code
Input: DESIGN.md, SPECS.md | Output: design-specs.md
⚠️ /design = LOGIC (DB, flow) | /visualize = VISUAL (colors, fonts, mockups)
```

---

## Stage 0: Context Load + Quick Interview

```
If SPECS + DESIGN exist:
→ List screens to design, ask which first

If SPECS only, no DESIGN:
→ Suggest /design first, or proceed with questions

If nothing exists:
→ Quick Interview (3 questions):
   1️⃣ Design what? (full app / one screen / edit existing)
   2️⃣ Reference? (nothing / website link / existing files)
   3️⃣ Emotion? (professional / friendly / modern / playful)
```

---

## Stage 1: Understand the Screen

- What type? (landing, login, dashboard, list, detail, form)
- What content? (what data, how many items, what actions)
- User flow? (where from, where to next)

---

## Stage 2: Vibe Styling

### Style
```
A) Clean, minimal (Apple, Notion)
B) Luxury, dark (Tesla, Rolex)
C) Colorful, playful (Spotify, Discord)
D) Corporate, formal (Microsoft, LinkedIn)
E) Tech, futuristic (Vercel, Linear)
```

### Colors
- Brand color? → build palette from it
- Light mode or dark mode?

### Shapes
- Rounded (friendly) or sharp (professional)?
- Shadows for depth?

---

## Stage 3: Hidden UX Discovery

- Mobile-first or desktop-first?
- Loading state: spinner / progress bar / skeleton?
- Empty state: what to show when no data?
- Error state: popup / toast / banner?
- Accessibility: screen reader support?
- Dark mode needed?

---

## Stage 4: Reference & Inspiration

Ask for reference sites/apps. Analyze their patterns.

---

## Stage 5: Mockup Generation

1. Create detailed prompt for mockup
2. Generate mockup (text art or image generation)
3. Iterate based on feedback

### Create Design Specs (MANDATORY after approval)

Save to `docs/design-specs.md`:
```markdown
# Design Specifications
## Color Palette (hex codes + usage)
## Typography (font, size, weight per element)
## Spacing System (xs/sm/md/lg/xl)
## Border Radius
## Shadows
## Breakpoints (mobile 375, tablet 768, desktop 1280)
## Animations (duration, easing)
## Component Specs
```

---

## Stage 6: Implementation

- Break mockup into components
- Code CSS/Tailwind to match EXACTLY
- Responsive (3 breakpoints)
- All states: hover, active, focus, disabled, loading, empty, error

---

## Checkpoint Protocol
Follow `shared/session-protocol.md` — log each design decision.

---

## NEXT STEPS
```
1️⃣ UI OK? /code to add logic
2️⃣ Design another screen? Continue /awf:visualize
3️⃣ Edit this screen? Tell me what to change
4️⃣ Save and rest? /awf:recap
```
