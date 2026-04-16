---
title: "Claude Code – a practical guide for developers"
date: 2026-04-17T01:08:01+02:00
slug: "17-04-2026-claude-code-how-to"
categories: ["programming", "guide"]
tags: []
draft: false
params:
  metadescription: ""
  metakeywords: ""
---

> Written from official docs and community wisdom (April 2026). Things move fast — check
> [code.claude.com/docs](https://code.claude.com/docs) for the latest, because by the time you read
> this something has probably already changed.

---

## A) IDE Integration and Plugins

**Claude Code is primarily a terminal tool.** You run it in your terminal inside your repo, and
that's actually its superpower — it sees the whole project, not just whatever file you happen to
have open. Revolutionary, right?

### Recommended Setup

| IDE                             | Integration                  | How                                                                                                                  |
| ------------------------------- | ---------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **VS Code**                     | ✅ Official extension (beta) | Install _Claude Code_ from Marketplace — adds a sidebar and inline diffs so you don't have to squint at the terminal |
| **Cursor**                      | ✅ Works                     | Same extension as VS Code; the terminal links up automatically                                                       |
| **JetBrains** (WebStorm, IDEA…) | ✅ Official plugin           | Available in JetBrains Marketplace                                                                                   |
| **Windsurf**                    | ✅ Works                     | Community-confirmed, for what that's worth                                                                           |

### How IDE Integration Actually Works

When you run Claude Code inside your IDE's terminal, it links itself to the editor. Instead of
reading suggestions in a chat window and then manually transcribing them like it's 2019, Claude
proposes **inline diffs** directly in your files. You accept or reject them. Everything flows
through Git, so you get a clean history of what the AI actually did to your codebase.

### Useful MCP Servers (connect via `claude mcp add`)

- **Playwright** – browser automation and testing
- **GitHub MCP** – read issues, post PR comments directly from Claude Code
- **Figma MCP** – implement directly from design files, skip the "what did the designer mean by
  this" phase
- **Notion, Linear, Jira** – tasks and docs without switching tabs every 30 seconds

### Builder.io Extension (Bonus)

If living in the terminal isn't your thing, [Builder.io](https://www.builder.io/blog/claude-code)
ships a visual interface on top of Claude Code. Same thing under the hood, but with actual buttons.

> But trust me bro, terminal is faster once you master it...

---

## B) CLAUDE.md — What It Is and How to Write One That Actually Works

### What Is CLAUDE.md

`CLAUDE.md` is a special file that **Claude Code reads automatically at the start of every
session**. Think of it as a persistent project memory — for all the things Claude can't infer from
staring at your code:

- build and test commands
- your coding style preferences
- rules you actually care about
- mistakes Claude has already made that you'd prefer not to experience again

**The catch:** The file is _advisory_, not law. If it's too long, Claude starts ignoring it — like
terms and conditions, but for robots. **Golden rule: keep it under 200 lines.** For every line, ask
yourself: _"If I remove this, will Claude screw something up?"_ If the answer is no — delete it.

### CLAUDE.md File Hierarchy

```
repo/
├── CLAUDE.md              # global project rules
├── src/
│   └── CLAUDE.md          # rules that only apply inside src/
└── .claude/
    ├── settings.json      # hooks, permissions
    └── commands/          # your custom slash commands (.md files)
```

You can also have a **global** CLAUDE.md for personal preferences that apply across all your
projects, for when you want Claude to be consistently your kind of wrong.

### Getting Started

```bash
# Let Claude analyze the project and generate a starter CLAUDE.md
/init
```

Then edit it manually, because Claude's guess at your preferences is a starting point, not a
finished product.

### Example CLAUDE.md for a Web Project

```markdown
# Project: [Name]

One-liner: what it is, what stack, who it's for.

## Build & Commands

- `pnpm run dev` – dev server
- `pnpm run build` – production build
- `pnpm test` – run tests (NEVER run the full suite, only relevant tests)
- `pnpm run lint` – ESLint

## Code Style

- TypeScript strict mode — always, no exceptions, don't even ask
- ES modules (import/export), not CommonJS (require)
- Destructured imports: `import { foo } from 'bar'`
- No `any` types without a comment explaining why you've given up
- Functions max ~40 lines — if it's longer, it's doing too many things
- No over-commented code — comment WHY, not what (the code says what)
- No spaghetti — one function, one job

## Architecture

- Components in `src/components/`, utilities in `src/lib/`
- Shared types in `src/types/`
- New files: `kebab-case.ts`

## Git Workflow

- Commit after each working step, not at the end when you've forgotten what changed
- Never commit secrets or .env values
- Commit messages: `feat:`, `fix:`, `refactor:`, `docs:` prefix

## Rules of Engagement

- Always typecheck after a series of changes
- Prefer running individual tests, not the whole suite
- NEVER write to migrations/ without my explicit sign-off
- When in doubt — ask. Don't just keep going and hope for the best.

## Things Claude Got Wrong (Living Log)

- [date] Added barrel exports to index.ts without being asked — don't do this
```

> **The last section is pure gold.** Every time Claude does something you didn't want, add a rule.
> Over time this file becomes a surprisingly accurate digital representation of your coding taste.

---

## C) How to Prompt — Task Size and the Planning Phase

### The Golden Rule of Task Size

| Task Type                  | Approach                                       |
| -------------------------- | ---------------------------------------------- |
| Bug fix in 1 file          | Just implement it, no planning ceremony needed |
| Feature touching 3+ files  | **Always use Plan Mode**                       |
| Architectural decision     | Plan Mode + manual review before approving     |
| Refactoring a whole module | Plan Mode → small steps, max 200-line diffs    |

**General principle:** Keep diffs under 200 lines. Break big changes into stages, each separately.
Trying to do everything in one shot is how you end up with a 900-line diff you don't fully
understand.

### Plan Mode — The "Think Before You Type" Phase

Plan Mode is a read-only phase where Claude analyzes the codebase and proposes a plan **without
touching anything**. It's basically the engineering practice of thinking first, which turns out to
be useful even when an AI is doing the thinking.

```bash
# Activate
Shift+Tab (twice)    # or
/plan                # since version 2.1.0
```

In Plan Mode, Claude:

1. Reads through relevant files (read-only, nothing changes)
2. Asks clarifying questions about ambiguous requirements
3. Produces a structured plan: what to change, in what order, and why
4. Waits for your approval like a civilized assistant

Only after you approve does it switch back to normal mode and start implementing.

**Example flow:**

```
> /plan Add Redis-backed rate limiting to all public API endpoints

Claude: [analyzes project]
  - Found 12 endpoints across 4 route files
  - Redis client already exists in src/lib/redis.ts
  - No existing rate limiting middleware found

Plan:
  Step 1: src/middleware/rateLimit.ts (new file)
  Step 2: src/config/rateLimits.ts (limit configuration)
  Step 3: Apply middleware to 4 route files
  Step 4: Tests

Approve? [edit / confirm]
```

### Prompt Structure That Actually Works

```
[Context]:     What's the project, what stack, what problem am I solving
[Task]:        What I want (describe the outcome, not the steps)
[Constraints]: What must not change, what to watch out for
[Files]:       @src/auth/handler.ts  (add relevant files explicitly)
```

**Example of a good prompt:**

```
Express API with TypeScript. I want to add OAuth 2.0 to the auth module.
Constraints:
- Don't touch existing session management
- TypeScript strict mode throughout
- All existing tests must still pass
Relevant files: @src/auth/ @src/middleware/

Propose an implementation plan first. Don't start coding yet.
```

### Prompting Rules Worth Internalizing

- **Describe the outcome, not the steps** — "I want rate limiting on the API" not "Create file X,
  then Y, then Z" (you're the architect, not a stenographer)
- **Explicit file references** — Use `@filepath` so Claude isn't guessing what's relevant
- **Small iterations** — Approve plan → step 1 → test → step 2. Not everything at once.
- **/clear between unrelated tasks** — Dirty context produces progressively worse results
- **Don't exceed 50% of the context window** — Do `/compact` before that point, or start fresh

---

## D) Ideal Workflow — Stay Close to the Code, Actually Save Time, Write Code You'd Be Proud Of

### The Basic Development Loop

```
1. /plan [task]          → review plan, edit if something's off
2. Approve plan          → Claude implements step 1
3. Review the diff       → accept / reject / give feedback
4. Run tests             → share the results with Claude
5. Repeat for step 2, 3…
6. Commit + /clear
```

This might feel like more overhead than just typing "do the thing." It isn't. You're paying upfront
instead of untangling a 600-line mess afterward.

### How to Keep Control of Code Quality

**Hooks** — deterministic actions that run regardless of what you said in CLAUDE.md:

```bash
# Claude will write the hook for you, just ask:
"Write a hook that runs ESLint after every file edit"
"Write a hook that blocks writes to the /migrations/ folder"
```

Hooks live in `.claude/settings.json` and run unconditionally. They're the "actually enforce this"
layer that fills in where advisory instructions fall short.

**Code review slash command:**

```
Write me a /review slash command that:
1. Takes the current diff (git diff)
2. Reviews it as a staff engineer would
3. Flags: spaghetti code, over-commenting, single-responsibility violations,
   missing error handling, anything I'd be embarrassed to push
```

**Maintaining your personal coding style:**

The mechanism is simple: CLAUDE.md + the living lessons log. Every time Claude writes something in a
way you don't like:

1. Reject the change
2. Explain why
3. Add a rule to the "Things Claude Got Wrong" section of CLAUDE.md

> Over time, CLAUDE.md becomes a fairly accurate specification of how _you_ write code. Claude stops
> reinventing your preferences from scratch every session.

### Parallel Sessions for Larger Features

Running multiple Claude sessions simultaneously is possible — keep them isolated using **git
worktrees** so they don't clobber each other:

```bash
git worktree add ../my-project-feature-x feature-x
cd ../my-project-feature-x
claude   # fresh session, isolated context
```

### Practical Anti-Spaghetti Rules for CLAUDE.md

```markdown
## Code Quality (Non-Negotiable)

- Functions max 40 lines. If it's longer, split it. No exceptions, no negotiations.
- No deep nesting. If you're at 4 levels of indentation, something went wrong upstream.
- No god objects. One class, one responsibility.
- Comments explain WHY. If you're explaining WHAT the code does, the code is unclear.
- Self-documenting code is the goal. Comments are for intent, not narration.
```

When reviewing a diff, ask: _"Would I have written it this way?"_ If no — reject it and say why.
That feedback ends up in CLAUDE.md, and you get a little less of it next time.

---

## E) Keeping Documentation Updated Without It Becoming a Second Job

### CLAUDE.md as a Living Document

The most important documentation for a Claude Code project is CLAUDE.md itself. Treat it like code:

- **Commit it to Git** — the whole team shares the same context and the same rules
- **Prune regularly** — remove rules that no longer apply; dead instructions dilute the real ones
- **Test it** — if Claude keeps ignoring a rule, either rephrase it or add `IMPORTANT:` before it

### Automatic Docs Updates After Changes

Add this to CLAUDE.md:

```markdown
## Documentation

After every completed feature or API change:

1. Update the relevant section in docs/
2. If the public API changed, update the README example
3. Commit docs in the same commit as the code — not "I'll do it later"
```

"I'll do it later" is where documentation goes to die.

### /handoff Pattern — Passing Context Between Sessions

Create a slash command in `.claude/commands/handoff.md`:

```markdown
Check for an existing HANDOFF.md. Then create or update it with:

- Goal of the current session
- What was completed
- What worked / what didn't
- Next steps

Use $ARGUMENTS for any additional notes.
```

At the start of a new session: `Read HANDOFF.md and continue.` That's it. No re-explaining, no
context archaeology.

### Skills for Documentation

Create `.claude/skills/docs-update/SKILL.md`:

```markdown
---
name: docs-update
description: Update project documentation after code changes
---

# Documentation Workflow

After every feature:

1. Identify changed public API or behavior
2. Find relevant files in docs/
3. Update examples and descriptions
4. Check README consistency
```

Invoke it explicitly with `/docs-update`, or let Claude pick it up automatically when it's relevant.

---

## Quick Reference

| Action                          | Key / Command                  |
| ------------------------------- | ------------------------------ |
| Enter Plan Mode                 | `Shift+Tab` (twice) or `/plan` |
| Auto-accept edits mode          | `Shift+Tab` (once)             |
| Clear session context           | `/clear`                       |
| Compress context                | `/compact`                     |
| Browse past sessions            | `--resume`                     |
| Rename current session          | `/rename`                      |
| View configured hooks           | `/hooks`                       |
| Generate CLAUDE.md from scratch | `/init`                        |

---

## Resources

- [Official Docs](https://code.claude.com/docs)
- [Best Practices (official)](https://code.claude.com/docs/en/best-practices)
- [Common Workflows](https://code.claude.com/docs/en/common-workflows)
- [Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code) — community skills,
  hooks, commands
- [45 Claude Code Tips](https://github.com/ykdojo/claude-code-tips) — genuinely useful, not just
  "have you tried prompting better"
