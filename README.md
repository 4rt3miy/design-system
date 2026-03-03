# Design System

Internal UI theme kit for rapid prototyping with Claude Code. Pick a theme, clone it, start prompting — Claude handles the rest.

---

## How it works

This repo contains three themes. Each theme is a self-contained design system that Claude Code reads automatically when you start a session. You don't configure anything — just clone and prompt.

---

## Pick a theme

### Conversational
**Scholarly · Warm · Reading-heavy**

For interfaces where text is the primary medium. AI assistants, document tools, research platforms, knowledge bases. Inspired by the clarity of academic publishing and the warmth of library reading rooms.

- Font: Crimson Pro (humanist serif)
- Palette: Sand, parchment, forest green
- Density: Spacious — generous whitespace, long-form rhythm

Best for: AI chat interfaces, document editors, research tools, knowledge bases

---

### Vital
**Organic · Friendly · Approachable**

For interfaces where warmth and accessibility are primary. Health apps, wellness platforms, consumer products, community tools. Fresh without being clinical.

- Font: Quicksand (soft geometric sans)
- Palette: Fresh green, clean white
- Density: Balanced — comfortable, not crowded

Best for: Health apps, wellness tools, consumer-facing products, onboarding flows

---

### Analytical
**Precise · Warm · Data-first**

For interfaces where information density and clarity are primary. Dashboards, internal tools, ops platforms, data products. Warm enough to feel human, structured enough to handle complexity.

- Font: DM Sans (contemporary geometric sans)
- Palette: Warm stone, off-white, amber accent
- Density: Compact — every element earns its space

Best for: Dashboards, internal tools, data products, admin panels, ops platforms

---

## Setup

### 1. Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Then authenticate:

```bash
claude
```

Follow the login prompt. You'll need an Anthropic account.

### 2. Create a Next.js project

```bash
npx create-next-app@latest my-prototype --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
cd my-prototype
```

### 3. Install shadcn

```bash
npx shadcn@latest init
```

When prompted: Style → **Default** · Base color → **Neutral** · CSS variables → **Yes**

Install base components:

```bash
npx shadcn@latest add button card input badge table dialog
```

### 4. Copy your theme files

From this repo, copy the three files from your chosen theme into your project:

```
themes/conversational/
├── CLAUDE.md    → copy to project root
├── DESIGN.md    → copy to docs/DESIGN.md
└── globals.css  → replace src/app/globals.css
```

Also copy the core principles:

```
core/PRINCIPLES.md → copy to docs/PRINCIPLES.md
```

### 5. Start Claude Code

```bash
claude
```

Claude will automatically read `CLAUDE.md` and load the design system. Start prompting.

---

## Example prompts to get started

```
Build me a dashboard with a sidebar navigation, 
a metrics row with 3 cards, and a data table below.
```

```
Create a user profile page with an avatar, 
name, role badge, and an activity feed.
```

```
Build a settings page with a left nav 
and form sections for account and notifications.
```

---

## File structure reference

```
design-system/
├── core/
│   └── PRINCIPLES.md        ← shared rules across all themes
├── themes/
│   ├── conversational/
│   │   ├── CLAUDE.md
│   │   ├── DESIGN.md
│   │   └── globals.css
│   ├── vital/
│   │   ├── CLAUDE.md
│   │   ├── DESIGN.md
│   │   └── globals.css
│   └── analytical/
│       ├── CLAUDE.md
│       ├── DESIGN.md
│       └── globals.css
└── README.md
```

---

## Questions or feedback

Open an issue or ping the design team directly.
