# Context

This document captures the origin decisions behind this design system. It exists so that any future Claude session or team member can pick up full context without reading the original conversation.

---

## What this is

A collection of opinionated UI theme starters designed for **vibecoders** — team members who build prototypes using Claude Code but have no design background and no framework preferences. Without guidance, Claude defaults to random UI choices on every project. This system fixes that by giving Claude a complete design system to read before generating any UI.

The system is not a component library. It is a set of markdown and CSS files that Claude Code reads automatically via `CLAUDE.md`. The vibecoder clones a theme, opens Claude Code, and starts prompting — Claude handles all design decisions consistently from there.

---

## The persona this is designed for

- Builds prototypes fast using Claude Code
- Does not choose UI frameworks intentionally
- Does not read design documentation
- Needs output that looks intentional without doing any design work themselves
- Primary workflow: clone → `npm install` → `claude` → prompt

Everything in this system is optimised for that flow. Complexity that would create friction for this persona was intentionally removed.

---

## Why three themes

Three themes were chosen to cover the most common prototype contexts within the team, while being distinct enough to demonstrate contrast clearly. The contrast between Conversational and Analytical was the primary design goal — serif vs sans, spacious vs dense, warm parchment vs warm stone.

A demo page pre-built into each starter was considered and rejected. It would introduce a decision for the vibecoder: delete it or keep it? A blank canvas is less friction.

---

## Theme decisions

### Conversational
- **Source**: Derived directly from the Ali AI Brand & Visual Guidelines PDF (v1.4.0, February 2026)
- **Font**: Crimson Pro — humanist serif chosen for its scholarly authority and legibility at reading sizes
- **Palette**: Sand/parchment background, forest green primary, gold accent
- **Density**: Spacious — reading rhythm is the primary concern
- **Use cases**: AI chat interfaces, document tools, research platforms, knowledge bases
- **Key principle**: Clarity over decoration. Authority through restraint.

### Vital
- **Source**: Derived from the Zeroh theme CSS — originally built for an agriculture project
- **Renamed from**: Zeroh → Vital (generic enough to work beyond agriculture, communicates health/wellness/energy)
- **Font**: Quicksand — soft geometric sans, rounded terminals feel friendly and approachable
- **Palette**: Fresh green primary, clean white, soft green borders
- **Density**: Balanced — approachable, not crowded
- **Dark mode**: Supported via `.dark` class (only theme in the set with dark mode)
- **Use cases**: Health apps, wellness platforms, consumer products, onboarding flows
- **Key principle**: Warm without being naive. Fresh without being clinical.

### Analytical
- **Source**: Defined from scratch to contrast with Conversational and Vital
- **Direction chosen**: Warm contrast — precise and data-first but still human. Not cold/minimal (Linear, Bloomberg). More like Notion or Craft.
- **Font**: DM Sans — contemporary geometric sans, neutral with enough personality to avoid sterility
- **Palette**: Warm stone neutrals, off-white background, amber accent. Intentionally avoids cool grays.
- **Density**: Compact — tighter type scale, smaller components, denser spacing than the other themes
- **Use cases**: Dashboards, internal tools, data products, admin panels, ops platforms
- **Key principle**: Every element earns its space. Density is a feature, not a compromise.

---

## Shared decisions across all themes

These were established in `core/PRINCIPLES.md` and apply universally:

- **shadcn/ui** for all components — never raw HTML equivalents
- **Lucide React** exclusively for icons — stroke only, 1.5px weight, never filled
- **Semantic token architecture** in three layers: primitives → semantics → Tailwind
- **ease-out** for all transitions — no bounce, spring, or ease-in-out
- **4px base spacing scale** — 4 · 8 · 12 · 16 · 24 · 32 · 48px only
- Raw hex values in components are always wrong — semantic tokens only

---

## What was intentionally left out

- **No framework files** — the system is design-only (markdown + CSS). Each theme includes a `setup.sh` script that handles all wiring: shadcn init, component installation, font setup, and file copying. The vibecoder runs one curl command inside a fresh Next.js project and everything is configured.
- **No demo page** — removed to avoid friction for the vibecoder persona
- **No component code** beyond snippets in DESIGN.md — shadcn handles components, themes only configure them
- **No fourth theme** — kept to three for the research phase. Expand after team feedback.
- **No light/dark toggle** — only Vital has dark mode. Adding it universally would complicate the CSS before the system is validated.

---

## Distribution

- **Repo**: Private GitHub repo named `design-system`
- **Audience**: Internal team only
- **How to share**: Team clones the repo, copies three files from their chosen theme into a new Next.js project, and follows the README setup guide
- **Claude Code setup**: Included in README — team members may not have it installed

---

## Research phase goals

This system is in a research phase. The goal is to gather feedback from the team on:

1. Whether the three themes cover the right use cases
2. Whether Claude Code consistently follows the design system from prompts alone
3. Whether the vibecoder flow (clone → install → prompt) is truly frictionless
4. Which theme gets used most — that signals where to invest next

Decisions about additional themes, a monorepo structure, framework starters, or a component library should wait until this feedback is collected.

---

## How to continue working on this with Claude

1. Open a new Claude session
2. Upload or paste the contents of this file and `README.md`
3. Say: *"Read CONTEXT.md — we're continuing work on this design system"*
4. Claude will have full context to pick up where this conversation left off
