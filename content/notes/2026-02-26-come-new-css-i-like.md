---
title: "New CSS features I Like most"
date: 2026-02-26T23:20:18+01:00
slug: "2026-02-26-come-new-css-i-like"
categories: ["design", "programming", "guide"]
tags: []
draft: false
params:
  metadescription: ""
  metakeywords: ""
---

> In the last few years there are a lot of new CSS features I want to talk about. Most of them are
> strongly supported, but it would be a nice approach to always make some reasonable fallbacks...

### Corner shape

`corner-shape` is a new CSS property that allows you to specify the shape of the corners of an
element.

[Video](https://www.youtube.com/watch?v=kmfBt1gBAXQ),
[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/corner-shape),
[CanIUse](https://caniuse.com/?search=corner-shape).

```css
.box {
  border-radius: 1.2rem;
  corner-shape: squircle;
}
```

<button style="border-radius: 2rem;corner-shape: squircle; padding: 1rem 2rem;background: orange; border: none">corner-shape:
squircle;</button> vs.
<button style="border-radius: 1rem; padding: 1rem 2rem;background: orange; border: none">corner-shape:
none;</button>

### Animation timeline

`animation-timeline` is a new CSS property that allows you to specify the timeline for an animation.
It is useful for creating smooth animations that are not affected by the scroll position.

Imho most useful values are `view()` (when it gets into the view) and `scroll()` (based on the
scrolling position). **It can pretty easily remove the need of usin `IntersectionObserver` API!**

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timeline),
[CanIUse](https://caniuse.com/?search=animation-timeline).

```css
.scroll-progress {
  animation: scroll-progress linear both;
  animation-timeline: scroll(root block);
}

@keyframes scroll-progress {
  from {
    transform: scaleY(0);
  }
  to {
    transform: scaleY(1);
  }
}
```

### Scroll target group

`scroll-target-group` is a new CSS property that allows you to group elements that are linked to the
same target. This is how I realized the active state in the _Table of contents_ in the top right
corner of this site.

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/scroll-target-group),
[CanIUse](https://caniuse.com/?search=scroll-target-group).

```scss
@supports (scroll-target-group: auto) {
  nav.toc {
    scroll-target-group: auto;

    a:target-current {
      opacity: 1;
      color: var(--color-link-active-rgb);
      padding-left: 0.5rem;
      margin-left: -0.5rem;
    }
  }
}
```

### View transitions

`view-transition` is a new CSS property that allows you to create transitions between different
views. The most simple way to use it is to add the following to your CSS: it will automatically
animate the page when you navigate to a new page with a nice smooth fade in and fade out (as you can
see on my website).

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/@view-transition),
[CanIUse](https://caniuse.com/?search=view-transition).

```css
@view-transition {
  navigation: auto;
}
```

### Starting style

`@starting-style` is a very powerfull feature! Everytime when the element is going to be rendered,
you can show some nice cool animation!

`sibling-index` is a new CSS function that returns the index of the current element in its parent.
It is useful for nice smooth animations. A real life example you can see in [Notes](/notes) - the
animated list of notes, or in [Contact](/contact) as animated form.

You can wind here usage of `sibling-index()` - and here is even `sibling-count()`...

`@starting-style`: [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/@starting-style),
[CanIUse](https://caniuse.com/?search=@starting-style),

`sibling-index()`: [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/sibling-index),
[CanIUse](https://caniuse.com/?search=sibling-index).

```scss
.in-animation {
  transition:
    opacity 0.5s ease,
    transform 0.5s ease;
  transition-delay: calc(sibling-index() * 50ms);

  @starting-style {
    opacity: 0;
    transform: translateY(-20px);
  }
}
```

### New color models

`oklch()` is a new CSS function that converts a color from sRGB to the OKLAB color space. It is
useful for creating color palettes. I strongly recommend paying attention to these new color
formats - it is a very strong tool.

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value/oklch),
[video](https://www.youtube.com/watch?v=4Ypuns-Jq20&t=369),
[CanIUse](https://caniuse.com/?search=oklch), [DEMO](https://codepen.io/argyleink/pen/YzdEapM).

```scss
--primary-color: red;

.red-element {
  color: oklch(var(--primary-color) calc(l - 0.25) c h); //little darker red
  background-color: oklch(var(--primary-color) l c h / 50%); //-> rgba(255, 0, 0, 0.5)
}
```

### Layer

`@layer` is a new CSS at-rule that allows you to group CSS rules into different layers. It is useful
for organizing your CSS code - or while refactoring the old design of the app. It helps to "break
the competition" between different CSS files.

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/@layer),
[CanIUse](https://caniuse.com/?search=@layer).

```scss
@import "props/colors" layer(base);

@layer base {
  body {
    font-family: "Noto Sans Mono", monospace;
    color: var(--color-text); /* <- from props/colors; ONLY inside @layer base */
  }
}
```

### Dark/Light mode switching

`@light-dark` is a thing I like, but I am not using it on this web, because I have a little
different approach here, already. It is a new CSS at-rule that allows you to define different styles
for light and dark themes.

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/@light-dark),
[CanIUse](https://caniuse.com/?search=@light-dark).

```scss
:root {
  --color-text: light-dark(#ffffff, #000000);
}

html {
  &:has(#darkMode:checked) {
    color-scheme: dark;
  }
}
```

### Color mixing

`color-mix()` allows you to mix two colors together. Here is actualy a lot of new CSS functions that
can make the code more clean and readable... you should check them out!

```scss
.color-mix {
  background-color: color-mix(in oklab, var(--color-primary), transparent 50%);
  color: color-mix(
    in oklab,
    var(--color-primary) 90%,
    color-mix(in oklab, var(--color-secondary), black 50%)
  );
}
```

### Search tag

Did you realize here is an element `<search />` that is not in the HTML standard? It is a new
element that allows you to create a search form. It adds a aria-label to the input and a button. If
you use it, you don't need to add the `aria-label` (...) yourself.

_DEMO:_

<search>
  <form style="border: 1px solid var(--color-quote-rgb); padding: 1rem">
    <label for="search">Search</label>
    <input type="search" name="search" id="search" />
    <button type="submit">Search</button>
  </form>
</search>

```html
<search>
  <form>
    <label for="search">Search</label>
    <input type="search" name="search" id="search" />
    <button type="submit">Search</button>
  </form>
</search>
```

### Details tag

Yes - this was one of my first experiments with jQuery back in the days. It is a new element that
allows you to create a collapsible section - without JS!

_DEMO:_

<div style="border: 1px solid var(--color-quote-rgb); padding: 1rem">
<details name="accordion">
  <summary>Click me</summary>
  <p>I am a collapsible section 01</p>
</details>
<details name="accordion">
  <summary>Click me</summary>
  <p>I am a collapsible section 02</p>
</details>
<details name="accordion">
  <summary>Click me</summary>
  <p>I am a collapsible section 03</p>
</details>
</div>

... you can use some nice [proper css](https://codepen.io/sfearl1/pen/YPXxmqP) to make it look
nice...

```html
<details name="accordion">
  <summary>Click me</summary>
  <p>I am a collapsible section 01</p>
</details>
<details name="accordion">
  <summary>Click me</summary>
  <p>I am a collapsible section 02</p>
</details>
<details name="accordion">
  <summary>Click me</summary>
  <p>I am a collapsible section 03</p>
</details>
```

### Text trimming

`text-box-trim` is a solution on a problem we once had in our company - it was almost impossible to
make a proper placing of the font inside the element (without JS). It is a new CSS property that
allows you to trim the text inside the element - and solve the problem in ONE LINE OF CSS!

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-box-trim),
[DEMO](https://codepen.io/nileshprajapati/pen/RweKdmw),
[CanIUse](https://caniuse.com/?search=text-box-trim).
