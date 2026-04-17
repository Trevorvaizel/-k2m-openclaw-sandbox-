---
tags:
  - type/atomic
  - category/strategy
  - domain/product
  - domain/education
  - layer/dynamics
aliases:
  - "Value First Onboarding Architecture"
  - "K2M Onboarding Architecture"
---

# Value First Onboarding Architecture

## Definition

Value-first onboarding architecture is the K2M decision to let a student feel the product before asking them for more cognitive or administrative effort.

## Pattern

In the current design:

- interest happens on the landing page
- Discord join creates a `@Guest` state rather than full access
- enrollment and payment happen through staged links and tokenized flows
- activation upgrades the student into the real cohort space
- the first KIRA experience and first `/frame` come before optional profile enrichment
- Stop 0 context questions are explicitly framed as optional support, not a gate
- first-time Discord users get orientation help before they are expected to navigate the product alone
- form and DM transitions are bridged so the student is not left wondering whether anything happened
- waiting states are designed with visible progress, reassurance, and low-stakes proof instead of silent delay

The guiding rule is simple: delight and forward motion come before extra questions.

## Diagnostic Use

Ask:

- Does this step help the student feel momentum, or does it feel like bureaucracy?
- Are we putting cognitive load before belief and motivation have formed?
- Where are we still treating setup as more important than first value?

## Trap

The trap is building intake logic that is operationally neat but emotionally dead. In this product, premature friction kills trust before the cohort starts.

## Related

- [[moc-k2m-product]]
- [[current-scrappy-product]]
- [[single-cohort-ops-surface]]
- [[context-personalization-contract]]

Source:
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/student-onboarding-and-enrollment-flow|Student Onboarding And Enrollment Flow]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-mortem-2026-03-04-decisions|Pre-Mortem Decisions Log]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/context-engine-experience-design|Context Engine Experience Design]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/adversarial-pre-mortem-onboarding-journey-2026-03-04|Adversarial Pre-Mortem Report: Student Onboarding & Enrollment Journey]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-launch-gaps-and-solutions|Pre-Launch Gaps And Solutions]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/pre-mortem-session-4-decisions|Pre-Mortem Decisions Log - Session 4]]
- [[docs/product-docs/cohort-design-artifacts/design-and-architecture/solutions-and-new-automations|Solutions And New Automations]]
