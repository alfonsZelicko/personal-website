---
title: "Scaling DAQIS at Nuvia a.s."
date: 2026-01-18T18:25:00+01:00
slug: "2026-01-18-nuvia-industrial-evolution"
categories: ["design", "programming", "work"]
draft: false
params:
  metadescription:
    "Case study from Nuvia a.s. (2018–2021): Evolution of an industrial DAQ system, architectural
    decisions, and lessons learned in manufacturing software."
  metakeywords: "Nuvia, DAQIS, Industry 4.0, Manufacturing, Software Architecture, Frontend, Java"
---

> I don't expect anyone to actually read this. It is mostly a personal reflection—a diary entry and
> a way to say thank-you to the people at Nuvia a.s. who gave me the opportunity to work with them.
> In the future I will try to write an article about every job experience I had.

## Context and Role

I joined Nuvia a.s. in 2018 as a programmer, later moving into a Senior Frontend Developer role.
Over time, my responsibilities grew into a mix of technical leadership and product decision-making
(prioritization, stakeholder communication, and exploring business potential).

I worked on the **DAQIS** project between 2018 and 2021. In a team of about 6 people, my role was a
bridge between pure coding and product development.

## Remote Work & Infrastructure

Remote work wasn't restricted because of a lack of trust, but because the infrastructure wasn't
ready. Some systems were part of critical infrastructure and had to stay isolated[^1].

During a "crisis" with a tight deadline, I proposed a solution to work remotely by improving our
technical setup:

- We separated development and testing environments from production.
- We created dedicated servers and databases for remote access (the same databases we were able to
  use to show our DEMO product)
- We kept critical production systems strictly on-site while allowing development to happen via VPN.

This change wasn't just about "working from home"—it was a practical upgrade to our architecture
that later allowed other teams to work in a hybrid model[^2].

### Organizing the Team (FE/BE Split)

The biggest change wasn't the technology, but how we worked. I pushed for a clear separation between
Frontend and Backend responsibilities:

- **Java Developers** focused on business logic, data integrity, and stability.
- **Frontend Developers** took over HTML, CSS, and UX tasks where they were more efficient.

**The result:** Faster delivery, easier onboarding for new people, and fewer UI bugs. We stopped
wasting the time of senior backend devs on CSS positioning[^3].

## Making Data Speak to Management

What started as a request for a simple, low-cost status report evolved into the company's premier
showcase tool. Through proactive communication with the stakeholder, I pushed beyond the original
brief to show the potential of a truly visual system.

- **Interactive Vector Map:** Visualized the entire hall with interactive lines using
  [morphing buttons](https://tympanus.net/Development/ButtonComponentMorph/) for detailed drill-down
  views.
- **Real-time Insights:** Unified hidden data (status, KPI/OEE) and personnel qualifications into a
  live dashboard.
- **"Grey Area" Strategy:** Lines without DAQIS were shown in grey. These "data-dark" zones
  motivated management to approve a full-factory rollout within a single year.
- **WebSocket Optimization:** The dashboard became so popular that managers installed dedicated TVs
  in their offices to stream it 24/7 - leading in need of optimization - WebSocket connections
  (stream) to stabilize the overwhelmed system.
- **International Success:** Impactful visualization led Italian directors to adopt the system,
  elevating it from a "utility" to a key corporate tool[^4].

> I’m proud of this mini-project. It became a key focal point for sales, even though it was
> “useless” for operators. It taught me that understanding the real business value of a product is
> crucial to delivering the right solution.

## Business Initiatives & Partnerships

Since the company didn't have a dedicated sales team, I initiated several technical partnerships:

- **Productoo (SAP wrapper):** Created middleware PoC for a customer (Mann+Hummel).
- **Predictive Maintenance:** Started discussions about using our data for AI-driven failure
  prediction.
- **PLC Firms:** Positioned DAQIS as a visualization layer for automation companies.

Most of these stayed at the prototype or documentation stage, as they required a dedicated
"champion" to push them forward after my departure.

## Sustainability: Tools and Onboarding

### SVN to Git Migration

I helped drive the transition from SVN to Git across the firm. Instead of forcing it, we focused on
demonstrating the practical benefits—like easier parallel development and safer release cycles. By
supporting the team during the move and showing how it improved our daily workflow, we successfully
made Git the company standard.

### Improving Onboarding

Before, a new hire spent weeks just setting up their environment. I created a **"Welcome Package"**
with:

- Pre-configured tools and VPN settings.
- Local database and server setups.
- Clear documentation and context.

This reduced onboarding from weeks to **1–2 days**, saving a significant amount of senior
developers' time.

## Summary: Lessons in Business and Architecture

Working on DAQIS was a major turning point in my career. Before this, I saw myself primarily as a
"programmer," but the challenges at Nuvia forced me to reconnect with my management education and
look at the bigger picture.

- **From Developer to Architect:** I realized technical skill is only half the job; I now
  pragmatically apply concepts like "Bus Factor" and "Strategic Alignment" to ensure long-term
  project viability.
- **Legacy System Reality:** Fixing critical bugs in undocumented "black boxes" provided a
  masterclass in why clean architecture and documentation are non-negotiable in production.
- **Organizational Impact:** I learned that even a world-class system—which outperformed SAP and
  Oracle in a Mann+Hummel tender—can fail without strong administrative and sales alignment.
- **Pragmatic Modernization:** This experience taught me that software doesn't exist in a vacuum.
  Even modernization requires a balance between technical and business goals.

I eventually quit because I felt the product's potential was limited by these non-technical
barriers, but the experience was invaluable for my growth. It taught me to value readability over
"academic perfection" and to **always consider the business impact of my technical decisions**.

> The [DAQIS website](https://daqis.cz/) is a small artifact from that time—built fast (2 days) and
> simple, but still functional years later. Czech mutation ONLY is a nice example of actual "bysnis
> strategy" O;-(

[^1]:
    But some systems were not in that state, and it was possible to work remotely. But the company
    culture didn't allow it.

[^2]: And also it enabled us to add an online demo to showcase the product to customers.

[^3]:
    It was not like "I did it all alone", but I was definitely the one who brought the energy to it.

[^4]: Not sure for 100% if this was finished well - but so fat I know - they want it a lot.
