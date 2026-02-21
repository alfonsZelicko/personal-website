---
title: "Idea of AI Partner"
date: 2026-02-11T14:55:03+01:00
slug: "2025-02-11-idea-of-ai-partner"
categories: ["programming"]
tags: []
draft: false
---

> This concept is an AI-assisted summary of a project I am currently exploring. It’s a massive
> undertaking, but I want to build a Proof of Concept (POC) just to see how far I can get.

## AI Companion as a Service

A SaaS platform providing persistent, cloud-based AI agents that interact with the player across
various game titles based on shared memory and context.

### Core Architecture Modules

#### A. Game Integration Layer (SDK/Plugin/MOD)

The critical layer for real-time data collection.

- **Implementation:** C++/C# SDK for Unity/Unreal, or a modding layer (e.g., Skyrim/Fallout).
  - **OR** Rust+[FFI](https://doc.rust-lang.org/nomicon/ffi.html)?
- **Data Stream:** WebSocket transmission of game events (Location, Combat State, Inventory, Quest
  Progress...).
- **Event Schema:** Standardized protocol (e.g., `PLAYER_ACTION_EVENT`)[^1].

#### B. Cross-Game Memory & Identity

A unique layer maintaining the player's profile independently of any specific game[^2].

- **Technology:** Vector Database (Pinecone, pgvector) for semantic search + Redis (real-time
  session state)
- **Memory Types:**
  - **Episodic:** Specific experiences from previous games[^4].
  - **Behavioral:** Analysis of player style (aggression, morality, humor)[^4].
  - **Relationship:** Dynamic relationship scoring (Trust, Fear, Affinity).

#### C. Personality & Dialogue Engine

The "brain" of the companion NPC, combining game lore with a learned personality.

- **RAG (Retrieval Augmented Generation):** Dynamic context injection from the specific game's Lore
  DB.
- **Runtime processing pipeline:**
  1.  **Input:** Game Event[^3] + Player Speech + Player chat.
  2.  **Context:** Retrieval from Memory DB + Lore DB[^4].
  3.  **Processing:** LLM (GPT-4o, Claude, or fine-tuned Llama 3).
  4.  **Output:** Dialogue + Emotion tags[^4][^6].

#### D. Multimodal Voice Stack[^5]

Ensuring immersion through low-latency speech processing.

- **STT (Speech-to-Text):** OpenAI Whisper (v2/v3) or Deepgram.
- **TTS (Text-to-Speech):** ElevenLabs or XTTS v2 for voice cloning[^7].
- **Latency Target:** < 1.5s to maintain natural conversation flow.

## Reality Check

The transition from a POC to a viable SaaS faces several "mission-impossible" hurdles that
categorize this project as a high-level architectural exercise (I did not realize it at the
beginning).

### The Semantic Bridge Problem

There is no universal standard for game state data.

**The Gap:** Each game engine (Unity, Unreal, Creation Engine) interprets "world state" differently.

Building a really "universal" SDK is a massive engineering nightmare. Without deep AND per-game
integration, the AI will suffer from "context hallucinations" – I am very sure about it.

### Economic Sustainability (Token Burn)

Running real-time RAG and high-end LLMs is prohibitively expensive.

Using models like GPT-4o for continuous game sessions can cost $20–$50/user/month.

Without moving to a local instance (Small Language Models), the token burn rate makes the SaaS model
non-viable.

IDEA: _so let's make it on local AI models? MBY I can try to make some "crypto" version: players can
share their GPU/CPU and get some "free tokens" for it? Lol - big plans - just a mad idea._

### The Utility vs. Immersion

**Players often prioritize "Wiki-style" help over "Personality-driven" roleplay - and this is much
easier to do -> this will be my first goal.**

If a player only wants to know "Where is the hidden key?", a complex cross-game behavioral memory is
over-engineering.

### Success means BAN

**And let's be honest: If I am even able to start AND finish this project into some usable version
and it will be successful - the game companies behind game studios will instantly ban me, and they
will create their own solution: SASS is for them just too honey pod to them.**

## Implementation Roadmap

1.  **Phase 1 (MVP)[^8]:** Skyrim mod + Voice Chat[^7] + Local RAG (Lore DB).
2.  **Phase 2 (Memory):** Implementation of Vector DB for long-term cross-session references.
3.  **Phase 3 (Platform):** Development of a universal SDK for Unity/Unreal and cross-game
    connectivity. Hihi

[^1]:
    It will be hard to id properly on the 1st draft. Better to do it as some kind of "expandable
    solution".

[^2]: This is a very basic idea that I stole from classic "personalities" designs...

[^3]:
    This will be the hardest part. It needs a game-specific bridge to work properly. My first idea
    was something simple like: “How do I do this? I’ll just ask my AI instead of googling it,” or
    maybe real-world style in-game notifications.

    But real interaction with the game world is much harder. Skyrim has FormIDs, Unity uses
    GameObjects, Unreal has Actors — so it would require a plugin-based architecture. And that’s
    going to be messy.

[^4]:
    Idea behind this is simple: "We should sneak here and kill them all with bow." "... so as your
    typical Skyrim play through? I am not judging you, sir, but playing with you is starting to be a
    little repetitive..."

[^5]:
    This is a very future plan - nice to have: without it - it will be much cheaper and easier to
    do... this can be an improvement for the future. In the 1st iteration enough to use something
    like [SAPI 5](https://www.microsoft.com/en-us/download/details.aspx?id=10121)

[^6]:
    Here is a huge tech. problem with the latency. I am not sure if I will be able to make it quick
    enough to be useful during action scenes...

[^7]: I can use my already done ebook reader engine -> it will need a minimal improvement.

[^8]: It already exists - but I want to do it on my own.
