# COM1-ES — Bounded Framed Message Interaction Engineering Service

## Public Product

This public surface exposes:

**Product 1 — Engineering Service Specification**

It defines what COM1-ES commits to provide and how its authoritative Service
Guarantees are assured through the RM-ODP viewpoint specifications.

## Enterprise Objective

Enable bounded application-message interaction over a stream-oriented
transport so that message boundaries are explicit, inadmissible or incomplete
framed inputs are not treated as valid messages, and failure of one interaction
does not prevent subsequent interactions.

## Authoritative Service Guarantees

COM1-ES defines four authoritative Service Guarantees:

- `G-COM1-BOUNDED` — Bounded Frame Acceptance
- `G-COM1-COMPLETE` — Complete Frame Reception
- `G-COM1-RESPONSE` — Response After Complete Admissible Input
- `G-COM1-ISOLATION` — Client Interaction Failure Isolation

See:

- [Service Contract](SERVICE_CONTRACT.md)

## RM-ODP Engineering Service Specification

The Service Contract and Service Guarantees are assured through five RM-ODP
viewpoint specifications:

1. [Enterprise Specification](specification/enterprise.md)
2. [Information Specification](specification/information.md)
3. [Computational Specification](specification/computational.md)
4. [Engineering Specification](specification/engineering.md)
5. [Technology Specification](specification/technology.md)

The Service Guarantees remain authoritative across these specifications.

## Lifecycle Boundary

This public surface contains Product 1 only.

Executable realization, qualification, qualified runtime identity, delivery,
delivery qualification and independent operation belong to subsequent lifecycle
products and are not part of this public Product 1 specification.
