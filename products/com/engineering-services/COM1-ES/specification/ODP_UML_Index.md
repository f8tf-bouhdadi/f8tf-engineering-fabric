# COM1-ES — RM-ODP / UML Index

## Status

This index relates the canonical textual RM-ODP viewpoint specifications of
COM1-ES to their graphical UML projections.

The textual RM-ODP specifications are authoritative.

The UML artifacts are traceable graphical projections of those specifications.
They do not define additional RM-ODP viewpoints and shall not introduce
semantics absent from the corresponding textual specification.

---

## Enterprise Viewpoint

Canonical specification:

- `enterprise.md`

UML projection:

- `../uml/COM1_ODP_Enterprise_UseCases.puml`

Primary identifier family:

- `ENT-*`

Projection purpose:

- Enterprise Service Boundary;
- community;
- enterprise objective;
- roles;
- Enterprise interaction;
- actions;
- policies;
- enterprise process.

---

## Information Viewpoint

Canonical specification:

- `information.md`

UML projection:

- `../uml/COM1_ODP_Information_Classes.puml`

Primary identifier family:

- `INF-*`

Projection purpose:

- information objects;
- initial state;
- information invariants;
- dynamic-schema elements.

---

## Computational Viewpoint

Canonical specification:

- `computational.md`

UML projection:

- `../uml/COM1_ODP_Computational_Sequences.puml`

Primary identifier family:

- `COMP-*`

Projection purpose:

- offered Computational interface;
- offered operation;
- computational objects;
- internal responsibility sequence;
- computational rules.

---

## Engineering Viewpoint

Canonical specification:

- `engineering.md`

UML projection:

- `../uml/COM1_ODP_Engineering_Bindings.puml`

Primary identifier family:

- `ENG-*`

Projection purpose:

- Engineering Service Boundary;
- interaction-processing capsule;
- interaction-processing cluster;
- Basic Engineering Objects;
- interfaces;
- bindings;
- channels;
- Engineering invariants.

---

## Technology Viewpoint

Canonical specification:

- `technology.md`

UML projection:

- `../uml/COM1_ODP_Technology_Map.puml`

Primary identifier family:

- `TECH-*`

Projection purpose:

- reference Technology profile;
- Technology components;
- Technology mechanisms;
- Technology invariants.

---

## RM-ODP / UML4ODP Correspondence Projection

Canonical specification:

- `COM1_ODP_CORRESPONDENCE_SPECIFICATIONS.md`

UML projection:

- `../uml/COM1_ODP_Correspondences.puml`

Primary identifier families:

- `CS-COM1-*` — Correspondence Specifications;
- `CR-COM1-*` — Correspondence Rules;
- `CL-COM1-*` — Correspondence Links.

Projection purpose:

- project the six pairwise RM-ODP correspondence specifications;
- project each Correspondence Rule;
- project all canonical Correspondence Links and their endpoints;
- identify the two corresponding viewpoint specifications for each
  Correspondence Specification;
- preserve the distinction between RM-ODP correspondence and F8TF Service
  Guarantee preservation.

The textual correspondence specification is authoritative.

The UML correspondence projection is transversal to the five RM-ODP viewpoint
projections. It is not an additional RM-ODP viewpoint and does not introduce a
new Product 1 construction stage.

The correspondence relation represented by this projection is pairwise and
non-transitive.

---

## Textual/UML Projection Rule

For each RM-ODP viewpoint:

1. the textual specification defines the canonical semantics;
2. the corresponding UML model projects selected structure or behaviour;
3. every ODP identifier used by the UML projection shall exist in the canonical
   textual specification;
4. the UML projection shall not introduce a downstream Technology or code
   concept into an upstream viewpoint;
5. Technology UML may contain concrete Technology choices but shall remain
   independent of code-level realization symbols.

---

## Product 1 Construction Progression

The F8TF Product 1 construction progression is:

    Enterprise
        ->
    Information
        ->
    Computational
        ->
    Engineering
        ->
    Technology

This progression expresses the F8TF engineering construction order for
Product 1. It does not define or restrict the RM-ODP inter-viewpoint
correspondence graph.

Applicable RM-ODP correspondences are relationships between viewpoint
specifications and remain distinct from the Service Guarantee preservation
relationships used for F8TF specification assurance.

Each viewpoint has a corresponding UML projection.

The UML projections are parallel graphical representations of the viewpoint
specifications and are not additional RM-ODP viewpoints or lifecycle stages.

---

## Product 1 Realization Boundary

The Technology Viewpoint defines the final RM-ODP viewpoint specification of
COM1-ES Product 1.

Its realization responsibilities shall be connected to implementation through
an explicit Technology-to-Code / realization mapping.

That mapping belongs to Product 1 when it specifies how Technology elements,
mechanisms, invariants and Service Guarantee responsibilities are to be
realized without requiring a particular qualified executable instance.

The Product 1 trace is therefore:

    Service Contract and Service Guarantees
        ->
    RM-ODP textual specifications
        <->
    UML viewpoint projections
        ->
    Technology-to-Code / realization mapping
        ->
    implementation-ready Product 1 specification

Concrete executable realization, executable qualification, qualified runtime
identity, delivery and delivery verification belong to subsequent lifecycle
products.

---

## Historical UML Boundary

Historical UML artifacts under:

- `../../20-uml/`

are not authoritative projections of the current COM1 RM-ODP specification.

In particular, historical concepts that are not part of the current qualified
COM1 Service Contract shall not be imported into the canonical UML projections
without an explicit change to the authoritative specification.
