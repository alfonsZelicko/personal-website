---
title: "Skills and Expertise"
slug: "skills"
---

This section reflects technologies I’ve used in **real projects**, not everything I’ve ever tried. I
regularly explore new tools out of curiosity; some appear in the
[Learning section](/experience/learning/), which I started documenting only recently.

## TL;DR Summary

| Area                        | Core Focus & Expertise                                               |
| :-------------------------- | :------------------------------------------------------------------- |
| **Frontend**                | **React, TypeScript/JS**, CSS/SCSS, Next.JS, Vite/Webpack            |
| **Backend**                 | **NodeJS, Python**, BunnyJS, Java (Spring, Maven), REST/GraphQL/gRPC |
| **Product**                 | Strategic Engineering, Pragmatic Architecture, Industry 4.0          |
| **DevOps&nbsp;&&nbsp;Team** | Mentorship, CI/CD, Docker, Agile Leadership                          |

> I focus on building friendly, intuitive interfaces. I am not afraid to challenge requirements or
> propose changes, but I always prioritize real business value and common sense.

---

## Detailed Tech Stack

### Frontend Ecosystem

I keep a broad overview of the frontend ecosystem to choose the
[right tool for the team](http://mikhailian.mova.org/node/284), not the latest trend.

- **Languages:** **TypeScript[^1]**/JavaScript, HTML5/CSS3 (SCSS, Less)
- **Libraries:** **React[^2]**, Redux, Zustand, Jotai, TanStack, NextJS
- **UI & Styling:** **Material UI[^3]**, Tailwind, @mui, Bootstrap, Responsive Design
- **Secondary/Legacy:** Svelte, Angular, htmx, **jQuery**
- **Tooling:** **Nx**, Cypress, npm/yarn/pnpm, Vite/Webpack, Jest, Figma, Accessibility, Prototyping

> I have a genuine appreciation for maintaining legacy applications from the “pre-modern” era.
> Greenfield projects are cute, but I’m the guy you call when the reality of legacy code hits and
> you need to improve usability without breaking business continuity.

### Back-End & Data Architecture

While I can deliver backend services, my focus is now frontend-oriented architecture—API design,
integration, and meaningful error handling.

- **Primary Languages:** **Python** and **TypeScript/JS** (**Node.js**[^4] - NestJS/Express.js,
  BunnyJS)
- **Enterprise Java:** Spring Boot, Maven, WildFly/JBoss
- **Communication:** REST APIs, GraphQL, gRPC
- **Persistence:** SQL, **MongoDB** (go-to choice), Redis, portable data modeling

### Infrastructure & Deployment

Not a DevOps specialist, but fully self-sufficient with pipelines and deployments—preferably as
little manual work as possible.

- **CI/CD:** GitHub Actions, GitLab CI, Jenkins, TeamCity
- **Containerization:** Docker, Nginx, Apache
- **Security & Quality:** Sonar Qube/Qodana, CodeQL
- **Cloud & Scripting:** Basic AWS, Bash, Batch (.bat)

---

## Product & Leadership

### Domain Experience

I’m a **frontend specialist with a full-stack background**. Years of building systems end-to-end
allow me to focus on usability, maintainability, and **pragmatic technical decisions**.

- **Strategic UI engineering:** Solving UX problems, not just changing visuals.
- **Industry 4.0:** Deep experience with DAQ systems and industrial environments.
- **Business Alignment:** Translating business needs into clear technical solutions.

### Team & Process

I aim for stable teams with shared ownership, no single points of failure, and _code written for our
future selves_.

- **Leadership:** Mentoring, onboarding, reducing "bus factor" [^6].
- **Process:** Scrum[^5], Waterfall, lifecycle ownership, roadmaps.

---

## Working Method & Ethics

Approach for delivering elegant, maintainable code that adds lasting value.

- **Pragmatic Architecture:** Apply
  [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
  and [DDD](https://en.wikipedia.org/wiki/Domain-driven_design).
- **State of Mind:** Structure apps by [12-Factor App principles](https://12factor.net/).
- **Modern Versioning:** Use Git with [Semantic Versioning](https://semver.org/) and automated
  changelogs.
- **Ethical Engineering:** Follow the [ACM Code of Ethics](https://www.acm.org/code-of-ethics) and
  support Open Source.

[^1]:
    On really huge projects it can be a little painful to use it due to a slow transpilation
    process, but in version 7.0 it will be the transpiler rewritten in [Go](https://go.dev/). It
    will be
    [MUCH faster](https://byteiota.com/typescript-7-native-port-10x-faster-builds-land-in-early-2026/).

[^2]:
    With the advent of the [React Compiler](https://react.dev/learn/react-compiler), I now consider
    manual memoization (useMemo/useCallback) an obsolete architectural overhead.

[^3]:
    Material UI is a great library, but any deviation from the
    [Material Design manifesto](https://m1.material.io/) leads to inconsistency and is relatively
    costly.

[^4]:
    I still believe **JavaScript belongs where God intended**: on the client side.
    [NPM supply chain attacks](https://www.blackduck.com/blog/recent-npm-software-supply-chain-attack-security-lessons.html)
    only reinforce my caution.

[^5]:
    I use Scrum to align teams, then trim it down once things are running smoothly. No point in
    ceremonies that cost more time than they save.

[^6]: Based on documentation, Post-mortems, Pair programming, and Code Reviews.
