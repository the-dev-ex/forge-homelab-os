# Forge Homelab OS Roadmap

This roadmap describes the current direction of **Forge Homelab OS** and the major milestones required to evolve it from a structured homelab repository into a contract-driven operating model for self-hosted infrastructure.

The roadmap is intentionally architectural. Forge is not just a list of apps to deploy. It is a platform design effort.

---

## Current State

Forge Homelab OS is already moving toward a coherent platform structure with:

- Kubernetes / k3s as the service fabric
- Helm as the package backend
- namespace-oriented service organization
- middleware services such as Postgres forming a shared platform layer
- a growing emphasis on contracts, repeatability, and deterministic install patterns

Some workflows are still manual. The next phases focus on pulling those workflows into the platform itself.

---

## Phase 1 — Platform Foundation

Establish the base operating structure of the system.

### Goals

- define namespace boundaries
- standardize repository layout
- establish Helm install conventions
- define initial secret management protocol
- define storage expectations
- document ingress and DNS patterns
- create first platform-level service installs

### Target Outcomes

- stable repo structure by platform domain
- middleware namespace established
- initial CICD namespace established
- baseline services deployed through consistent patterns
- README, LICENSE, CONTRIBUTING, and architecture docs in place

### Candidate Services

- Postgres
- Redis
- Forgejo
- ingress controller
- DNS / certificate support
- storage primitives

---

## Phase 2 — Contract-Driven Service Model

Define the service packaging law of Forge.

### Goals

- formalize what a Forge service is
- separate contract, template, and override layers
- define service dependency model
- define architecture compatibility rules
- define required and optional capability declarations
- begin standardizing service package schema

### Target Outcomes

- a repeatable service package shape
- service definitions that can be validated
- environment overlays that specialize without redefining meaning
- a growing library of reusable package patterns

### Key Concepts

- **Contract**: what the service is and what it requires
- **Template**: the default install blueprint
- **Override**: environment-specific specialization

---

## Phase 3 — Database Lifecycle as a Platform Primitive

Remove direct operator dependency from database changes.

### Goals

- eliminate ad hoc `kubectl exec` database administration
- introduce SQL artifact execution through Kubernetes Jobs
- create a migration ledger for executed SQL
- define database change workflow as a reusable platform pattern
- make database evolution auditable and repeatable

### Target Outcomes

- standard database job runner
- tracked SQL execution history
- reusable migration workflow for services such as Forgejo
- clearer operational boundary between platform and database internals

### Vision

Database changes should feel like controlled platform updates, not manual shell surgery.

---

## Phase 4 — Rust Control Layer

Move platform intelligence into Rust.

### Goals

- build a Rust process that understands the platform
- parse package contracts and templates
- merge valid environment overrides
- validate required capabilities before install
- generate deterministic install plans
- invoke Helm and Kubernetes Jobs through a controlled interface

### Target Outcomes

- typed service model
- typed cluster capability model
- deterministic resolution engine
- reduction of manual install logic
- a first real Forge-native platform executor

### Long-Term Direction

The operator should not remain the primary resolver of platform behavior.
Forge itself should take over more of that responsibility.

---

## Phase 5 — Capability-Aware Portability

Support multiple substrates under one Forge operating model.

### Goals

- define cluster capability profiles
- support mixed architecture environments such as amd64 and arm64
- support R440 VMs, Raspberry Pi clusters, and future cloud nodes
- ensure service packages can resolve against substrate differences
- prevent environment drift through explicit compatibility rules

### Target Outcomes

- one platform law across heterogeneous infrastructure
- capability-aware install validation
- cleaner portability story for the wider community
- easier contribution of environment-specific overlays

---

## Phase 6 — Open Source Package Ecosystem

Expand Forge beyond a personal platform into a community-shaped system.

### Goals

- define contribution patterns for new service packages
- create a shared package vocabulary
- document platform package authoring
- encourage consistent, professional service definitions
- attract contributors aligned with the Forge model

### Target Outcomes

- community-submitted package patterns
- stronger documentation and examples
- clearer package authoring standards
- a growing ecosystem around a shared platform grammar

### Community Vision

Forge should become useful not only because it runs on one homelab, but because it expresses a model that others recognize as valuable.

---

## Near-Term Priorities

The current near-term priorities are:

1. stabilize repo layout
2. complete baseline middleware installs
3. deploy Forgejo cleanly
4. formalize database migration workflow
5. document initial platform contracts
6. begin shaping Rust control-layer concepts

---

## Guiding Principle

Forge Homelab OS is being built around one central idea:

**infrastructure should become more understandable as it grows, not less.**

Every roadmap phase should move the system toward:

- stronger contracts
- cleaner boundaries
- less hidden knowledge
- more deterministic behavior
- more portable operation
- more community legibility

---

## Status

This roadmap is active and will evolve with the system.

Forge is being developed through real use, real friction, and real platform decisions. The roadmap should reflect that reality while preserving the long-term direction of the project.
