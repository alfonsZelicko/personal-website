---
title: "Industrial Evolution: Scaling DAQIS at Nuvia a.s."
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
ready. Some systems were part of critical infrastructure and had to stay isolated.

During a crisis with a tight deadline, I proposed a solution to work remotely by improving our
technical setup:

- We separated development and testing environments from production.
- We created dedicated servers and databases for remote access.
- We kept critical production systems strictly on-site while allowing development to happen via VPN.

This change wasn't just about "working from home"—it was a practical upgrade to our architecture
that later allowed other teams to work in a hybrid model.

### Organizing the Team (FE/BE Split)

The biggest change wasn't the technology, but how we worked. I pushed for a clear separation between
Frontend and Backend responsibilities:

- **Java Developers** focused on business logic, data integrity, and stability.
- **Frontend Developers** took over HTML, CSS, and UX tasks where they were more efficient.

**The result:** Faster delivery, easier onboarding for new people, and fewer UI bugs. We stopped
wasting the time of senior backend devs on CSS positioning.

## Visualization: Making Data Speak to Management

What started as a request for a simple, low-cost status report evolved into the company's premier
showcase tool. Through proactive communication with the stakeholder, I pushed beyond the original
brief to show the potential of a truly visual system.

- **Interactive Map:** I built a vector-based map of the entire production hall where each line was
  a clickable object. Using
  [morphing buttons](https://tympanus.net/Development/ButtonComponentMorph/), users could click a
  production line to see it expand into a detailed modal.
- **Real-time Insights:** The dashboard displayed data that already existed in the system but was
  previously hidden: real-time status (Production, Downtime, Logistics problems...), live KPI/OEE
  stats, and even shift info (using our "knowledge matrix" to show qualified staff for that line).
- **The "Grey Area" Strategy:** Lines without DAQIS were shown in grey. Seeing these "data-dark"
  zones on a large screen in the reception was a powerful argument. It motivated managers to
  authorize a full-factory rollout of the system within a single year.
- **Technical Optimization:** The dashboard became so popular that managers installed dedicated TVs
  in their offices to stream it 24/7. When the server load spiked from the constant polling, I
  refactored the communication to use **WebSocket streams**. This stabilized the system and allowed
  for true real-time monitoring.
- **The Italian Success:** The visualization was so impactful that it caught the attention of
  visiting directors from Italy. They requested the system for their own plants—a huge win for a
  tool that top management had previously viewed as just a "background utility."

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

- **The Shift from Developer to Architect:** I learned that technical excellence is only half of the
  job. I started applying management concepts—like the "Bus Factor," "Hero Culture," and "Strategic
  Alignment"—to real-world situations, seeing exactly where they succeed or fail.
- **The Reality of Legacy Systems:** Working on undocumented systems without the original authors
  was the best possible lesson in why clean architecture matters. It is one thing to hear about it
  in a lecture; it is another to fix a critical production bug in a "black box" system.
- **The Importance of the "Whole" Organization:** I learned how crucial a strong sales department
  and administrative readiness are. Technically, our system was world-class—at one point, we
  outperformed giants like SAP, Microsoft, and Oracle in a global tender for Mann+Hummel. We only
  lost the opportunity because of a missing administrative signature from our parent company.
- **Pragmatic Modernization:** This experience taught me that software doesn't exist in a vacuum.
  Technical solutions only work if they fit the organization's culture. Even the best product can
  fail if the surrounding organization isn't ready to scale it.

I eventually left because I felt the product's potential was limited by these non-technical
barriers, but the experience was invaluable for my growth. It taught me to value readability over
"academic perfection" and to always consider the business impact of my technical decisions.

> The [DAQIS website](https://daqis.cz/) is a small artifact from that time—built fast and simple,
> but still functional years later. It’s a reminder that long-term value often comes from pragmatic
> decisions made under pressure.
