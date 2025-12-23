+++
date = "2025-09-14"
title = "Web Tech Description"
slug = "web-description"
categories = ["philosophy"]
tags = []

[params]
metadescription = "Introduction to my new web/notes"
metakeywords = "alfons, zelicko, alfons zelicko, personal website"
+++

# Technical Aspects of the WebSite

I decided to treat this portfolio as a technical statement rather than just a business card. In a
world of multi-megabyte JavaScript bundles, I wanted to see how far I could go with "dumb" HTML and
clever CSS.

### 1. The "Zero JS" State

The primary goal was **Progressive Enhancement**. The website is fully functional, readable, and
navigable even if you disable JavaScript entirely.

- **The Checkbox Hack**: Using hidden `<input type="checkbox">` elements and the `:checked` CSS
  pseudo-class, I built the theme switcher, contrast toggle, and mobile menu without any UI logic in
  JS.
- **The Logic**:

```scss
// Simplified example of how it works
html:has(#theme-toggle:checked) {
  --bg-color: #{$color-bg-dark-low-rgb};
  --text-color: #{$color-text-dark-low-rgb};
}
```

- **Persistent State**: I added a tiny vanilla JS script (which could be 14 lines, but I made it 52
  to handle proper accessibility titles and aria-labels) only to "remember" user preferences in
  localStorage. If it fails, the site simply defaults to the "warm dark" mode. No big deal.

```js
// minimalistic version of saving the theme/contrast state
(() => {
  const keys = ["theme", "contrast"];

  keys.forEach(key => {
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

### 2. Design: Less Noise, More SVG

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

### 3. The Stats

- **Build Time**: ~25ms (Hugo is incredibly fast)
- **Page Weight**: ~62 KB (it's 83x less than facebook welcome page)
- **Lighthouse Score**: 100/100/100/100

> Big thanks to the legends behind [motherfuckingwebsite.com](https://motherfuckingwebsite.com),
> [bettermotherfuckingwebsite.com]https://(bettermotherfuckingwebsite.com), and
> [thebestmotherfucking.website](https://thebestmotherfucking.website/). Your work first made me
> laugh, then made me think, and eventually helped me find my way back to the basics.
