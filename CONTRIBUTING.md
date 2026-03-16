# Contributing to Forge Homelab OS

Thank you for your interest in contributing to **Forge Homelab OS**.

Forge is an open-source, contract-driven platform project focused on turning homelab infrastructure into a coherent operating model for services. Contributions are welcome, but they should align with the project’s core principles: clarity, determinism, portability, and strong system boundaries.

## Project Mindset

Forge is not intended to become a loose collection of scripts, charts, and one-off fixes.

Contributions should move the platform toward:

- explicit contracts
- reusable templates
- controlled overrides
- deterministic behavior
- portable infrastructure patterns
- reduced operator guesswork
- clean service boundaries

If a contribution makes the system harder to understand, harder to validate, or more dependent on tribal knowledge, it is probably not a good fit.

## Before You Contribute

Please take time to understand the project direction before opening a pull request.

Start with:

- `README.md`
- `ROADMAP.md` once available
- `ARCHITECTURE.md` once available

Contributions should support the long-term Forge model rather than solve only a local or temporary problem.

## Ways to Contribute

There are several good ways to contribute:

### Report Issues

Open an issue if you find:

- bugs
- broken manifests
- missing documentation
- unclear platform behavior
- confusing service boundaries
- portability problems across environments

Please include as much useful context as possible.

### Improve Documentation

Documentation contributions are valuable, especially if they improve:

- setup clarity
- architectural explanations
- package/service contracts
- namespace design
- secret management patterns
- migration workflows
- examples and usage guides

### Propose Platform Patterns

Forge is especially interested in reusable patterns such as:

- service contract definitions
- Helm packaging conventions
- namespace-oriented layouts
- storage and secret protocols
- database lifecycle workflows
- cluster capability overlays
- Rust-driven validation or orchestration models

### Submit Code or Config Changes

Code, YAML, and infrastructure contributions are welcome when they strengthen the project’s operating model.

Good contributions usually make the system:

- more consistent
- more explicit
- easier to validate
- easier to port
- easier to operate correctly

## Contribution Guidelines

### 1. Respect the contract-first approach

Do not begin with implementation alone.

When introducing or changing a platform component, clarify:

- what it is
- what it requires
- what it provides
- what boundaries it belongs to
- what can be overridden safely

### 2. Avoid one-off fixes

Forge should not accumulate ad hoc exceptions unless they are clearly justified.

Where possible, prefer a reusable pattern over a local patch.

### 3. Keep changes legible

Contributions should be understandable by someone reading the repo later.

Favor clear naming, explicit structure, and minimal surprise.

### 4. Preserve determinism

Changes should reduce ambiguity, not increase it.

If a process depends on manual memory or hidden operator knowledge, it should be treated as incomplete.

### 5. Design for portability

Forge is intended to operate across heterogeneous environments, including:

- virtual machines
- rack servers
- Raspberry Pi clusters
- future cloud substrates

Contributions should avoid hardcoding assumptions unless the boundary is intentional and documented.

## Pull Request Process

1. Fork the repository.
2. Create a branch for your change.
3. Make focused, well-scoped commits.
4. Update documentation when behavior changes.
5. Open a pull request with a clear explanation of:
   - what changed
   - why it changed
   - how it fits the Forge model

Large architectural changes should ideally begin as an issue or design discussion before implementation.

## What Makes a Strong Contribution

A strong contribution usually does at least one of the following:

- clarifies a system boundary
- removes repeated manual work
- strengthens a service contract
- improves portability
- reduces hidden operational knowledge
- makes the platform easier to reason about

## Code and Style Expectations

As the project evolves, more formal conventions may be added. For now:

- prefer clarity over cleverness
- keep naming consistent
- document important decisions
- avoid unnecessary abstraction
- align with the project’s architecture and terminology

## Community Tone

Forge should be a serious but welcoming open-source project.

Be respectful, direct, and constructive. Good-faith disagreement is fine. Clear thinking is encouraged. The goal is to build something durable.

## License

By contributing to this repository, you agree that your contributions will be licensed under the same license as the project.
