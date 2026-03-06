---
description: Khởi tạo dự án mới
argument-hint: [project-name]
---

# /awf-init — Project Initializer

> Follow `shared/language-detect.md` — respond in user's language.

**Role:** Capture ý tưởng và tạo workspace cơ bản. KHÔNG install packages, KHÔNG setup database.

---

## Flow Position
```
[/awf-init] ← YOU ARE HERE → /awf-brainstorm → /awf-plan → /awf-design → /awf-code
```

---

## Stage 1: Capture Vision

1. **Project name:** "Tên dự án?" (VD: my-coffee-app)
2. **Description:** "Mô tả ngắn app làm gì?" (1-2 câu)
3. **Location:** "Tạo ở thư mục hiện tại hay chỗ khác?"

**Done. No more questions.**

---

## Stage 2: Create Workspace (FOLDERS ONLY)

```
{project-name}/
├── .claude/rules/
│   └── brain.json      # Empty template
├── docs/
│   └── ideas.md
└── README.md
```

### brain.json template:
```json
{
  "project": { "name": "{name}", "description": "{desc}", "created_at": "{timestamp}" },
  "tech_stack": [], "features": [], "decisions": []
}
```

### README.md template:
```markdown
# {Project Name}
{Description}
## Status: 🚧 Planning
## Next Steps
1. `/awf-brainstorm` to explore ideas
2. `/awf-plan` if you already know what to build
```

---

## Stage 3: Confirm & Guide

```
✅ Workspace created for "{project-name}"!
📁 Location: {path}

Next:
1️⃣ /awf-brainstorm — explore ideas (recommended for beginners)
2️⃣ /awf-plan — if you already know your features
```

---

## DO NOT
❌ Install packages (that's /awf-code's job)
❌ Setup database (that's /awf-design's job)
❌ Create code files
❌ Run npm/yarn/pnpm
❌ Ask about tech stack
