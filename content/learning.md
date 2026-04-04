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
  the production KPI on a line XY drops below 80%"_ without touching a dashboard. My early PoCs are
  extremely promising.
- **[TanStack Library](https://tanstack.com/):** I am walking around this library a long time, and
  it seems like it is starting to be a new "standard" to make React actually a useful Framework
- **Python/[Django](https://www.djangoproject.com/) Deep Dive:** I'm pushing my Django skills
  further by building a **D&D Narrator**—a system for generating nuanced, pseudo-random location
  descriptions using custom MCP tools for data retrieval.
- ~~**[htmx](https://htmx.org/):** ... mostly as a part of my _Narrator project_~~
  > It's a love/hate thing... and I already know: hate for me :-)
  > [Here is why](/notes/i-try-htmx-so-you-no-need)
- **[Kotlin](https://kotlinlang.org/):** I touched it years ago, but I’m itching to build a proper
  native mobile app to see how the ecosystem has matured.
- **3D Print:** Its inventing a wheel -> but I want to integrate this technology into my
  life/process of creation

---

### Experimental Lab

_Satisfaction score (★☆☆☆☆) based on my current experience._

The number of stars says how much I was satisfied with the tech I chose. Every project in this
section is "not done, and mostly it will be not" – it's just a
[Micro-Project](/notes/new-tech-in-eight-steps/#how-i-learn-new-technology) for testing purpose.

- **AI Audiobook Director:** Building a complex pipeline for _professional_ book translation and
  multi-voice narration.
  - **Multimodel Translation**: Building a system that selects AI models based on literary genre for
    nuanced translation.
    - STATUS: [BETA] - DeepL works, GoogleAI works, GPT -> still wants some money from me, omg - not
      tested yet
  - **Context-Aware Direction:** The system doesn't just "read"; it acts (well - it can) as a
    director. It extracts character metadata to assign specific voices and contextual emotional
    cues. If a character is described as lisping or shouting in the text, the engine automatically
    generates prompts to adapt the speech patterns accordingly.
    - STATUS: this is not working well yet, so I did not provide the code on my GIT - if you are
      interested - write me! :-)
  - **Multimodel Orchestration:** Using genre-specific LLMs for translation and high-fidelity TTS
    (like Coqui/Google TTS Studio) for final audio production.
    - STATUS: DONE! (Soon I will add engine for ElevenLabs)
  - **Designet for poor:** I am using 'everyday free credits' – the system can continue from where
    it ends before the last "error".
  - ~~**The Roadmap:** Currently wrapping the workflow into a one Django-based app with integrated
    credit/payment systems—mostly as a playground to see how far I can push automated content
    creation before I get bored.~~ Currently wrapping the workflow into FastAPI/Strawbery server and
    planing to create some React/SvelteKit(?) app for nice UI.
  - [Project repository](https://github.com/alfonsZelicko/python-ebook-reader) - if you want to
    join - tell me – I will push recent changes on server.
    - ~~_Django+htmx_:&nbsp;★★★★☆~~, _google-cloud_:&nbsp;★★★★★, _OpenAI_:&nbsp;★★★★☆,
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
  - **Skill burning:** I have no plans to adopt this approach in my work. I notice it erodes my own
    programming skills at every level — writing code, reading code, reasoning about it, and making
    decisions. That said, it’s a great tool for translating bugs and for reading or generating
    documentation.
  - **Pretty fast evolution:** I’m generally skeptical of every “new and definitely better than
    ever” release, even though real progress is clearly happening. My star system here can be pretty
    outdated, and it's very personal. Keep it in mind.
    - _copilot_: ★★★☆☆, _openAI_: ★★☆☆☆, _Claude_: ★★★★☆, _Gemini_: ★★★★☆

- **The Hardware Renaissance:** Surprisingly, I’ve rediscovered a love for hardware through
  **Raspberry Pi**. Although electronics bored me in high school, I now find joy in building
  "useless but fun" home automations.
  - **The Fridge Sentry:** I built a system that uses AI image recognition to track who opens the
    fridge. If it’s me, after a little time – it logs the "offense" and emails me (soon SMS) warning
    to stop eating—a perfect example of using sophisticated tech for trivial, yet satisfying,
    personal joy.
  - **Road Map:** Some escalation rules, Better management of warning ("after XX time", etc. ...)
    - _torchvison_: ★☆☆☆☆ -> _facenet-pytorch_: ★★★★☆
