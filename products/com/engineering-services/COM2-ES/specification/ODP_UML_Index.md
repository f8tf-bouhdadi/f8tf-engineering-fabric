# COM2-ES — RM-ODP / UML Index

## Status

This index relates the authoritative textual COM2 RM-ODP viewpoint
specifications to their graphical UML projections.

The textual RM-ODP specifications are authoritative.

The UML artifacts are traceable graphical projections of those specifications.
They do not define additional RM-ODP viewpoints and shall not introduce
semantics absent from the corresponding textual specification.

## Enterprise Viewpoint

Canonical specification:

- `enterprise.md`

UML projections:

- `../uml/enterprise-classes.puml`
- `../uml/enterprise-usecases.puml`

Primary identifier families:

- `UC-COM2-*`
- `POL-COM2-*`
- `G-COM2-*`

Projection purpose:

- service structure;
- Enterprise role;
- Service Contract;
- Service Guarantees;
- interaction-admission use case.

## Information Viewpoint

Canonical specification:

- `information.md`

UML projections:

- `../uml/information-classes.puml`
- `../uml/information-dynamic-schemas.puml`

Primary identifier families:

- `INF-OBJ-*`
- `INF-COR-COM2-*`
- `INF-DYN-COM2-*`
- `INF-INV-*`

Projection purpose:

- information objects;
- information correspondence;
- information invariants;
- dynamic admission schema.

## Computational Viewpoint

Canonical specification:

- `computational.md`

UML projections:

- `../uml/computational-classes.puml`
- `../uml/computational-sequences.puml`

Primary identifier families:

- `COMP-OBJ-COM2-*`
- `COMP-IF-COM2-*`
- `COMP-OP-COM2-*`
- `COMP-ACT-COM2-*`

Projection purpose:

- offered Computational interface;
- offered operation;
- internal computational activities;
- interaction-processing sequence.

## Engineering Viewpoint

Canonical specification:

- `engineering.md`

UML projections:

- `../uml/engineering-classes.puml`
- `../uml/engineering-sequences.puml`

Primary identifier families:

- `ENG-CH-COM2-*`
- `ENG-MECH-COM2-*`
- `ENG-CON-COM2-*`

Projection purpose:

- Engineering channel;
- transfer and representation mechanisms;
- outcome mechanism;
- preservation constraints.

## Technology Viewpoint

Canonical specification:

- `technology.md`

UML projections:

- `../uml/technology-classes.puml`
- `../uml/technology-sequences.puml`

Primary identifier families:

- `TECH-PROF-COM2-*`
- `TECH-ARCH-COM2-*`
- `TECH-COMP-COM2-*`
- `TECH-BIND-COM2-*`
- `TECH-END-COM2-*`
- `TECH-REP-COM2-*`
- `TECH-CODEC-COM2-*`
- `TECH-COR-COM2-*`
- `TECH-OUT-COM2-*`
- `TECH-CON-COM2-*`

Projection purpose:

- reference Technology profile;
- Technology architecture;
- Technology components;
- HTTP/JSON binding;
- representation and codec;
- admission outcome realization.

## UML Projection Rule

For each RM-ODP viewpoint:

1. the textual specification defines the canonical semantics;
2. the UML model projects selected structure or behaviour;
3. every identifier used by the UML projection shall exist in the
   authoritative textual specification;
4. the UML projection shall introduce no additional Service Guarantee or
   RM-ODP obligation;
5. an upstream UML projection shall contain no downstream realization or
   qualification concept absent from its textual viewpoint.

## Product 1 Construction Order

The COM2 Product 1 construction order is:

    Enterprise
        ->
    Information
        ->
    Computational
        ->
    Engineering
        ->
    Technology

This ordered construction path does not define the RM-ODP correspondence
graph.

Canonical pairwise correspondence specifications are defined in:

- `COM2_ODP_CORRESPONDENCE_SPECIFICATIONS.md`

Their UML4ODP correspondence projection is:

- `../uml/correspondences.puml`

The viewpoint UML projections are parallel graphical representations of the
five viewpoint specifications and are not additional lifecycle stages.

## Product 1 Realization Boundary

The Technology Viewpoint is the final RM-ODP viewpoint of COM2 Product 1.

Its contract-relevant realization responsibilities are projected through:

- `../realization/PRODUCT1_REALIZATION_MAPPING.md`

and the integrator-facing traceability view:

- `../integration/INTEGRATOR_TRACEABILITY_MAP.md`

Concrete executable realization and qualification belong to later lifecycle
stages.
