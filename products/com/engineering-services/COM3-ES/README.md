# COM3-ES — Assured Operation Interaction Engineering Service

COM3-ES is a reusable communication Engineering Service for preserving the
declared semantics of RM-ODP Operation interactions between a Service Consumer
and a Service Provider.

It supports both Operation forms:

- Announcement;
- Interrogation.

## Products

COM3-ES follows the F8TF lifecycle-product model.

### Product 1 — Assured Integration-Ready Engineering Service Specification

**Lifecycle:** `LCS-01` through `LCS-07`

Answers:

**What shall the engineering brick guarantee?**

Product 1 establishes the Service Contract, authoritative Service Guarantees,
RM-ODP specifications, applicable correspondences, specification assurance and
integration-ready realization responsibilities.

- [Review Product 1 — Assured Specification](products/product1-assured-integration-ready-specification/)

### Product 2 — Qualified Runtime

**Lifecycle:** `LCS-08` through `LCS-10`

Answers:

**Which exact executable realization has been qualified against the COM3-ES Service Guarantees?**

Product 2 establishes the executable realization, its qualification against all
seven authoritative COM3-ES Service Guarantees and the exact Qualified Runtime
Identity.

- [Review Product 2 — Qualified Runtime](products/product2-qualified-runtime/)

### Product 3 — Qualified Delivery

**Lifecycle:** `LCS-11` through `LCS-16`

Product 3 establishes the independently verifiable and operable Qualified
Delivery surface for COM3-ES.

- [Review Product 3 — Qualified Delivery](products/product3-qualified-delivery/)

The public Product 3 engineering surface is established. The sealed
downloadable release archive is not yet published.

## When COM3-ES Is Relevant

COM3-ES is intended for systems that expose declared Operation interactions and
must preserve their contractual interaction semantics independently of a
particular protocol, serialization format, routing mechanism or transport.

Typical concerns include:

- preserving the identity of the declared Operation;
- preserving Announcement versus Interrogation semantics;
- establishing invocation conformance;
- preventing technical acknowledgements from redefining Announcement semantics;
- constraining Interrogation terminations to declared termination types;
- preserving invocation-to-termination association;
- establishing a single contractual termination for a completed Interrogation.

## Authoritative Service Guarantees

COM3-ES defines seven authoritative Service Guarantees:

- `G-COM3-01` — Declared Operation Preservation
- `G-COM3-02` — Operation Form Preservation
- `G-COM3-03` — Invocation Conformance
- `G-COM3-04` — Announcement Termination Independence
- `G-COM3-05` — Declared Termination Conformance
- `G-COM3-06` — Invocation-Termination Association
- `G-COM3-07` — Single Termination Selection

See:

- [Service Contract](SERVICE_CONTRACT.md)

## RM-ODP Engineering Service Specification

The Service Contract is represented through five RM-ODP viewpoint
specifications:

1. [Enterprise Specification](specification/enterprise.md)
2. [Information Specification](specification/information.md)
3. [Computational Specification](specification/computational.md)
4. [Engineering Specification](specification/engineering.md)
5. [Technology Specification](specification/technology.md)

## RM-ODP Correspondence

Applicable inter-viewpoint correspondence is represented through explicit
pairwise correspondence specifications.

See:

- [RM-ODP Correspondence Specifications](specification/COM3_ODP_CORRESPONDENCE_SPECIFICATIONS.md)
- [RM-ODP / UML4ODP Correspondence Projection](uml/correspondences.puml)

RM-ODP correspondence is distinct from F8TF Service Guarantee preservation.

## Specification Assurance

The seven authoritative Service Guarantees have corresponding Specification
Proof Obligations.

See:

- [Specification Proof Obligations](assurance/SPECIFICATION_PROOF_OBLIGATIONS.md)

These obligations establish Product 1 specification assurance. They do not
constitute executable qualification.

## Integration Readiness

Product 1 exposes the realization responsibilities required by an independent
integrator while preserving the COM3-ES Service Contract and Service
Guarantees.

See:

- [Product 1 Realization Mapping](realization/PRODUCT1_REALIZATION_MAPPING.md)
- [Integrator Traceability Map](integration/INTEGRATOR_TRACEABILITY_MAP.md)

## Product 1 Boundary

Product 1 covers `LCS-01` through `LCS-07`.

It does not include executable realization, executable qualification, Qualified
Runtime, Qualified Delivery or independent client operation.
