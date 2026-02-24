---
description: 🖼️ UI/UX mockup design (AWF)
argument-hint: [screen or component to design]
---

## Mission
Design UI/UX for the specified screen or component. Create detailed layouts and component specs.

<task>
$ARGUMENTS
</task>

## Workflow

### Step 1: Context
1. Read CLAUDE.md and design docs
2. Check existing UI patterns in the project
3. Identify the design system (Tailwind, CSS modules, etc.)

### Step 2: Layout Design
Create ASCII wireframe:
```
┌──────────────────────────────────────┐
│  Header: Logo | Nav | Profile       │
├──────────────────────────────────────┤
│  Sidebar  │  Main Content           │
│  - Item 1 │  ┌──────┐ ┌──────┐     │
│  - Item 2 │  │ Card │ │ Card │     │
│  - Item 3 │  └──────┘ └──────┘     │
├──────────────────────────────────────┤
│  Footer                              │
└──────────────────────────────────────┘
```

### Step 3: Component Spec
For each component:
- Props/inputs
- States (loading, empty, error, success)
- Responsive behavior (mobile, tablet, desktop)
- Interactions (hover, click, focus)

### Step 4: Implementation Notes
- Color palette references
- Typography scale
- Spacing system
- Animation/transition specs

### Step 5: Save & Next
Save to `docs/design/ui/[screen].md` and show:
```
🖼️ UI DESIGNED: [screen]
- Components: [N]
- States covered: [list]
- Saved: docs/design/ui/[screen].md

Next:
1️⃣ Code it → /awf:code [component]
2️⃣ Design more screens → /awf:visualize [next screen]
```
