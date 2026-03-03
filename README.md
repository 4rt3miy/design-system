# Design System

Internal UI theme kit for rapid prototyping with Claude Code. Pick a theme, run one command, start prompting — Claude handles the rest.

---

## How it works

Three opinionated themes. Each one is a complete design system that Claude Code reads automatically. You don't configure anything — Claude handles all design decisions from your prompts.

---

## Pick a theme

### Conversational
**Scholarly · Warm · Reading-heavy**

For interfaces where text is the primary medium. AI assistants, document tools, research platforms, knowledge bases.

- Font: Crimson Pro (humanist serif)
- Palette: Sand, parchment, forest green
- Density: Spacious

Best for: AI chat interfaces, document editors, research tools, knowledge bases

---

### Vital
**Organic · Friendly · Approachable**

For interfaces where warmth and accessibility are primary. Health apps, wellness platforms, consumer products.

- Font: Quicksand (soft geometric sans)
- Palette: Fresh green, clean white
- Density: Balanced

Best for: Health apps, wellness tools, consumer-facing products, onboarding flows

---

### Analytical
**Precise · Warm · Data-first**

For interfaces where information density and clarity are primary. Dashboards, internal tools, ops platforms.

- Font: DM Sans (contemporary geometric sans)
- Palette: Warm stone, off-white, amber accent
- Density: Compact

Best for: Dashboards, internal tools, data products, admin panels, ops platforms

---

## Setup

### 1. Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Authenticate:

```bash
claude
```

Follow the login prompt. You will need an Anthropic account.

### 2. Create a Next.js project

```bash
npx create-next-app@latest my-prototype --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
cd my-prototype
```

### 3. Run the theme setup script

Pick one:

```bash
# Conversational
curl -s https://raw.githubusercontent.com/your-org/design-system/main/themes/conversational/setup.sh | bash

# Vital
curl -s https://raw.githubusercontent.com/your-org/design-system/main/themes/vital/setup.sh | bash

# Analytical
curl -s https://raw.githubusercontent.com/your-org/design-system/main/themes/analytical/setup.sh | bash
```

This installs shadcn, sets up the font, copies all theme files, and configures everything automatically.

### 4. Start Claude Code

```bash
claude
```

Start prompting. Claude already knows the full design system.

---

## Example prompts

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

## Repo structure

```
design-system/
├── README.md
├── CONTEXT.md               ← origin decisions, read before making changes
├── core/
│   └── PRINCIPLES.md        ← shared rules across all themes
└── themes/
    ├── conversational/
    │   ├── CLAUDE.md
    │   ├── DESIGN.md
    │   ├── globals.css
    │   └── setup.sh
    ├── vital/
    │   ├── CLAUDE.md
    │   ├── DESIGN.md
    │   ├── globals.css
    │   └── setup.sh
    └── analytical/
        ├── CLAUDE.md
        ├── DESIGN.md
        ├── globals.css
        └── setup.sh
```

---

## Questions or feedback

Open an issue or ping the design team directly.
