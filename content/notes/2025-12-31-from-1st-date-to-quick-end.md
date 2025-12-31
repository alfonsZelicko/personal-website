---
title: "I tried <htmx/>, so your souls can stay pure"
date: 2026-01-01T00:23:47+01:00
slug: "2025-12-31-from-1st-date-to-quick-end"
categories: ["programming"]
tags: ["react", "htmx"]
params:
  metadescription:
    "A journey into htmx: from the heretical excitement of deleting code to the total destruction of
    architectural order."
  metakeywords: "htmx, wh40k, frontend, react, programming, heresy"
---

> **Administratum Warning**: I just finished another **Warhammer 40k** chronicle. If you don't
> understand terms like „Exterminatus“ or „Machine Spirit“, consider it a test of your faith. The
> Emperor protects, but you are the one writing the damn code.

{{< img src="htmx.png" alt="Love on 1st view" caption="I felt nostalgia for something I lost in the depths of the Dark Age of Technology" >}}

You know that meme? In 2010, we had PHP and jQuery. Everything was simple... and total chaos. Pure
Warp. Then 2012 came and JavaScript wanted to take over the whole „V“ in
[MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller). For a moment, there was
a fragile peace, Pax Imperialis. But very quickly, things went out of control. By 2016, React became
the whole MVC[^1] — basically a god that requires blood sacrifices. Millions of sub-frameworks, each
from a different heretical cult, everything held together by pure will (and thousands of
`node_modules`) and ritual prayers after every `npm upgrade`[^2]. And when it breaks, not even a
[Cogitator](https://warhammer40k.fandom.com/wiki/Cogitator) knows why. DevTools are useless because
the infinite line of anonymous async calls, starting somewhere in the
[Eye of Terror](https://warhammer40k.fandom.com/wiki/Eye_of_Terror), just makes no sense...

... And then **\<htmx\/\>** appeared on the scene. It was shining like the
[Astronomican](https://warhammer40k.fandom.com/wiki/Astronomican) itself and promised exactly what
we all wanted: a fast, easy-to-use, modern framework. The Holy Grail of the clean web.

{{< img src="new-framework-promise.png" w="420" alt="meme - new framework" caption="Another false prophet promising salvation from old sins!" >}}

### Phase 1: Honeymoon ([Exterminatus](https://warhammer40k.fandom.com/wiki/Exterminatus) of 15,000 lines of code!)

My journey started with religious ecstasy. I watched a talk from
[DjangoCon 2022](https://www.youtube.com/watch?v=3GObi93tjZI), where David Guillo described how they
threw away React, deleted 15,000 lines of code, got rid of hundreds of dependencies, and their lives
became colorful again. „No API contracts! No type duplication! Just send an HTML fragment and htmx
sticks it there like a seal of purity!“

It sounded like salvation from the Emperor. No TypeScript overhead, no state management on the
frontend. Just you and your backend. So I decided to put it through my own
[framework stress test](/notes/new-tech-in-eight-steps).

### Phase 2: First cracks in the Terminator armor

But then you start building something more than just a „Hello World“. And it starts to grind like
sand in the gears of a Dreadnought.

1. **Architectural inconsistency**: You find out that `hx-get` behaves differently in different
   contexts. One time you expect it to replace the whole element, another time just the inside, and
   suddenly you find yourself writing logic into HTML attributes that should never be there. It’s
   like using a ritual dagger to repair a plasma cannon.

2. **The „OOB“ (Out-of-Band) Hell**: In htmx, the „clean way“ is that you click a button and it
   replaces itself with new HTML. But in a real app, you click „Add to cart“ and you want:

- To change the button text.
- To update the cart icon in the header.
- To show a notification (in ritual blue).

At this point, you’re no longer describing UI state — you’re smuggling control flow through HTML.
The server returns an HTML cluster with scattered `hx-swap-oob="true"` markers, each acting like a
hidden jump instruction. **Congratulations, you just reinvented GOTO in 2024**, you just call it
hypermedia.

3. **Debugging in the Immaterium**: Debugging **\<htmx\/\>** is like watching the flow of demons.
   When something breaks, you are debugging the **Holy Trinity of Chaos** at the same time: _the
   server_, _the client_, and the _library itself_. You stare at HTML fragments in the Network tab,
   jump into backend templates, and finally realize that the thing driving you crazy is not a bug,
   but a **feature**. A feature that everyone has hated for two years, has 242 hacks for it (which
   is also the total user base), and nobody uses it the „original“ way anyway.

> You are deep in the hole. Htmx communicates errors like couples after 20 years of marriage (or
> like the Emperor's corpse talks to humanity)[^3].

4. **Loss of „Single Source of Truth“**: Where is the state? A bit in the database, a bit in the
   URL, a bit in the DOM, and a bit in the head of the programmer who must remember what happens
   when the user clicks „Back“. It’s like navigating a ship without a
   [Gellar Field](https://warhammer40k.fandom.com/wiki/Gellar_Field).

### Phase 3: Codebase shock and waking up

I started to doubt. Then I found texts and videos that confirmed I’m not crazy (or at least no more
than a standard Inquisitor):

1. **Chris Done** and his [critique](https://chrisdone.com/posts/htmx-critique/): htmx deletes code,
   but creates an unsustainable coupling that would break the spine of a Space Marine.
2. **The Primeagen** and his [realization](https://www.youtube.com/watch?v=9AtijVV11SA): \<htmx\/\>
   fails when you need to synchronize state on the client.
3. The author himself admits in the essay [htmx sucks](https://htmx.org/essays/htmx-sucks/) that it
   is an ugly hack. Like strapping an Ork rocket to an Imperial tank.

### Phase 4: Synthesis

My verdict? **\<htmx\/\>** is a great demo, but an aluminum cart made by Grotzen. It’s fine for
bringing groceries from the corner store, but you don't want to take it on a highway to the Shrine.
Because on the highway, a wheel falls off and you realize your „return to roots“ is actually just a
fall into the abyss of heresy.

And what about **React**?

At the beginning, I said debugging modern JS is pure masochism, worthy of
[Slaanesh](https://warhammer40k.fandom.com/wiki/Slaanesh) worshippers. And yes, the callstack still
looks like plans for the Golden Throne. BUT: when it breaks, a big red error shows up. If you throw
away your pride and copy that stack into an AI tool, it actually makes sense.

- **Modern stack (React)** might look like a complex, leaking machine where half the parts are
  redundant, but at least you have diagnostics from a Tech-priest. You know where the data ends and
  the UI begins.
- **\<htmx\/\>** is nostalgia. The Imperium venerates the past not because it was better, but
  because all records of why it collapsed were burned as heresy.

I’d rather keep my complex, oily machine. It’s complicated, but at least I know it won't fail me
when the Tyranid invasion begins.

[^1]:
    At the beginning, a great idea: „let's make a massive JS framework, the server will be just a
    dumb data provider“. A moment later, an even better heretical sequel: „and since we have it,
    let's overload the server anyway — it will run on JS and render HTML too“. And
    [Next.js](https://en.wikipedia.org/wiki/Next.js) was born.

[^2]:
    And I'm not just talking about the standard prayer to the Machine Spirit, hoping developers
    didn't by mistake bring some mess/incompatibility... but the good old
    [invoking the spirit of the machine](https://www.youtube.com/watch?v=AWpQAYCvHWM), so no
    [herd of Trojans](https://www.blackduck.com/blog/recent-npm-software-supply-chain-attack-security-lessons.html)
    crawls into the codebase to drink your AWS credits faster than a Dark Eldar drinks souls.

[^3]:
    Yes, I found some videos where a guy used a specialized tool that helps a bit — but only A BIT.
    (Insert the tone: „And the whole thing is basically just SH\*T“).
