---
title: "My Dev Environment in 2026: Cursor, Ollama, and n8n Orchestration"
date: 2026-10-20T13:30:00+02:00
tags: ["AI", "Agentic Coding", "MCP"]
categories: ["programming", "guide"]
params:
  metadescription:
    "An updated look into my development setup: how I orchestrate Cursor, Ollama, and local models
    with n8n automation for automated Jira workflows, testing, and dev feedback."
  metakeywords:
    "dev environment, Cursor, Ollama, Qwen, n8n, AI orchestration, developer setup, local AI,
    automated testing, Jira automation"
---

A while ago, I described my [dev environment](/notes/2026-01-02-dev-environment). On the hardware
side, not much has changed—the setup is still holding up well and doing its job. The only upgrade
I'm currently eyeing is picking up a decent **second-hand RTX 3090**. Having 24 GB of VRAM for
running local models makes more and more sense, mainly for low latency and cutting down cloud API
costs.

> Before diving into the setup, a quick disclaimer: **it doesn't make much sense to pin down exactly
> which model I use for which specific task**, simply because the landscape evolves so fast. Models
> get upgraded or surpassed every few weeks. What matters most to me is having a flexible setup
> where I can easily switch models on the fly depending on what's currently performing best.

Here is how my workflow and toolchain look today.

## Cursor & Ollama

**Cursor** has become my primary editor. The reason is straightforward: pretty much everyone is
using it, the AI integration is seamless, and it eliminates a ton of routine overhead.

On the local side, I run **Ollama** hosting **Qwen 7B** (_qwen2.5-coder:7b to be specific, but is
just a poor solution for poor people_). I rely on this smaller local model for quick, lightweight
tasks where burning cloud credits on Claude or GPT would be overkill:

- Rapid data formatting and parsing[^1].
- Extracting useful info from log dumps.
- **Browser console monitoring:** I have Qwen hooked up directly to my browser's developer console.
  When an error pops up, it instantly breaks down what went wrong and points me to the issue.

## n8n Orchestration and the Dev Cycle

I’ve managed to automate most of my project management and development loop using **n8n**. Instead
of manually jumping between tools, the orchestration pipeline works like this:

1. **Ingestion:** I drop a message in Slack or reply to an email with a new feature request or bug
   report.
2. **Analysis & Jira:** An analysis model processes the message, breaks it down into actionable
   tasks, and creates tickets in Jira.
3. **Refinement & Acceptance Criteria:** Once the ticket lands in Jira, another model picks it up to
   refine the prompt and add precise Acceptance Criteria. The goal here is strict scope
   control—building and testing only what is strictly necessary.
4. **Model Selection:** Based on task complexity, the system assigns the right model for the job
   (whether that's Claude, Gemini, GPT, or local Qwen).
5. **Coding & Test Suite:** The assigned model generates the implementation, writes tests, and
   triggers the test suite. If tests fail, the output feeds back into the model for fixes, repeating
   the loop.
6. **Watchdog (Circuit Breaker):** To prevent AI models from getting stuck in an infinite
   loop—endlessly patching broken code with more broken code—a supervisor model monitors the cycle.
   It tracks iteration counts and diff changes. If it detects the system spinning its wheels, it
   kills the loop and hands the task over to me for manual review.

## Review and Approval

Once the test suite passes green, the system generates a concise summary of all changes alongside a
proposed Git commit. I give it a quick review, hit `Approve`, and the code gets pushed to the
server.

## RIP IntelliJ (For Now)

IntelliJ is still great—if you fully commit to their ecosystem[^2]. But its classic superpower, deep
static code analysis, just isn't the game-changer it used to be in the age of AI orchestration.

I still love the environment, but I'm moving away for now. I keep hoping JetBrains will bring
proper, native support for local models like Cursor does, but right now, a lightweight and flexible
setup makes way more sense.

How are you handling your AI orchestration and test automation?

[^1]:
    For things like "proper code formatting" I am still using old-fashioned tools, like prettier,
    etc., but in the future I have plan to look up on Vite+ and I believe, this will change my
    workflow again, if the rumors are right :-)

[^2]:
    I haven't tested how deeply Junie (and rest of it) orchestrates with the rest of their
    stack—YouTrack, TeamCity, etc. If anyone reading this has actual hands-on experience with that
    full JetBrains loop, I'd love to hear how well it actually holds up in practice.
