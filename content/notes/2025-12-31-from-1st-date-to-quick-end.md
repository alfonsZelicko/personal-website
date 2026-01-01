---
title: "I have opinion: htmx sucks"
date: 2025-12-31T14:23:47+01:00
slug: "2025-12-31-from-1st-date-to-quick-end"
categories: []
tags: ["programming"]
draft: true
params:
  metadescription:
    "My honest look at htmx. From nostalgic love to quick end in reality of modern web dev."
  metakeywords: "htmx, react, framework, web development, critique"
---

{{< img src="htmx.png" alt="Love on 1st view" caption="I felt nostalgia for something I lost." >}}

Do you know the meme? In 2010 we had PHP and jQuery and everything was simple... and mess. Then came
2012 and JS wanted to do all the "V" in [MVC](https://en.wikipedia.org/wiki/Model–view–controller).
But very fast it went crazy and around 2016 React was the whole MVC[^1]. Millions of sub-frameworks,
everyone from different author, everything works only because of strong will (and hundreds of
`node_modules`) and prayers after every `npm upgrade`[^2]. And when it breaks, nobody knows why.
DevTools are not enough for debug, because endless line of anonymous async functions starting
somewhere in hell just doesn't make sense...

... And then **\<htmx\/\>** appeared. It promised exactly what we all wanted: fast, easy to use,
modern framework.

{{< img src="new-framework-promise.png" w="420" alt="meme - new framework - inspired by IT" caption="Another new solution for old bugs!" >}}

### Phase 1: Honeymoon (Delete 15 000 lines of code!)

My journey started with excitement. I saw a talk from
[DjangoCon 2022](https://www.youtube.com/watch?v=3GObi93tjZI). David Guillo was talking how they
threw away React, deleted 15 000 lines of code, removed about 250 dependencies and their life was
better. "No API contracts! No type duplication! Just send HTML fragment and \<htmx\/\> puts it
there!"

It sounded like salvation. Finally, a framework made to fix mistakes of all previous frameworks...
No TypeScript overhead, no state on frontend. Just you and your backend. So I tried it with my own
[framework stress test](/notes/new-tech-in-eight-steps#my-framework-stress-test).

### Phase 2: First cracks in the wall

> But then you start building something more than "Hello World". And it starts to be hard.

First thing that surprised me was **architectural inconsistency**. You find out that `hx-get`
behaves differently in different places. Sometimes you expect it replaces whole element, sometimes
only inside. Suddenly you are writing logic inside HTML attributes where it should never be.

When you need that one click updates three different parts of page which are not connected, this
"simplicity" starts to hurt. You must use `hx-swap-oob` (out-of-band), which is basically a "GOTO"
command for HTML. Or you start making strange "HTML puzzles" on server which breaks all clean code.

#### ...but let's talk real:

1.  **"OOB" (Out-of-Band) Hell**

    In \<htmx\/\>, the "clean way" is that you click a button and it replaces itself with new HTML.
    But in real app, you click "Add to cart" and you want:

- Change text of button.
- Update cart icon in header.
- Show notification in corner.

  > Server returns a blob of HTML with `hx-swap-oob="true"` tags. Every tag is like a hidden jump
  > instruction. **Congratulations, in 2024 you invented GOTO again**, you just call it hypermedia.

2.  **Loss of "Single Source of Truth"**

    In React/Vue you know the state of app is in JS. In \<htmx\/\> the state is... where? A bit in
    database, a bit in URL, a bit in DOM and a bit in head of programmer who must remember what
    happens when user clicks Back button in browser.

3.  **Let's talk about debugging**

    **React:** We all know debug in React is masochism. Callstack looks like script for
    [Tenet](https://www.imdb.com/title/tt6723592/) movie and without
    [React Dev Tools](https://chromewebstore.google.com/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
    you are lost. BUT: it shows you big red error. And when you throw away your pride and copy-paste
    whole callstack to AI, it actually makes sense...

    **\<htmx\/\>:** When something breaks in \<htmx\/\>, you debug three things of chaos at once:
    _server_, _client_ and _library itself_. You look at Network tab at HTML fragments, then you
    jump to backend templates and finally you find out this "bug" is native behavior of library
    which goes against logic and everyone hates it... and all this only if you actually find out it
    is broken. \<htmx\/\> communicates errors like old married couples after 20 years – it says
    nothing[^3]...

### Phase 3: Codebase shock and waking up

I started to doubt – what am I doing wrong... But then I found texts and videos which confirmed I am
not crazy:

1. **Chris Done** and his [great critique](https://chrisdone.com/posts/htmx-critique/): \<htmx\/\>
   deletes code on frontend, but price is that it makes terrible "coupling" between server and
   client.
2. **The Primeagen** and his
   [waking up from \<htmx\/\>](https://www.youtube.com/watch?v=9AtijVV11SA): \<htmx\/\> fails when
   you need to sync state on client. Which is almost every modern web today.
3. Author himself in essay [\<htmx\/\> sucks](https://htmx.org/essays/htmx-sucks/) says it is an
   "ugly hack".

### Phase 4: Synthesis

My verdict? \<htmx\/\> is great demo, but dangerous product.

- **Modern stack (React/Next)** is full of JS, last X versions only bring fixes for fixes of their
  own concepts... but at least you have **diagnostics**. You know where data ends and UI starts.
- **\<htmx\/\>** is sweet nostalgia. We feel we go back to simplicity, but it is only because we
  forgot why we ran away so fast before. \<htmx\/\> reminds us that "good old days" were actually
  mess. It reminds us why we made all modern workflows and frameworks which we now hate with love.

### Conclusion: Back to brain

Don't be drunk from memes. \<htmx\/\> is not revolution. It is a nostalgic trip which reminded us
that HTML is powerful, but also showed us why we actually built modern frameworks.

I have a confession: Once upon a time, I wrote my own framework very similar to \<htmx\/\>. It was
back in the days of Angular 0.8. It was built around jQuery and the core of the whole thing was
basically just `$.load()`...

```javascript
// My "revolutionary" framework in 2012
$("#result").load("ajax/test.html");
```

I think I was not the only one. It feels like someone just found their old project after many years,
finished it, and then it became overhyped for a moment...

```html
<button hx-get="/ajax/test.html" hx-target="#result">Load</button>
```

[^1]:
    At start, great idea: "we make big JS framework, server will be only stupid data provider and no
    HTML building". Little later, even better idea: "and when we have it, we put load on server
    again – it will run on JS and build HTML too". And Next.js was born.

[^2]:
    And I am not talking only about classic prayer if developers accidentally made some
    incompatibility... but good old
    [trojans](https://www.blackduck.com/blog/recent-npm-software-supply-chain-attack-security-lessons.html)
    which come to stable production and drink all your AWS credits by crypto mining faster than real
    bugs kill the server.

[^3]:
    Yes, I found some videos where guy used some special tool which helps a bit – but exactly only
    that much. A BIT. (Imagine the tractor mechanic voice: "It is all just SH\*T").
