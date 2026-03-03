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

> Ofc I can talk even about things like position: flex/grid, but I am not going to do it here.

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

<style>
    .btn {
        padding: 2rem 4rem;
        background: orange;
        border: 3px solid color-mix(saddlebrown, transparent 50%); /*to demonstrate shape change*/
        transition: all 0.2s ease;
    }
    .btn:not(.message){
        border-radius: 2rem;
        corner-shape: squircle;
    }
    .message {
        border-radius: 1rem;
        anchor-name: --card;
        cursor: pointer;
    }

    .message::before {
        scale: 0;
        content: "1";
        position: absolute;
        position-anchor: --card;
        position-area: top right;
        translate: -50% 50%;
        background: firebrick;
        color: white;
        height: 2.5rem;
        width: 2.5rem;
        transition: all 0.2s ease;
        border-radius: 50%;
    }

    .message:focus {
        border-top-right-radius: 2rem;
        corner-top-right-shape: scoop;
    }
    .message:focus::before {
        scale: 1;
    }
</style>

<button class="btn">corner-shape: squircle;</button> vs.<button class="message btn">click me!
(corner-shape: none)</button>

{{< code-detail >}}

```html
<button class="btn">corner-shape: squircle;</button> vs.<button class="message btn">
  click me! (corner-shape: none)
</button>
```

```scss
.btn {
  padding: 2rem 4rem;
  background: orange;
  border: 3px solid saddlebrown; /*to demonstrate shape change*/
  transition: all 0.2s ease;
  &:not(.message) {
    border-radius: 2rem;
    corner-shape: squircle;
  }
}
.message {
  border-radius: 1rem;
  anchor-name: --card;

  &::before {
    scale: 0;
    content: "1";
    position: absolute;
    position-anchor: --card;
    position-area: top right;
    translate: -50% 50%;
    background: firebrick;
    color: white;
    height: 2.5rem;
    width: 2.5rem;
    transition: all 0.2s ease;
    border-radius: 50%;
  }

  /*not hover, cause of mobile devices*/
  &:focus {
    border-top-right-radius: 2rem;
    corner-top-right-shape: scoop;
  }

  &:focus::before {
    scale: 1;
  }
}
```

{{< /code-detail >}}

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

### New color models

`oklch()` is a new CSS function that converts a color from sRGB to the OKLAB color space. It is
useful for creating color palettes. I strongly recommend paying attention to these new color
formats - it's a very strong tool. Here is a lot of options: `lch()`, `oklch()`, `lab()`, `oklab()`,
`rgb()`, `rgba()`, `hsl()`, `hsla()`, `hwb()`, `hwba()`, `color()`...

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value/oklch),
[video](https://www.youtube.com/watch?v=4Ypuns-Jq20&t=369),
[CanIUse](https://caniuse.com/?search=oklch), [DEMO](https://codepen.io/argyleink/pen/YzdEapM).

```scss
--primary-color: red;

.red-element {
  color: oklch(from var(--primary-color) calc(l - 0.25) c h); //little darker red
  background-color: oklch(from var(--primary-color) l c h / 50%); //-> rgba(255, 0, 0, 0.5)
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

### Details tag

Yes - this was one of my first experiments with jQuery back in the days. It is a new element that
allows you to create a collapsible section - without JS! Real implementation is a bit tricky, the
browser using shadow elements, but here is a way how to animate it properly :-)

_DEMO:_

<style>
    :root {
      interpolate-size: allow-keywords;
    }
    details[name="accordion"] {
      overflow: hidden;
    }
    details[name="accordion"] *{
      margin: 0;
    }
    details[name="accordion"]::details-content{
      height: 0;
      transition:
        height 0.2s,
        content-visibility 0.2s;

      transition-behavior: allow-discrete;
    }
  details[name="accordion"][open]::details-content {
    height: auto;
  }
</style>

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

{{< code-detail >}}

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

```scss
:root {
  interpolate-size: allow-keywords; /*we want to use keywords in the CSS */
}
details[name="accordion"] {
  overflow: hidden;
  &[name="accordion"] {
    &::details-content {
      height: 0;
      transition:
        height 0.2s,
        content-visibility 0.2s;
      transition-behavior: allow-discrete;
    }
    &[open]::details-content {
      height: auto;
    }
  }
  * {
    margin: 0;
  }
}
```

> `transition-behavior: allow-discrete`; enables transitions for otherwise non-animatable properties
> like `display`. On close, the visual transition (e.g. shrinking `height` to 0) runs first, and the
> element is only hidden (`display: none`) after the transition completes.<br>
> [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/transition-behavior),
> [CanIUse](https://caniuse.com/?search=transition-behavior).

> `interpolate-size: allow-keywords;` means that we can use keywords in the CSS - like
> `height: auto` - and the browser will interpolate the value -> **we can animate it!**<br>
> [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/interpolate-size),
> [CanIUse](https://caniuse.com/?search=interpolate-size).

{{< /code-detail >}}

### Text trimming

`text-box-trim` is a solution on a problem we once had in our company - it was almost impossible to
make a proper placing of the font inside the element (without JS). It is a new CSS property that
allows you to trim the text inside the element - and solve the problem in ONE LINE OF CSS!

[MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-box-trim),
[DEMO](https://codepen.io/nileshprajapati/pen/RweKdmw),
[CanIUse](https://caniuse.com/?search=text-box-trim).
