---
title: "Skills and Expertise"
slug: "skills"
---

This section reflects technologies I’ve used in **real projects**, not everything I’ve ever tried. I
regularly explore new tools out of curiosity; some appear in the
[Learning section](/experience/learning/), which I started documenting only recently.

## TL;DR Summary

| Area              | Technologies & Expertise                                                                  |
| :---------------- | :---------------------------------------------------------------------------------------- |
| **Frontend**      | **React, TypeScript/JavaScript**, HTML5/CSS3, Tailwind, @mui, Redux/Zustand/Jotay         |
| **Backend**       | Java, Spring Boot, **NodeJS, Python**, REST APIs/GraphQL/gRPC, SQL/MongoDB, WildFly/JBoss |
| **UI/UX**         | **User-Centric Design, Modern CSS** Responsive Design, Figma, Accessibility, Prototyping  |
| **Architecture**  | **Pragmatic Modularism**, Micro-services, Design Patterns                                 |
| **Ops & Culture** | Agile, Mentorship, CI/CD, Docker, Git, Onboarding, Clean Code, Enterprise Ecosystems      |

> I focus on building friendly, intuitive interfaces. I am not afraid to challenge requirements or
> propose changes, but I always prioritize real business value and common sense.

## Frontend Stack

- **Primary**: **TypeScript[^1]**/JavaScript, **React[^2]**, HTML/CSS (SCSS, Less)
- **Secondary/Legacy**: Svelte, Angular, htmx, **jQuery**
- **Supporting tools**: **Material UI[^3]**, Tailwind, Bootstrap, TanStack, **Nx**, Cypress, Jest,
  ...

I keep a broad overview of the frontend ecosystem to choose the
[right tool for the team](http://mikhailian.mova.org/node/284), not the latest trend. I generally
prefer PWAs to React Native, though I plan to evolve some personal projects into native mobile apps.

> I have a genuine appreciation for maintaining legacy applications from the “pre-modern” era.
> Greenfield projects are cute, but I’m the guy you call when the reality of legacy code hits and
> you need to improve usability without breaking business continuity.

## Back-End & Architecture

- **Languages**: Primarily **Python** and **TypeScript/JS** (**Node.js**[^4] - NestJS/Express.js),
  with strong experience in Java (Spring Boot, Maven)
- **Foundations**: Earlier work in Pascal, C/C++, and PHP

While I can deliver backend services, my focus is now frontend-oriented architecture—API design,
integration, and meaningful error handling rather than backend-heavy development.

### Data & Persistence

I treat databases as replaceable components and focus on portable data models that work across
relational, NoSQL, and cloud systems, avoiding vendor lock-in unless performance truly requires it.

> While **MongoDB is my go-to choice**, I’m genuinely drawn to Redis—finding a project that utilizes
> it would definitely catch my eye more than a traditional PostgreSQL stack.

## Infrastructure & Deployment

- **Scripting**: Bash, Batch (.bat), OS-agnostic
- **CI/CD**: GitHub Actions, GitLab CI, Jenkins, TeamCity
- **Tools**: Docker, Nginx, Apache, basic AWS, Sonar Qube/Qodana or CodeQL

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
- **Process**: Scrum[^5], Waterfall, lifecycle ownership
- **Team stability**: Reducing bus factor, improving knowledge sharing[^6]
- **Stakeholders**: Roadmaps, consulting, execution

I aim for stable teams with shared ownership, no single points of failure, and _code written for our
future selves_.

## Working Method

Approach for delivering elegant, maintainable code that adds lasting value.

- **Pragmatic Architecture:** Apply
  [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
  and [DDD](https://en.wikipedia.org/wiki/Domain-driven_design) to keep business logic separate from
  UI frameworks.
- **State of Mind:** Structure apps by [12-Factor App principles](https://12factor.net/) for
  consistent environments and predictable deployments.
- **Quality over Hype:** Select tools based on stability and performance, not trends.
- **Technical Debt Management:** Prevent debt via continuous refactoring and clear documentation.
- **Modern Versioning:** Use Git with [Semantic Versioning](https://semver.org/), automated CI/CD,
  and changelog generation.
- **Ethical Engineering:** Follow the [ACM Code of Ethics](https://www.acm.org/code-of-ethics) and
  support Open Source when possible.

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

[^3]:
    Material UI is a great library, but it needs to be used as it was designed. Any deviation from
    the [Material Design manifesto](https://m1.material.io/) leads to inconsistency and is
    relatively costly. For a robust interface with many components, performance can become an issue.

[^4]:
    I can deliver Node.js services, but I still believe **JavaScript belongs where God intended**:
    on the client side. The recurring
    [NPM supply chain attacks](https://www.blackduck.com/blog/recent-npm-software-supply-chain-attack-security-lessons.html)
    only reinforce my caution regarding JS on the server ]:-)

[^5]:
    I use Scrum to align teams, then trim it down once things are running smoothly. No point in
    ceremonies that cost more time than they save.

[^6]:
    Based on documentation - in these days it is possible to have everything up to date thx to AI
    tools, and by implementing some processes like Post-mortems, Pair programming (if we have time
    :-)), Code Reviews, ...
