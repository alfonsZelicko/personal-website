## Learning & Research

I treat my learning as a continuous R&D process. While I'm still deciding on the final home for my
public repositories (the classic GitLab vs. GitHub dilemma), my main focus is currently on building
a [Notes](/notes) section—a place to synthesize my findings and architectural rants.

### Future Tech Radar

Technologies I am currently play with:

- **Model Context Protocol (MCP):** I believe this is a game-changer for "UI-less" apps. Imagine
  asking your system: _"Set an alert if the production KPI on line XY drops below 80%"_ without
  touching a dashboard. My early PoCs are extremely promising.
- **Python/Django Deep Dive:** I'm pushing my Django skills further by building a **D&D Narrator**—a
  system for generating nuanced, pseudo-random location descriptions using custom MCP tools for data
  retrieval.
  > I know it's already here - but i dont care :-) I want my own!
- **Kotlin:** I touched it years ago, but I’m itching to build a proper native mobile app to see how
  the ecosystem has matured.

---

### My Framework Stress-Test

I stopped chasing every new framework long ago. Instead, I try to understand the "soul" of the
technology. Whether it's the latest frontend hype or a new backend engine, I always look for the
same basic answers:

- **How does it handle change?** _(Is it "pushing" updates or constantly recalculating everything?)_
- **How do data get to the user?** _(Is it a smooth stream or a clunky "wait-for-load" experience?)_
- **How does it stay organized?** _(How do different parts of the app talk to each other without
  creating a mess?)_

If a framework can't give me a clear, pragmatic answer to these, it’s just more syntax to
memorize—and I’m not interested in that. I’d rather master the principles that stay the same while
the tools change.

#### How I learn new yechnology

1. **Why & What:** Why does it exist? What pain point does it solve? (Don't touch the code yet).
2. **The "Hate-Test":** Search for _"Why [Tech] sucks"_ on Reddit/X. Find the architectural
   "gotchas" early.
3. **The First Contact:** Standard "Hello World" and installation.
4. **Mind Mapping:** Dive into core concepts. Identify unique patterns and "learning debt."
5. **Reverse Engineering:** Break the official demos. See how the system reacts to chaos.
6. **Targeted Deep Dive:** Read the heavy API docs only after feeling the practical friction.
7. **Micro-Project:** Build something real. Solve routing, forms, and data fetching.
8. **Synthesis:** Connect it to the universal mental model. **Project + Notes = Retention.**

---

### Experimental Lab

_Satisfaction score (★☆☆☆☆) based on my current experience._

The number of stars says how much i was satisfy with tech i choosed

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
    - _copilot_: ★★★☆☆, _openAI_: ★★★☆☆, _claude_: ★★★★☆,

- **The Hardware Renaissance:** Surprisingly, I’ve rediscovered a love for hardware through
  **Raspberry Pi**. Although electronics bored me in high school, I now find joy in building
  "useless but fun" home automations.
  - **The Fridge Sentry:** I built a system that uses AI image recognition to track who opens the
    fridge. If it’s me, afte few time - it logs the "offense" and sends me an email (soon SMS)
    warning to stop eating—a perfect example of using sophisticated tech for trivial, yet
    satisfying, personal joy. -**Road Map:** Some escalation rules, Better management of warning
    ("after ... time", etc. ...)
    - _torchvison_: ★☆☆☆☆ -> _facenet-pytorch_: ★★★★☆
