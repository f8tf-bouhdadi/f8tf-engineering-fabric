# COM1-ES — Bounded Framed Message Interaction Engineering Service

COM1-ES is a reusable communication engineering brick with explicit Service
Guarantees and three successive assurance products designed to reduce risk
across specification, realization and delivery:

- **Product 1 — Assured Integration-Ready Engineering Service Specification**
  reduces **Specification & Integration Risk**;
- **Product 2 — Qualified Runtime**
  reduces **Realization & Qualification Risk**;
- **Product 3 — Qualified Delivery**
  reduces **Delivery & Acquisition Risk**.

The complete public engineering surface remains inspectable from the Service
Contract and Service Guarantees through specification, integration,
qualification and independent client verification.

## Engineering Service Products

COM1-ES is provided through three successive lifecycle products governed by
the same authoritative Service Guarantees.

### Product 1 — Assured Integration-Ready Engineering Service Specification

**Public documentation available**

Product 1 defines and assures the COM1-ES specification and provides the
integration-ready realization prescription.

The Product 1 documentation is exposed directly through this COM1-ES public
surface.

### Product 2 — Qualified Runtime

**Public qualification documentation**

Product 2 extends Product 1 through executable realization, executable
qualification and Qualified Runtime Identity.

Public Product 2 documentation exposes qualification and runtime-identity
information without publishing the private development source tree.

The qualified executable delivery is published as:

- [COM1 Qualified Runtime Delivery 1.0.0](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/com1-qualified-runtime-delivery-v1.0.0)

Product 2 documentation:

- [Product 2 — Qualified Runtime](products/product2-qualified-runtime/README.md)

### Product 3 — Qualified Delivery

**Public qualified-delivery documentation**

Product 3 extends Product 2 through the delivery boundary and establishes an
independently verifiable and operable Qualified Delivery.

Product 3 documentation:

- [Product 3 — Qualified Delivery](products/product3-qualified-delivery/README.md)

Its public presentation remains separate from Product 2 and does not alter
the Product 1 or Product 2 engineering boundaries.

The authoritative COM1-ES Service Guarantees are not redefined between these
three products.

## Product 1 — Public Specification Surface

This public surface exposes:

**COM1-ES Product 1 — Assured Integration-Ready Engineering Service Specification**

Product 1 defines what COM1-ES commits to provide, how its authoritative Service
Guarantees are preserved across the RM-ODP specification chain, and how an
independent integrator may derive a conforming realization without redefining
the Service Contract or Service Guarantees.

## When COM1-ES Is Relevant

COM1-ES is intended for systems in which application messages are exchanged
over a stream-oriented communication environment and message boundaries,
complete reception and interaction-failure isolation must be explicit
contractual properties.

Typical situations include:

- length-prefixed TCP application protocols;
- integration gateways receiving framed messages;
- industrial or legacy socket-based services;
- communication boundaries where incomplete or oversized messages must not
  enter normal application processing.

COM1-ES is not merely a framing implementation.

It is an Engineering Service whose Product 1 specification makes the required
interaction guarantees explicit, preserves them across the RM-ODP viewpoints
and exposes an integration-ready realization prescription.

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

The Service Contract and Service Guarantees are specified through five RM-ODP
viewpoint specifications:

1. [Enterprise Specification](specification/enterprise.md)
2. [Information Specification](specification/information.md)
3. [Computational Specification](specification/computational.md)
4. [Engineering Specification](specification/engineering.md)
5. [Technology Specification](specification/technology.md)

The Service Guarantees remain authoritative across these specifications.

## Specification Assurance

The preservation of the authoritative Service Guarantees across the Product 1
specification chain is made explicit through:

- applicable correspondence mappings between RM-ODP viewpoint specifications;
- Specification Proof Obligations derived from those mappings.

See:

- [Specification Proof Obligations](assurance/SPECIFICATION_PROOF_OBLIGATIONS.md)

## UML Projections

The authoritative RM-ODP textual specifications have corresponding UML
projections for engineering communication and integration:

1. [Enterprise UML](uml/enterprise.puml)
2. [Information UML](uml/information.puml)
3. [Computational UML](uml/computational.puml)
4. [Engineering UML](uml/engineering.puml)
5. [Technology UML](uml/technology.puml)

The UML projections do not introduce additional Service Guarantees or lifecycle
stages.

## Integration Readiness

Product 1 exposes the realization prescription required by an independent
integrator to derive a conforming implementation while preserving the upstream
Service Contract and Service Guarantees.

See:

- [Product 1 Realization Mapping](realization/PRODUCT1_REALIZATION_MAPPING.md)
- [Integrator Traceability Map](integration/INTEGRATOR_TRACEABILITY_MAP.md)

The Integrator Traceability Map provides a guarantee-to-realization navigation
projection and introduces no new Service Guarantee, specification obligation,
Specification Proof Obligation or realization responsibility.

## Product 1 Boundary

Product 1 includes specification assurance and realization mapping.

It does not include:

- an executable realization;
- executable qualification;
- Qualified Runtime;
- delivery qualification;
- Qualified Delivery;
- independent client operation.

Those concerns belong to subsequent lifecycle products.

## Product 1 Chain

    Service Contract
        ->
    Authoritative Service Guarantees
        ->
    RM-ODP Specifications
        <->
    UML Projections

    RM-ODP Specifications
        ->
    RM-ODP Correspondence Mappings
        ->
    Specification Proof Obligations
        ->
    Specification Assurance
        ->
    Product 1 Realization Mapping
        ->
    Assured Integration-Ready Engineering Service Specification
