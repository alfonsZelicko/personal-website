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

### 2. Visual Curation: Less is More

When a website has almost no traditional "graphics," every single remaining element carries more
weight. This intentional absence of clutter creates a stage for subtle details.

- **The Icons**: I used inline SVGs with native SMIL animations (`<animate>`). Because the rest of
  the site is so quiet, the tiny rotation of the sun or the morphing of the menu button becomes a
  focal point rather than a distraction.
- **Typography**: I chose **Noto Sans Mono** and **Anonymous Pro**. These fonts evoke a "terminal"
  or "typewriter" feel that aligns with the engineering focus, while the `font-display: swap`
  ensures they load without blocking the content.
- **Warm Palettes**: I prioritized visual ergonomics. The "low contrast" mode uses a paper-like
  cream background (`rgb(235, 225, 200)`) to reduce eye strain during long reading sessions - if
  somebody has these ambitions. :-)

### 3. SVG as the Only "Graphic"

Instead of loading heavy image assets, I used inline SVGs.

- **SMIL Animations**: Instead of complex CSS keyframes or JS animation libraries, I used the native
  `<animate>` tag inside SVGs. This allows for elegant, high-performance icon transitions—like the
  rotating sun or the morphing hamburger menu—that are part of the asset itself.
- **Low internet connection**: The site is optimized to be fast enough to feel "instant" even on
  connections that would make a modern SPA crumble. It's a nod to a time when speed was a necessity,
  not a luxury.

### 4. The Stats

- **Build Time**: ~25ms (Hugo is incredibly fast)
- **Page Weight**: ~62 KB (it's 83x less than facebook welcome page)
- **Lighthouse Score**: 100/100/100/100

This web isn't just about speed; it's about meaningful engineering. It’s proof that you don't need a
massive framework to create a responsive, accessible, and visually pleasing experience.
