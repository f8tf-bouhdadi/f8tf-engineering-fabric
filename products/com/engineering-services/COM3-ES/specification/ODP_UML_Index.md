# COM3 — RM-ODP / UML Index

## Status

This index relates the authoritative textual COM3 RM-ODP viewpoint
specifications to their graphical UML projections.

The textual RM-ODP specifications are authoritative.

The UML artifacts are traceable graphical projections of those specifications.

They do not define additional RM-ODP viewpoints and shall not introduce
semantics absent from the corresponding textual specification.

---

## Enterprise Viewpoint

Canonical specification:

- `../../odp/enterprise/01_scope.md`

Service Contract:

- `../COM3_SERVICE_CONTRACT.md`

UML projections:

- `../../odp/enterprise/classes.puml`
- `../../odp/enterprise/usecases.puml`

Primary identifier families:

- `ENT-ROLE-COM3-*`
- `ENT-OBJ-COM3-*`
- `ENT-OBL-COM3-*`
- `G-COM3-*`

Projection purpose:

- Enterprise roles;
- declared Operation concepts;
- Enterprise obligations;
- Service Contract;
- Service Guarantees;
- Announcement and Interrogation interaction semantics.

---

## Information Viewpoint

Canonical specification:

- `../../odp/information/information.md`

Refinement mapping:

- `../../odp/information/enterprise_to_information_mapping.md`

UML projections:

- `../../odp/information/classes.puml`

Primary identifier families:

- `INF-OBJ-COM3-*`
- `INF-INV-COM3-*`

Projection purpose:

- Information objects;
- Operation declaration representation;
- invocation and termination representation;
- Information invariants preserving Operation interaction semantics.

---

## Computational Viewpoint

Canonical specification:

- `../../odp/computational/interfaces.md`

Refinement mapping:

- `../../odp/computational/information_to_computational_mapping.md`

UML projections:

- `../../odp/computational/classes.puml`
- `../../odp/computational/sequences.puml`

Primary identifier families:

- `COMP-OBJ-COM3-*`
- `COMP-IF-COM3-*`
- `COMP-OBL-COM3-*`

Projection purpose:

- Computational objects;
- OperationInteractionService interface;
- computational obligations;
- Announcement interaction behaviour;
- Interrogation interaction behaviour.

---

## Engineering Viewpoint

Canonical specification:

- `../../odp/engineering/mechanisms.md`

Refinement mapping:

- `../../odp/engineering/computational_to_engineering_mapping.md`

UML projections:

- `../../odp/engineering/classes.puml`
- `../../odp/engineering/sequences.puml`

Primary identifier families:

- `ENG-COMP-COM3-*`

Projection purpose:

- Operation declaration binding;
- invocation-conformance guard;
- Operation-form guard;
- Announcement completion boundary;
- Interrogation state binding;
- termination-conformance guard;
- Invocation-Termination binding;
- single-termination guard.

No Engineering structure is introduced by the UML projections unless it is
already independently identified by the authoritative Engineering
specification.

---

## Technology Viewpoint

Canonical specification:

- `../../odp/technology/technology.md`

Refinement mapping:

- `../../odp/technology/ENGINEERING_TECHNOLOGY_MAPPING.md`

UML projections:

- `../../odp/technology/classes.puml`
- `../../odp/technology/sequences.puml`

Primary identifier families:

- `TECH-PROF-COM3-*`
- `TECH-ARCH-COM3-*`
- `TECH-COMP-COM3-*`
- `TECH-BIND-COM3-*`
- `TECH-GUARD-COM3-*`
- `TECH-BOUND-COM3-*`
- `TECH-STATE-COM3-*`
- `TECH-COR-COM3-*`
- `TECH-CON-COM3-*`
- `TECH-RULE-COM3-*`

Projection purpose:

- reference Technology profile;
- structured Technology architecture;
- Technology components;
- concrete Operation-interaction realization responsibilities;
- preservation of Engineering responsibilities in the selected
  Technology profile.

A reference JSON/RPC binding may realize COM3 responsibilities but does not
define the generic COM3 Engineering Service semantics.

---

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

---

## Product 1 Construction Order

The COM3 Product 1 construction order is:

    Enterprise
        ->
    Service Contract and Guarantees
        ->
    Information
        ->
    Computational
        ->
    Engineering
        ->
    Technology

This ordered construction path records the F8TF Product 1 derivation path.

It does not define the RM-ODP correspondence graph.

---

## RM-ODP Correspondence Specifications

Canonical pairwise Product 1 correspondence specifications are defined in:

- `COM3_ODP_CORRESPONDENCE_SPECIFICATIONS.md`

They define:

- `CS-COM3-EI` — Enterprise–Information;
- `CS-COM3-EC` — Enterprise–Computational;
- `CS-COM3-EENG` — Enterprise–Engineering;
- `CS-COM3-IC` — Information–Computational;
- `CS-COM3-CENG` — Computational–Engineering;
- `CS-COM3-ENGT` — Engineering–Technology.

Their UML4ODP projection is:

- `../uml/COM3_ODP_Correspondences.puml`

These correspondence specifications are pairwise and non-transitive.

RM-ODP correspondence and F8TF Service Guarantee preservation are distinct
Product 1 relationships.

---

## Product 1 Specification Assurance

The authoritative Service Guarantees are defined in:

- `../COM3_SERVICE_CONTRACT.md`

Their preservation through the RM-ODP viewpoint specifications is evaluated
by:

- `../COM3_SPECIFICATION_PROOF_OBLIGATIONS.md`

The Specification Proof Obligations provide the F8TF assurance relation.

They are not RM-ODP CorrespondenceLinks.

---

## Product 1 Realization Mapping

Technology responsibilities available to an independent integrator are
projected through:

- `../COM3_PRODUCT1_REALIZATION_MAPPING.md`

This mapping belongs to Product 1.

Executable realization and executable qualification begin after Product 1.

---

## Integrator Traceability

Integrator-facing end-to-end Product 1 traceability is defined in:

- `../COM3_INTEGRATOR_TRACEABILITY_MAP.md`

For each Service Guarantee, the integrator shall be able to trace from the
authoritative Service Contract through the applicable viewpoint obligations
to the Product 1 realization responsibility.

---

## Product 1 Boundary

COM3 Product 1 is:

**Assured Integration-Ready Engineering Service Specification**

Its applicable lifecycle scope is:

- LCS-01 — Enterprise Objective;
- LCS-02 — Enterprise Specification;
- LCS-03 — Service Contract and Guarantees;
- LCS-04 — Information Specification;
- LCS-05 — Computational Specification;
- LCS-06 — Engineering Specification;
- LCS-07 — Technology Specification.

Product 1 contains:

- authoritative Enterprise semantics;
- Service Contract and Service Guarantees;
- Information, Computational, Engineering and Technology specifications;
- pairwise RM-ODP correspondence specifications;
- F8TF Specification Proof Obligations;
- UML projections;
- Product 1 realization mappings;
- integrator traceability.

Product 1 does not establish executable realization, executable
qualification, qualified runtime identity, runtime delivery or client
operation.
