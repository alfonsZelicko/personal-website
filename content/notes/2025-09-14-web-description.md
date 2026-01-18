---
date: "2025-09-14"
title: "Website Technological Description"
slug: "web-description"
categories: ["philosophy", "guide"]
tags: []
params:
  metadescription: "Introduction to my new web/notes"
  metakeywords: "alfons, zelicko, alfons zelicko, personal website"
---

I decided to treat this portfolio as a technical statement rather than just a business card. In a
world of multi-megabyte JavaScript bundles, I wanted to see how far I could go with "dumb" HTML and
clever CSS.

## 1. Switching dark/light mode

The primary goal was **Progressive Enhancement**. The website is fully functional, readable, and
navigable even if you **disable JavaScript entirely**.

- **The Checkbox Hack**: Using hidden `<input type="checkbox">` elements (and placing some labels
  somewhere, ofc) and the `:checked` CSS pseudo-class, I built the theme switcher, contrast toggle,
  and mobile menu without any UI logic in JS.

  ```scss
  // Simplified example of how it works
  html:has(#theme-toggle:checked) {
    --bg-color: #{$color-bg-dark-low-rgb};
    --text-color: #{$color-text-dark-low-rgb};
    ...
  }
  ```

## 2. JS only as a Progressive Enhancement

- **Persistent State**: I added a tiny vanilla JS script (which could be 14 lines, but I made it 52
  to handle proper accessibility titles and aria-labels) only to "remember" user preferences in
  localStorage. If it fails, the site simply defaults to the "warm dark" mode. No big deal.

  ```js
  (() => {
    ["theme", "contrast"].forEach(key => {
      const el = document.getElementById(`${key}-toggle`);
      if (!el) return;

      const saved = localStorage.getItem(key);
      if (saved !== null) el.checked = saved === "true";

      el.addEventListener("change", () => {
        localStorage.setItem(key, el.checked);
      });
    });
  })();
  ```

> feel free to 'inspire yourself' from this approach - we need less JS on the web :-)

- **Email obfuscation**: Not bulletproof by design, but sufficient to avoid trivial scraping.
  Extracting the address requires JavaScript execution or simulated user interaction, so even
  relatively advanced bots (e.g. using Puppeteer or Playwright) face additional friction.

  ```html
  <span id="mail-vault" class="link"> zelicko [dot] alfons [at] gmail [dot] com </span>

  <script>
    (() => {
      const el = document.getElementById("mail-vault");
      if (!el) return;

      el.textContent = "[REVEAL EMAIL ADDRESS]";
      el.style.cursor = "pointer";
      el.setAttribute("role", "button");
      el.setAttribute("aria-label", "Reveal email address");

      el.addEventListener(
        "click",
        () => {
          const p = ["gmail", "com", "alfons", "zelicko"];
          const addr = `${p[3]}.${p[2]}@${p[0]}.${p[1]}`;

          const a = document.createElement("a");
          a.href = `mailto:${addr}`;
          a.textContent = addr;

          el.replaceWith(a);
        },
        { once: true }
      );
    })();
  </script>
  ```

## 3. Design: Less Noise, More SVG

When a website has almost no _traditional graphics_, every single remaining element carries more
weight. I wanted to see how far I could go with just "dumb" HTML and clever CSS.

- **SVG over Images**: Instead of loading heavy image assets, I used inline SVGs. To keep things
  lightweight, I used native SMIL animations (`<animate>`) directly inside the SVG code. This means
  no complex CSS keyframes or bulky JS libraries—just high-performance, native icon transitions like
  the rotating sun or the morphing menu.
- **Visual Ergonomics**: I prioritized readability over flashiness. The typography (Noto Sans Mono
  and Anonymous Pro) evokes a terminal-like feel, and the "low contrast" mode uses a warm,
  paper-like cream background to reduce eye strain.
- **Speed as a Feature**: The site is optimized to feel instant, even on a shitty connection that
  would make a modern SPA crumble. It's a nod to a time when speed was a necessity, not a luxury...
  when **EDGE was a fast internet connection**, not a poor Browser :-)
- **Special Elite**: The largest asset on this page. I’ve wanted to use this font on a website for a
  long time, so I decided to use it here - on my own.
- **view-transition**: I added this CSS property to make page transitions smoother. The default fade
  effect works well enough for me. It’s a relatively new CSS feature, and in browsers that don’t
  support it, the page behaves as usual.
  ```css
  @view-transition {
    navigation: auto;
  }
  ```
- **link underline animation**: The basic underline fits the _philosophy of the basic web_, but it
  was too hard to resist adding something a little more elegant.

## 4. Email Form

I am using standard HTML form elements, with a simple css animation to make the form look more
pleasing. Same _scss_ code is used to animate Lists (in [Notes](/notes) section) as on my _main_
page as well.

```scss
%in-animation {
  transition:
    opacity 0.3s ease,
    transform 0.3s ease;
  transition-delay: calc((sibling-index()) * 50ms);

  @starting-style {
    opacity: 0;
    transform: translateY(-20px);
  }
}
```

For sending an email Iam using [Formspree](https://formspree.io/) service. It works well: the form
is submitted via AJAX to the _Formspree_ endpoint (and resend as email to my mailbox), and the
result is returned to the user. _Formspree_ also protects against spam bots.

```js
async function handleSubmit(event) {
  event.preventDefault();
  const data = new FormData(event.target);

  try {
    const response = await fetch(event.target.action, {
      method: "POST",
      body: data,
      headers: {
        Accept: "application/json",
      },
    });
    formStatus.innerHTML = response.ok ? "Thanks for message!" : `Oops! ${errorMessage}`;
  } finally {
    formStatus.classList.add("show-message");
    form.reset();
  }
}
```

With no JS on the form will send the email and refresh the page. With JS enabled, the JS will send
the email and show a success message.

## 5. Notes

[Notes](/notes) section is some kind of my personal journal/notes about technologies I found. I am
using [Hugo](https://gohugo.io/) to generate static HTML pages. I added discussions to each note,
using a Giscus comment widget. Every one hour I am generating stats into a JSON file and uploading
it on my GitHub Gist, and the JS script reads it and enhances the page note info. With no JS you
will just see no additional info about the note.

## 6. The Stats

- **Build Time**: ~25ms (Hugo is incredibly fast)
- **Page Weight**: ~62 KB (it's 83x less than facebook welcome page)
- **Lighthouse Score**: 100/100/100/100

> Special thanks to the minds behind [motherfuckingwebsite.com](https://motherfuckingwebsite.com)
> and its successors. Your work amused me, then caught me off guard, and ultimately helped me
> rethink how I build for the web.
