# forge-homelab-os

**Forge Homelab OS** is an open-source, contract-driven platform for building a clean, portable, Kubernetes-native operating model for the homelab.

It is designed for builders who want more than a pile of apps running on random machines. Forge aims to make self-hosted infrastructure feel intentional, legible, and unified by defining clear platform law on top of Linux, Kubernetes, Helm, and, eventually, Rust-driven orchestration.

---

## Why Forge Exists

Most homelabs grow through repetition, manual fixes, hidden steps, and operator memory.

A service gets installed.  
A secret gets patched by hand.  
A database gets updated through exec.  
A chart gets tweaked once and nobody remembers why.

It works until scale, drift, or time make the system harder to understand than it should be.

Forge exists to challenge that model.

> Infrastructure should not depend on remembering what to do next.

A platform should know what it is, what it runs, how services are installed, and how they are allowed to evolve.

---

## What Forge Is

Forge is an attempt to create a virtual operating system for self-hosted services.

In this model:

- Linux is the substrate
- Kubernetes and k3s are the service fabric
- Helm is the package backend
- Forge is the operating law

Forge defines how services belong to the system, how they are installed, how they are configured, and how they evolve without becoming chaos.

---

## Who Forge Is For

Forge is for builders who want their homelab to feel like a real system.

It is for people who:

- want to move beyond ad hoc infrastructure
- prefer Linux over closed platforms
- want simplicity without sacrificing power
- believe systems should be explicit, deterministic, and portable
- want contracts and patterns instead of tribal knowledge
- care about architecture, not just installation

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

- contract defines the service law
- template defines the default install blueprint
- values and overlays specialize for environment differences

This allows the system to stay portable without becoming inconsistent.

### Portability across heterogeneous infrastructure

Forge is intended to work across mixed environments such as:

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
- service source metadata
- values and overlay strategy
- secret contracts
- rendered manifests
- package organization
- future Rust-driven orchestration logic

This is where the system stops being an idea and starts becoming a repeatable platform.

---

## Repository Layout

The repository is organized around a simple distinction:

- iac contains authored platform intent
- target contains generated build artifacts

### iac

This directory is the source of truth for Forge-owned platform definitions, including:

- namespace definitions
- service values
- secret contracts
- source metadata
- optional rendered manifests

### target

This directory is reserved for generated or resolved build material, such as:

- unpacked Helm charts
- chart dependencies
- temporary package state
- other non-authoritative artifacts produced during install workflows

This distinction is intentional. Forge separates declared intent from resolved implementation.

---

## Current Workflow

Forge Homelab OS currently follows a package-oriented workflow:

1. Define service intent under iac
2. Declare chart source and version in source.yaml
3. Define environment-specific values in values.yaml
4. Store secrets through encrypted secret files
5. Resolve package artifacts into target
6. Render and apply manifests to the cluster

This is the early form of the Forge operating model.

Today, parts of this workflow are still manual. Over time, these steps are expected to be driven by Rust-based platform logic.

---

## Platform Model

Forge is being shaped around a simple structure:

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

## Design Direction

Forge Homelab OS is evolving toward a model where:

- services are grouped by platform domain
- installs follow consistent package rules
- foundational services such as Postgres, Redis, and Forgejo are treated as first-class platform components
- database changes are applied through tracked jobs instead of manual shell access
- Helm acts as a backend, not the source of truth
- Rust becomes the control layer that validates, resolves, and executes platform behavior

The long-term goal is to absorb manual steps into a Forge-native operating model.

---

## Community Goal

Forge is intended to be open source not only in code, but in direction.

This project aims to attract builders who want:

- a cleaner way to define homelab systems
- a stronger Linux-native platform model
- a shared grammar for self-hosted infrastructure
- professional patterns for service packaging and deployment

The goal is to build a professional open-source foundation that others can adopt, extend, and help shape.

---

## Current Status

Forge Homelab OS is in an active foundation-building phase.

Current areas of work include:

- defining namespace boundaries
- establishing service install patterns
- deploying foundational middleware services
- separating authored IaC from generated Helm artifacts
- shaping the package contract model
- preparing for a future Rust control layer

This is not a finished distribution. It is an evolving operating model being developed through real platform use.

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

It becomes an operating model for self-hosted systems.

---

## Philosophy in One Sentence

**Forge Homelab OS is a contract-driven, open-source platform for turning the homelab into a coherent operating system for services.**

---

## Author

**Leo Rocha**

Creator of Forge and builder of contract-driven homelab infrastructure.
