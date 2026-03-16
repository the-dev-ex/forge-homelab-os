# forge-homelab-os

**Forge Homelab OS** is an open-source, contract-driven platform for building a clean, portable, Kubernetes-native operating model for the homelab.

It exists for builders who want more than a pile of apps running on random machines. It exists for people who want their infrastructure to feel intentional, legible, and unified. Forge is an attempt to create a true operating system layer for self-hosted services — one built on Linux, Kubernetes, Helm, and explicit platform law.

---

## Why Forge Exists

Most homelabs grow through repetition, manual fixes, hidden steps, and operator memory.

A service gets installed.  
A secret gets patched by hand.  
A database gets updated through `exec`.  
A chart gets tweaked one time and nobody remembers why.

It works — until scale, drift, or time makes the system harder to understand than it should be.

**Forge Homelab OS** exists to challenge that model.

Forge is built on a simple belief:

> Infrastructure should not depend on remembering what to do next.

A platform should know what it is, what it runs, how services are installed, and how they are allowed to evolve.

---

## What Forge Is

Forge is not just a homelab repo.

Forge is an attempt to create a **virtual operating system for self-hosted services**.

In this model:

- **Linux** is the substrate
- **Kubernetes / k3s** is the service fabric
- **Helm** is the package backend
- **Forge** is the operating law

Forge defines how services belong to the system, how they are installed, how they are configured, how they relate to one another, and how they can evolve without becoming chaos.

---

## Who Forge Is For

Forge is for the people who want their homelab to feel like a real system.

It is for builders who:

- want to move beyond ad hoc infrastructure
- prefer Linux over closed platforms
- want simplicity without sacrificing power
- believe systems should be explicit, deterministic, and portable
- want contracts and patterns instead of tribal knowledge
- care about architecture, not just installation
- want to build a platform, not just host apps

Forge is for the people willing to walk away from convenience when convenience creates long-term disorder.

It is for the people who want their system to reflect intention.

---

## Vision

The long-term vision of Forge Homelab OS is to become an open-source platform model that helps create a community of builders around a shared idea:

**your homelab should feel like an operating system, not a collection of surviving decisions.**

Forge aims to provide a structure where users can:

- define service contracts
- install services through standardized patterns
- apply controlled environment overrides
- run across mixed hardware and cluster types
- evolve infrastructure without losing clarity
- contribute new package patterns back into the ecosystem

The goal is not only to build a personal system.

The goal is to build a professional, open-source foundation that others can adopt, extend, and help shape.

---

## Core Principles

### Contracts before implementation

Every service should have a defined shape before it has an install process.

A service is not just a chart. It is a platform component with:

- identity
- role
- namespace boundary
- dependency rules
- secret requirements
- storage requirements
- network policy
- lifecycle expectations

### Determinism over operator memory

If a platform depends on manual memory, one-off commands, or undocumented shell work, it is incomplete.

Repeated actions should become platform behavior.

### Templates with controlled overrides

Forge follows a layered model:

- **contract** defines the service law
- **template** defines the default install blueprint
- **values / overlays** specialize for environment differences

This allows the system to stay portable without becoming inconsistent.

### Platform identity matters

A Forge node should feel like part of a larger system, not just another Linux machine.

Names, roles, namespaces, ingress, packages, secrets, and install patterns should all contribute to a coherent platform identity.

### Portability across heterogeneous infrastructure

Forge should work across mixed environments:

- rack servers
- virtual machines
- Raspberry Pi clusters
- future cloud substrates

The hardware may vary. The platform law should not.

---

## Repository Purpose

This repository is the platform definition layer behind Forge.

It is intended to hold the operational law of the system, including:

- namespace-oriented infrastructure layout
- Helm release patterns
- service templates
- values and overlay strategy
- secret contracts
- ingress and DNS conventions
- database lifecycle patterns
- package organization
- future Rust-driven orchestration logic

This is where the system stops being an idea and starts becoming a repeatable platform.

---

## Design Direction

Forge Homelab OS is evolving toward a model where:

- services are grouped by platform domain
- installs follow consistent package rules
- Postgres, Redis, Forgejo, and other services are treated as first-class platform components
- database changes are applied through tracked jobs instead of manual shell access
- Helm acts as a backend, not the source of truth
- Rust becomes the control layer that validates, resolves, and executes platform behavior

Today, some parts of the workflow are still manual.

The long-term goal is to absorb those steps into a Forge-native operating model.

---

## Platform Model

Forge is being designed around a simple structure:

### Contract
Defines what a service is and what it requires.

### Template
Defines how the service is installed by default.

### Override
Defines what can vary safely by environment.

This creates a service model that is:

- auditable
- portable
- deterministic
- easier to automate
- easier to reason about

---

## Community Goal

Forge is intended to be open source not only in code, but in direction.

This project aims to attract a community of builders who want:

- a cleaner way to define homelab systems
- a stronger Linux-native platform model
- a shared grammar for self-hosted infrastructure
- professional patterns for service packaging and deployment
- an alternative to fragmented, tool-by-tool infrastructure growth

The hope is simple:

**build the system well enough that the right people recognize what it is.**

Forge is for those people.

---

## Long-Term Goal

The long-term goal is a Rust-driven Forge control layer that can:

- understand the current environment
- validate service contracts
- resolve templates against cluster capabilities
- apply deterministic install and upgrade plans
- run tracked jobs for database and platform changes
- reduce operator guesswork
- make platform behavior explicit

At that point, Forge Homelab OS becomes more than infrastructure-as-code.

It becomes a real operating model for self-hosted systems.

---

## Current Status

Forge Homelab OS is an active platform project under construction.

Its architecture, install contracts, service boundaries, secrets patterns, and packaging model are being developed through live use in a real homelab environment.

This repository should be viewed as a serious and evolving foundation for a larger open-source system.

---

## Philosophy in One Sentence

**Forge Homelab OS is a contract-driven, open-source platform for turning the homelab into a coherent operating system for services.**

---

## Author

**Leo Rocha**

Creator of Forge and builder of contract-driven homelab infrastructure.
