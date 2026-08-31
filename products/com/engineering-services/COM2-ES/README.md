# COM2-ES — Controlled Interaction Admission Engineering Service

COM2-ES is a reusable communication engineering brick for controlled admission
of structured interaction submissions.

Its Product 1 specification makes admission behaviour explicit before an
integrator commits to a concrete executable realization.

## Products

COM2-ES is represented publicly through three distinct lifecycle products.

### Product 1 — Assured Integration-Ready Engineering Service Specification

**Lifecycle:** `LCS-01` through `LCS-07`

Answers:

**What shall the engineering brick guarantee?**

Product 1 establishes the Service Contract, authoritative Service Guarantees,
RM-ODP specifications, applicable correspondences, specification assurance and
integration-ready realization responsibilities.

- [Review Product 1](SERVICE_CONTRACT.md)

### Product 2 — Qualified Runtime

**Lifecycle:** `LCS-08` through `LCS-10`

Answers:

**Which exact executable realization has been qualified?**

Product 2 establishes the executable realization, its qualification against the
COM2-ES Service Guarantees and the exact Qualified Runtime Identity.

- [Review Product 2 — Qualified Runtime](products/product2-qualified-runtime/)

### Product 3 — Qualified Delivery

**Lifecycle:** `LCS-11` through `LCS-16`

Answers:

**Which exact delivery can the recipient independently verify and operate?**

Product 3 establishes the Operator Contract, Runtime Delivery, Delivery
Verification, Qualified Delivery Identity, Sealed Delivery and Independent
Client Verification and Operation.

- [Review Product 3 — Qualified Delivery](products/product3-qualified-delivery/)

The three products represent increasing engineering responsibility:

    Product 1 — Assured Specification
        ->
    Product 2 — Qualified Runtime
        ->
    Product 3 — Qualified Delivery

## Product 1 — Assured Integration-Ready Engineering Service Specification

Product 1 establishes the assured specification layer of COM2-ES:

**Product 1 — Assured Integration-Ready Engineering Service Specification**

Product 1 defines what COM2-ES commits to provide, preserves the authoritative
Service Guarantees through the RM-ODP viewpoint specifications, establishes
the applicable pairwise RM-ODP correspondences, and provides an
integration-ready realization prescription.

## When COM2-ES Is Relevant

COM2-ES is intended for systems that receive structured interaction units and
must decide explicitly whether each submission is admitted.

The service is relevant when an integration boundary requires properties such
as:

- explicit admission or rejection;
- prevention of inadmissible submissions entering normal processing;
- preservation of interaction identity on acceptance;
- optional information that does not become an accidental admission
  requirement.

## Enterprise Objective

Provide controlled admission of structured interaction envelopes so that an
Interaction Submitter obtains an explicit admission outcome for each evaluated
interaction submission.

## Authoritative Service Guarantees

COM2-ES defines four authoritative Service Guarantees:

- `G-COM2-01` — Controlled Interaction Admission
- `G-COM2-02` — Explicit Admission Outcome
- `G-COM2-03` — Interaction Identity Preservation
- `G-COM2-04` — Optional Interaction Information

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

## RM-ODP Correspondence

Applicable inter-viewpoint correspondence is represented explicitly through
six pairwise correspondence specifications aligned with the COM2 X.911
semantics and represented using the X.906 correspondence model.

The correspondence relation is pairwise and non-transitive.

See:

- [RM-ODP Correspondence Specifications](specification/COM2_ODP_CORRESPONDENCE_SPECIFICATIONS.md)
- [RM-ODP / UML4ODP Correspondence Projection](uml/correspondences.puml)

RM-ODP correspondence is distinct from F8TF Service Guarantee preservation.

## Specification Assurance

The four authoritative Service Guarantees have corresponding Specification
Proof Obligations.

See:

- [Specification Proof Obligations](assurance/SPECIFICATION_PROOF_OBLIGATIONS.md)

The Specification Proof Obligations establish Product 1 specification
preservation. They do not qualify an executable runtime.

## UML Projections

COM2-ES publishes structural and behavioural UML projections for the five
viewpoints together with a transversal RM-ODP correspondence projection.

Enterprise:

- [Enterprise Classes](uml/enterprise-classes.puml)
- [Enterprise Use Cases](uml/enterprise-usecases.puml)

Information:

- [Information Classes](uml/information-classes.puml)
- [Information Dynamic Schemas](uml/information-dynamic-schemas.puml)

Computational:

- [Computational Classes](uml/computational-classes.puml)
- [Computational Sequences](uml/computational-sequences.puml)

Engineering:

- [Engineering Classes](uml/engineering-classes.puml)
- [Engineering Sequences](uml/engineering-sequences.puml)

Technology:

- [Technology Classes](uml/technology-classes.puml)
- [Technology Sequences](uml/technology-sequences.puml)

Correspondence:

- [RM-ODP / UML4ODP Correspondences](uml/correspondences.puml)

See also:

- [RM-ODP / UML Index](specification/ODP_UML_Index.md)

## Integration Readiness

Product 1 exposes the realization responsibilities required by an independent
integrator without prescribing the source-code organization of a particular
implementation.

See:

- [Product 1 Realization Mapping](realization/PRODUCT1_REALIZATION_MAPPING.md)
- [Integrator Traceability Map](integration/INTEGRATOR_TRACEABILITY_MAP.md)

## Product 1 Boundary

Product 1 includes:

- Service Contract and Service Guarantees;
- five RM-ODP viewpoint specifications;
- applicable pairwise RM-ODP correspondence specifications;
- Specification Proof Obligations;
- UML projections;
- Product 1 realization mapping;
- integrator traceability.

Product 1 does not establish:

- an executable realization;
- executable qualification;
- Qualified Runtime identity;
- Qualified Delivery;
- independent client operation.

Those concerns belong to later lifecycle products.

## Product 1 Construction and Assurance

    Service Contract
        ->
    Authoritative Service Guarantees
        ->
    RM-ODP Viewpoint Specifications

    RM-ODP Viewpoint Specifications
        <->
    Pairwise RM-ODP Correspondence Specifications

    Authoritative Service Guarantees
        ->
    Specification Proof Obligations
        ->
    Specification Assurance

    Technology Specification
        ->
    Product 1 Realization Mapping
        ->
    Integration-Ready Implementation Responsibilities

The construction order is not a transitive RM-ODP correspondence graph.
