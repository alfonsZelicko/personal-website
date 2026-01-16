---
title: "Skills and Expertise"
slug: "skills"
---

This section reflects technologies I’ve used in **real projects**, not everything I’ve ever tried. I
regularly explore new tools out of curiosity; some appear in the
[Learning section](/experience/learning/), which I started documenting only recently.

## Frontend Stack

- **Primary**: **TypeScript[^1]**/JavaScript, **React[^2]** (16.8+), HTML/CSS (SCSS, Less)
- **Secondary/Legacy**: Svelte, Angular, htmx, **jQuery** (3.0+)
- **Supporting tools**: **Material UI**, Tailwind, Bootstrap, TanStack, **Nx**, Cypress, Jest, ...

I keep a broad overview of the frontend ecosystem to choose the
[right tool for the team](http://mikhailian.mova.org/node/284), not the latest trend. I generally
prefer PWAs over React Native, though I plan to evolve some personal projects into native mobile
apps.

> I have a genuine appreciation for maintaining legacy applications from the “pre-modern” era.
> Greenfield projects are cute, but I’m the guy you call when the reality of legacy code hits and
> you need to improve usability without breaking business continuity.

## Back-End & Architecture

- **Languages**: Primarily **Python** and **TypeScript/JS (Node.js)**, with strong experience in
  Java (Spring Boot)
- **Foundations**: Earlier work in Pascal, C/C++, and PHP

While I can deliver backend services, my focus is now frontend-oriented architecture—API design,
integration, and meaningful error handling rather than backend-heavy development.

> I can deliver Node.js services, but I still believe **JavaScript belongs where God intended**: on
> the client side. The recurring
> [NPM supply chain attacks](https://www.blackduck.com/blog/recent-npm-software-supply-chain-attack-security-lessons.html)
> only reinforce my caution regarding JS on the server >:-).

## Data & Persistence

I treat databases as replaceable components and focus on portable data models that work across
relational, NoSQL, and cloud systems, avoiding vendor lock-in unless performance truly requires it.

## Infrastructure & Deployment

- **Scripting**: Bash, Batch (.bat), OS-agnostic
- **CI/CD**: GitHub Actions, GitLab CI, Jenkins, TeamCity
- **Tools**: Docker, Nginx, Apache, basic AWS

Not a DevOps specialist, but fully self-sufficient with pipelines and deployments—preferably as
little as possible.

## Product & Domain Experience

I’m a **frontend specialist with a full-stack background**. Years of building systems end-to-end
allow me to focus on usability, maintainability, and **pragmatic technical decisions**.

- **Customer-facing products**: Translating business needs into clear technical solutions
- **Strategic UI engineering**: Solving UX problems, not just changing visuals
- **Industry 4.0**: Deep experience with DAQ systems and industrial environments

## Team & Process Leadership

- **Team leadership**: Mentoring, onboarding, decision-making
- **Process**: Scrum, Waterfall, lifecycle ownership
- **Team stability**: Reducing bus factor, improving knowledge sharing
- **Stakeholders**: Roadmaps, consulting, execution

I aim for stable teams with shared ownership, no single points of failure, and code written for our
future selves.

> Full Agile helps identify problems; I usually switch to a lighter, context-driven variant.

---

{{< mdfile file="blocks/workmethod.md" >}}

[^1]:
    On really huge projects it can be a little painful to use it due to a slow transpilation
    process, but in version 7.0 it will be the transpiler rewritten in [Go](https://go.dev/). It
    will be
    [MUCH faster](https://byteiota.com/typescript-7-native-port-10x-faster-builds-land-in-early-2026/)
    and meanwhile TC39 is thinking about
    [Type Anotations](https://github.com/tc39/proposal-type-annotations) so who wants to live with
    JS should learn TS for sure :-)

[^2]:
    In a past interview, I was questioned on UI optimization using
    [useCallback](https://react.dev/reference/react/useCallback) and
    [useMemo](https://react.dev/reference/react/useMemo). However, with the advent of the
    [React Compiler](https://react.dev/learn/react-compiler), I now consider manual memoization
    management an obsolete architectural overhead.
