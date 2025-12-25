---
title: "Learning"
url: "/experience/learning/"
---

## Learning & Research

I treat my learning as a continuous R&D process. While I'm still deciding on the final home for my
public repositories (the classic GitLab vs. GitHub dilemma), my main focus is currently on building
a [Notes](/notes) section—a place to synthesize my findings and architectural rants - here I will
try to make some kind of "tech report from my perspective" about the project from my
[Future Tech Radar](/experience/learning#future-tech-radar) section.

### Future Tech Radar

Technologies I am currently play with:

- **[Model Context Protocol](https://modelcontextprotocol.io/docs/getting-started/intro) (MCP):** I
  believe this is a game-changer for "UI-less" apps. Imagine asking your system: _"Set an alert if
  the production KPI on line XY drops below 80%"_ without touching a dashboard. My early PoCs are
  extremely promising.
- **Python/[Django](https://www.djangoproject.com/) Deep Dive:** I'm pushing my Django skills
  further by building a **D&D Narrator**—a system for generating nuanced, pseudo-random location
  descriptions using custom MCP tools for data retrieval.
- **[htmx](https://htmx.org/):** ... mostly as a part of my _Narrator project_
  > I know it's already here - but i dont care :-) I want my own!
- **[Kotlin](https://kotlinlang.org/):** I touched it years ago, but I’m itching to build a proper
  native mobile app to see how the ecosystem has matured.
- **3D Print:** Its inventing a wheel -> but i want more integrate this technology into my
  life/process of creation

---

### Experimental Lab

_Satisfaction score (★☆☆☆☆) based on my current experience._

The number of stars says how much i was satisfy with tech i choosed. Every project in this section
is "not done and mostly it will be not" - its just a
[Micro-Project](/notes/new-tech-in-eight-steps/#how-i-learn-new-technology) for testing purpose.

- **AI Audiobook Director:** Building a complex pipeline for _professional_ book translation and
  multi-voice narration.
  - **Multi-model Translation**: Building a system that selects AI models based on literary genre
    for nuanced translation.
  - **Context-Aware Direction:** The system doesn't just "read"; it acts (well - it can) as a
    director. It extracts character metadata to assign specific voices and contextual emotional
    cues. If a character is described as lisping or shouting in the text, the engine automatically
    generates prompts to adapt the speech patterns accordingly.
  - **Multi-model Orchestration:** Using genre-specific LLMs for translation and high-fidelity TTS
    (like Coqui/Google TTS Studio) for final audio production.
  - **Designet for poor:** I am using 'everyday free credits' - system can continue from where it
    ends before last "error".
  - **The Roadmap:** Currently wrapping the workflow into a one Django-based app with integrated
    credit/payment systems—mostly as a playground to see how far I can push automated content
    creation before I get bored.
    - _Django+htmx_:&nbsp;★★★★☆, _google-cloud_:&nbsp;★★★☆☆, _OpenAI_:&nbsp;★★★★☆,
      _PyTorch_:&nbsp;★★★☆☆, _COQUI_:&nbsp;★★☆☆☆

- **VibeCoding & The Drunk Senior:** I am actively exploring LLM-driven development, but I treat the
  AI like a brilliant but perpetually drunk developer.
  - **The Mindset**: It’s a double-edged sword. I use it to bypass documentation and accelerate
    prototyping, but I maintain a "zero-trust" policy. I assume the AI is trying all the time to
    "prank" me with subtle bugs.
  - **Micro-Tasking**: To avoid losing touch with the codebase, I feed it strictly small, atomic
    tasks. If you let it write too much at once, you lose the "feel" of the code—and that’s a trap I
    refuse to fall into.
  - **Quick orientation:** As a tool for quick orientation in a new project, it’s AWESOME and a
    massive time-saver! It’s also perfect for writing documentation and handling all the tedious
    tasks we usually hate.
  - **Skill burning:** Skill burning: I have no plans to adopt this approach in my work. I notice it
    erodes my own programming skills at every level — writing code, reading code, reasoning about
    it, and making decisions. That said, it’s a great tool for translating bugs and for reading or
    generating documentation.
  - **Pretty fast evolution:** I’m generally skeptical of every “new and definitely better than
    ever” release, even though real progress is clearly happening. My star system here can be pretty
    outdated, and it's very personal. Keep it in mind.
    - _copilot_: ★★★☆☆, _openAI_: ★★☆☆☆, _claude_: ★★★★☆,

- **The Hardware Renaissance:** Surprisingly, I’ve rediscovered a love for hardware through
  **Raspberry Pi**. Although electronics bored me in high school, I now find joy in building
  "useless but fun" home automations.
  - **The Fridge Sentry:** I built a system that uses AI image recognition to track who opens the
    fridge. If it’s me, afte few time - it logs the "offense" and sends me an email (soon SMS)
    warning to stop eating—a perfect example of using sophisticated tech for trivial, yet
    satisfying, personal joy. -**Road Map:** Some escalation rules, Better management of warning
    ("after ... time", etc. ...)
    - _torchvison_: ★☆☆☆☆ -> _facenet-pytorch_: ★★★★☆
