# Forge Homelab OS Architecture

**Forge Homelab OS** is a contract-driven platform architecture for building and operating self-hosted services as a coherent system.

This document explains the architectural model behind Forge, the major layers of the platform, and the direction of the repository as it evolves from a homelab codebase into a reusable operating model.

---

## Architectural Intent

Forge is built around a simple idea:

**a homelab should behave like a system, not a pile of installations.**

Most self-hosted environments grow by accumulation. A service is added, a secret is patched, a database is changed manually, and a chart is tuned in place. Over time, the environment may continue to function, but it becomes harder to reason about, harder to reproduce, and more dependent on the memory of the operator.

Forge is an attempt to replace that pattern with a platform law built on:

- explicit contracts
- deterministic install flows
- reusable templates
- controlled environment specialization
- typed orchestration logic
- infrastructure that can explain itself

---

## Platform Layers

Forge is not a replacement for Linux, Kubernetes, or Helm.

It is a higher-order operating model built on top of them.

### 1. Machine Substrate

This is the physical or virtual host layer.

Examples include:

- Dell R440 virtual machines
- Raspberry Pi nodes
- future cloud VMs
- other Linux-capable hosts

This layer provides compute, memory, storage, and network access.

### 2. Cluster Fabric

This is the service execution layer.

In Forge, this is currently centered around:

- Kubernetes
- k3s

The cluster fabric provides workload scheduling, service discovery, namespace boundaries, and the core runtime surface for platform services.

### 3. Package Backend

This is the service installation backend.

In Forge, this is currently centered around:

- Helm charts
- Kubernetes manifests where appropriate

Helm is used as a package delivery mechanism, but not as the source of truth for the platform’s architecture.

### 4. Forge Operating Layer

This is the actual core of the system.

Forge defines:

- what a service is
- where it belongs
- what it requires
- what it provides
- how it is installed
- how it is configured
- how it evolves
- what boundaries it must respect

This is the layer that gives the system identity.

### 5. Future Rust Control Layer

As Forge matures, Rust will act as the typed resolver and executor for platform behavior.

The Rust layer is expected to handle:

- parsing service definitions
- validating contracts
- merging templates and overrides
- resolving compatibility against cluster capabilities
- executing deterministic install and lifecycle plans
- reducing hidden operator logic

This is the layer that will eventually move operational intelligence from the human operator into the platform itself.

---

## Architectural Model

Forge is moving toward a service architecture built on three primary concepts:

### Contract

The contract defines the law of a service.

It answers questions such as:

- What is this service?
- What namespace class does it belong to?
- What dependencies does it require?
- What secrets must exist?
- What storage does it require?
- What network exposure is allowed?
- What architectures are supported?

The contract defines what cannot be casually changed.

### Template

The template defines the default implementation of the service.

It may include:

- chart source
- chart version
- default values
- standard labels
- probes
- service defaults
- persistence defaults
- ingress defaults

The template is the reusable installation blueprint.

### Override

The override defines environment-specific specialization.

Examples include:

- resource sizing
- storage class
- ingress class
- architecture-specific image tags
- environment DNS
- internal scaling differences

Overrides should specialize the service without redefining its identity.

---

## Service Domains

Forge organizes services by platform role rather than by arbitrary installation order.

These domains may evolve, but the current architectural direction includes the following categories.

### Middleware

Shared foundational services used by other platform components.

Examples:

- Postgres
- Redis
- message brokers
- shared internal data systems

These services are not generally exposed as user-facing applications.
They exist to support the rest of the platform.

### CICD

Services related to source control, automation, and build systems.

Examples:

- Forgejo
- runners
- package automation
- future pipeline services

This domain is responsible for helping the platform build and evolve itself.

### Portal

Ingress-facing application services and user-accessible interfaces.

Examples:

- dashboards
- media tools
- internal portals
- web-facing system tools

### Storage

Services responsible for persistence strategy, data placement, and storage-oriented capabilities.

Examples:

- storage classes
- backup tooling
- object storage
- replicated storage systems

### Observability

Services that allow the platform to understand and inspect itself.

Examples:

- metrics
- logging
- dashboards
- tracing
- alerting

These domains help maintain clear service boundaries and support future package rules.

---

## Node Identity and System Feel

Forge treats node identity as part of the architecture, not just decoration.

A node should communicate:

- what it is
- what role it serves
- how it belongs to the larger system
- what workspace or platform context matters on login

This is why even the SSH entry experience matters. It reinforces that the system is not a random Linux host but a named platform node operating under Forge law.

---

## Database Lifecycle Philosophy

Database changes are treated as a platform concern, not an operator side-channel.

The current architectural direction rejects long-term dependence on:

- manual `kubectl exec`
- hand-run SQL sessions
- undocumented database changes
- operator-only migration history

Instead, Forge is moving toward database lifecycle primitives such as:

- SQL artifacts
- migration jobs
- execution ledgers
- tracked and repeatable database updates

This ensures that database evolution becomes a formal part of the platform.

---

## Portability Model

Forge is intended to work across mixed hardware and cluster types.

Examples include:

- R440 VM-backed clusters
- Raspberry Pi clusters
- future hybrid or cloud deployments

Portability does not mean every environment is identical.

It means the **contract remains stable** while the resolved install plan adapts to environment capabilities.

This requires a distinction between:

- service definition
- cluster capability profile
- resolved install plan

That separation is essential to keeping the platform portable without devolving into snowflake configurations.

---

## Repository Direction

This repository is expected to evolve into a structured platform definition space containing things such as:

- namespace-oriented infrastructure layout
- service packages
- contract definitions
- templates
- environment overlays
- secret protocols
- migration workflows
- Rust-driven platform orchestration logic

The exact directory structure may evolve, but the architectural intent is stable: the repository should express platform law, not merely store deployment files.

---

## Architectural Priorities

The current architecture is moving toward the following priorities:

- clear namespace boundaries
- reusable Helm install patterns
- strong service identity
- clean database administration workflow
- typed platform logic in Rust
- support for heterogeneous environments
- community-legible package definitions

Each of these priorities supports the larger goal of making the system more understandable as it grows.

---

## Long-Term Direction

The long-term direction of Forge Homelab OS is to become a platform where:

- services are defined by contract
- deployments are resolved deterministically
- platform behavior is validated before execution
- database and service changes are tracked
- environment-specific differences are handled through controlled overlays
- the operator is no longer the only source of truth

In that future, Forge becomes more than a repository of manifests and charts.

It becomes an actual operating model for self-hosted systems.

---

## Summary

Forge Homelab OS is architected around one core belief:

**systems should gain clarity as they scale.**

Everything in this architecture flows from that principle.
