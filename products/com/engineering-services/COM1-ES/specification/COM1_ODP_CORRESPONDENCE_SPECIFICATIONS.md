# COM1-ES — RM-ODP Correspondence Specifications

## Status

This document defines the explicit RM-ODP inter-viewpoint correspondence
specifications for:

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

The correspondence model follows ITU-T X.906 | ISO/IEC 19793.

The authoritative semantics of each viewpoint remain defined by the
corresponding textual RM-ODP viewpoint specification.

This document does not redefine those viewpoint specifications.

---

## Correspondence Model

Each COM1 correspondence specification relates exactly two RM-ODP viewpoint
specifications.

For COM1, a correspondence specification contains:

- the two corresponding viewpoint specifications;
- applicable correspondence rules;
- correspondence links between terms of those specifications;
- explicit applicability or absence statements where a correspondence link
  is not applicable.

A correspondence link has two endpoints.

Each endpoint references one or more terms belonging to the corresponding
viewpoint specification.

Absence or non-applicability is not represented by a synthetic correspondence
endpoint.

---

## Separation from F8TF Specification Assurance

RM-ODP correspondence and F8TF Service Guarantee preservation are distinct
Product 1 relationships.

RM-ODP correspondence relates terms belonging to different viewpoint
specifications.

F8TF specification assurance traces:

    Service Guarantee
        ->
    preservation elements and obligations
        ->
    Specification Proof Obligation
        ->
    disposition

Service Guarantees are therefore not introduced as synthetic endpoints of
RM-ODP correspondence links.

---

# CS-COM1-EI — Enterprise–Information Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM1 Enterprise Viewpoint Specification
  (`enterprise.md`);
- endpoint viewpoint 2: COM1 Information Viewpoint Specification
  (`information.md`).

## CR-COM1-EI-01 — Enterprise Information Preservation Rule

Enterprise actions, policies and interactions represented in the Information
Viewpoint shall preserve the Enterprise semantics of the bounded framed
interaction without redefining Enterprise roles as Information objects.

## Correspondence Links

### CL-COM1-EI-01 — Bounded Framed Interaction Information

**endPoint1**

- `ENT-INTER-01`

**endPoint2**

- `INF-OBJ-01` through `INF-OBJ-07`;
- `INF-INV-01` through `INF-INV-08`;
- `INF-DYN-01` through `INF-DYN-06`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-02 — Submit Interaction

**endPoint1**

- `ENT-ACT-01`

**endPoint2**

- `INF-OBJ-01`;
- `INF-DYN-01`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-03 — Admission

**endPoint1**

- `ENT-ACT-02`

**endPoint2**

- `INF-OBJ-02`;
- `INF-OBJ-04`;
- `INF-DYN-02`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-04 — Completion

**endPoint1**

- `ENT-ACT-03`

**endPoint2**

- `INF-OBJ-03`;
- `INF-OBJ-05`;
- `INF-DYN-03`;
- `INF-DYN-04`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-05 — Response

**endPoint1**

- `ENT-ACT-04`

**endPoint2**

- `INF-OBJ-06`;
- `INF-DYN-05`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-06 — Failure Isolation

**endPoint1**

- `ENT-ACT-05`

**endPoint2**

- `INF-OBJ-07`;
- `INF-DYN-06`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-07 — Bounded Admission Policy

**endPoint1**

- `ENT-POL-01`

**endPoint2**

- `INF-INV-01`;
- `INF-INV-02`;
- `INF-INV-06`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-08 — Complete Reception Policy

**endPoint1**

- `ENT-POL-02`

**endPoint2**

- `INF-INV-03`;
- `INF-INV-04`;
- `INF-INV-05`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-09 — Response Eligibility Policy

**endPoint1**

- `ENT-POL-03`

**endPoint2**

- `INF-INV-07`;
- `INF-DYN-05`.

Applicable rule:

- `CR-COM1-EI-01`.

### CL-COM1-EI-10 — Failure Isolation Policy

**endPoint1**

- `ENT-POL-04`

**endPoint2**

- `INF-INV-08`;
- `INF-DYN-06`.

Applicable rule:

- `CR-COM1-EI-01`.

## Applicability Statements

No distinct Information object type is introduced for:

- `ENT-ROLE-01`;
- `ENT-ROLE-02`;
- `ENT-ROLE-03`.

These statements do not create correspondence links with synthetic endpoints.

---

# CS-COM1-EC — Enterprise–Computational Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM1 Enterprise Viewpoint Specification
  (`enterprise.md`);
- endpoint viewpoint 2: COM1 Computational Viewpoint Specification
  (`computational.md`).

## CR-COM1-EC-01 — Enterprise Computational Realization Rule

The Computational Viewpoint shall provide the computational behaviour required
to realize the applicable Enterprise interaction, actions, roles and policies
without redefining those Enterprise concepts as Computational concepts.

## Correspondence Links

### CL-COM1-EC-01 — Bounded Framed Interaction Community

**endPoint1**

- `ENT-COMM-01`

**endPoint2**

- `COMP-OBJ-01`;
- `COMP-IF-01`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-02 — Service Consumer Role

**endPoint1**

- `ENT-ROLE-01`

**endPoint2**

- `COMP-IF-01`;
- `COMP-OP-01`.

Correspondence semantics:

- `ENT-ROLE-01` participates as the external invoker of the offered
  Computational interface and operation.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-03 — Framed Interaction Service Role

**endPoint1**

- `ENT-ROLE-02`

**endPoint2**

- `COMP-OBJ-01`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-04 — Enterprise Process

**endPoint1**

- `ENT-PROC-01`

**endPoint2**

- `COMP-OP-01`.

Correspondence semantics:

- one occurrence of `ENT-PROC-01` is realized by one invocation of
  `COMP-OP-01` and its internal responsibility sequence.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-05 — Bounded Framed Interaction

**endPoint1**

- `ENT-INTER-01`

**endPoint2**

- `COMP-IF-01`;
- `COMP-OP-01`.

Applicability:

- this correspondence applies to every occurrence of the COM1 bounded framed
  interaction.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-06 — Submit Interaction Action

**endPoint1**

- `ENT-ACT-01`

**endPoint2**

- `COMP-IF-01`;
- `COMP-OP-01`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-07 — Admission Action

**endPoint1**

- `ENT-ACT-02`

**endPoint2**

- `COMP-OBJ-02`;
- `COMP-RULE-02`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-08 — Completion Action

**endPoint1**

- `ENT-ACT-03`

**endPoint2**

- `COMP-OBJ-03`;
- `COMP-RULE-03`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-09 — Response Action

**endPoint1**

- `ENT-ACT-04`

**endPoint2**

- `COMP-OBJ-04`;
- `COMP-RULE-04`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-10 — Failure Isolation Action

**endPoint1**

- `ENT-ACT-05`

**endPoint2**

- `COMP-OBJ-05`;
- `COMP-RULE-05`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-11 — Bounded Admission Policy

**endPoint1**

- `ENT-POL-01`;
- `ENT-ROLE-02`

**endPoint2**

- `COMP-OBJ-02`;
- `COMP-RULE-02`.

Correspondence semantics:

- `ENT-ROLE-02` is the Enterprise role whose behaviour choices are constrained
  by `ENT-POL-01`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-12 — Complete Reception Policy

**endPoint1**

- `ENT-POL-02`;
- `ENT-ROLE-02`

**endPoint2**

- `COMP-OBJ-03`;
- `COMP-RULE-03`.

Correspondence semantics:

- `ENT-ROLE-02` is the Enterprise role whose behaviour choices are constrained
  by `ENT-POL-02`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-13 — Response Eligibility Policy

**endPoint1**

- `ENT-POL-03`;
- `ENT-ROLE-02`

**endPoint2**

- `COMP-OBJ-04`;
- `COMP-RULE-04`.

Correspondence semantics:

- `ENT-ROLE-02` is the Enterprise role whose behaviour choices are constrained
  by `ENT-POL-03`.

Applicable rule:

- `CR-COM1-EC-01`.

### CL-COM1-EC-14 — Failure Isolation Policy

**endPoint1**

- `ENT-POL-04`;
- `ENT-ROLE-02`

**endPoint2**

- `COMP-OBJ-05`;
- `COMP-RULE-05`.

Correspondence semantics:

- `ENT-ROLE-02` is the Enterprise role whose behaviour choices are constrained
  by `ENT-POL-04`.

Applicable rule:

- `CR-COM1-EC-01`.

## Applicability Statements

`ENT-ROLE-03` is an operational/Delivery role and does not define an
additional COM1 Computational operation.

No separate Computational binding object is specified for the interaction
between `ENT-ROLE-01` and `ENT-ROLE-02`.

No independently identified Computational stream is specified for
`ENT-INTER-01`.

These statements do not create correspondence links with synthetic endpoints.

---

# CS-COM1-EENG — Enterprise–Engineering Correspondence Specification

## Corresponding Specifications

- COM1 Enterprise Viewpoint Specification;
- COM1 Engineering Viewpoint Specification.

## CR-COM1-EENG-01 — Enterprise Engineering Support Rule

The Engineering specification shall identify the Engineering support explicitly
specified for applicable Enterprise interactions without introducing
Engineering structures solely to manufacture a correspondence.

## Correspondence Links

### CL-COM1-EENG-01 — Bounded Framed Interaction Engineering Support

**endPoint1**

- `ENT-INTER-01`

**endPoint2**

- `ENG-IF-01`;
- `ENG-BIND-01`;
- `ENG-CH-01`;
- `ENG-BND-01`;
- `ENG-CAP-01`.

Correspondence semantics:

- `ENG-IF-01`, `ENG-BIND-01` and `ENG-CH-01` provide the identified
  Engineering interaction support;
- that support is provided within `ENG-BND-01` and `ENG-CAP-01`;
- `ENG-CAP-01` contains `ENG-CLUSTER-01` and its Basic Engineering Objects.

Applicability:

- this correspondence applies to every COM1 bounded framed interaction.

Applicable rule:

- `CR-COM1-EENG-01`.

## Applicability Statements

COM1 does not prescribe an Engineering node or nucleus for this support.

COM1 does not independently specify a distinct Engineering stub, binder,
protocol object or interceptor for `ENT-INTER-01`.

Those concepts are not inferred merely from `ENG-BIND-01` or `ENG-CH-01`.

These statements do not create correspondence links with synthetic endpoints.

---

# CS-COM1-IC — Information–Computational Correspondence Specification

## Corresponding Specifications

- COM1 Information Viewpoint Specification;
- COM1 Computational Viewpoint Specification.

## CR-COM1-IC-01 — Information Computational Realization Rule

Each correspondence link below preserves the explicit relationship established
between one Information element and its Computational realization.

## Correspondence Links

### CL-COM1-IC-01 — Candidate Framed Interaction

**endPoint1**

- `INF-OBJ-01`

**endPoint2**

- `COMP-IF-01`;
- `COMP-OP-01`;
- `CandidateFramedInteraction`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-02 — Declared Message Extent

**endPoint1**

- `INF-OBJ-02`

**endPoint2**

- `COMP-OBJ-02`;
- `COMP-RULE-02`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-03 — Message Payload

**endPoint1**

- `INF-OBJ-03`

**endPoint2**

- `COMP-OP-01`;
- `COMP-OBJ-03`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-04 — Admission Outcome

**endPoint1**

- `INF-OBJ-04`

**endPoint2**

- `COMP-OBJ-02`;
- `COMP-RULE-02`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-05 — Complete Admitted Message

**endPoint1**

- `INF-OBJ-05`

**endPoint2**

- `COMP-OBJ-03`;
- `COMP-RULE-03`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-06 — Interaction Response

**endPoint1**

- `INF-OBJ-06`

**endPoint2**

- `COMP-IF-01`;
- `COMP-OP-01`;
- `InteractionResponse`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-07 — Interaction Failure Outcome

**endPoint1**

- `INF-OBJ-07`

**endPoint2**

- `COMP-IF-01`;
- `COMP-OP-01`;
- `InteractionFailureOutcome`;
- `COMP-OBJ-05`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-08 — Initial Interaction Context

**endPoint1**

- `INF-INIT-01`

**endPoint2**

- `COMP-OP-01`.

Correspondence semantics:

- `INF-INIT-01` is the initial interaction context assumed by `COMP-OP-01`
  before processing one submitted interaction.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-09 — Submission Dynamic Schema

**endPoint1**

- `INF-DYN-01`

**endPoint2**

- `COMP-OP-01`.

Correspondence semantics:

- `INF-DYN-01` corresponds to the invocation and submission phase of
  `COMP-OP-01`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-10 — Admission Dynamic Schema

**endPoint1**

- `INF-DYN-02`

**endPoint2**

- `COMP-OBJ-02`;
- `COMP-RULE-02`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-11 — Completion Dynamic Schema

**endPoint1**

- `INF-DYN-03`

**endPoint2**

- `COMP-OBJ-03`;
- `COMP-RULE-03`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-12 — Complete Reception Dynamic Schema

**endPoint1**

- `INF-DYN-04`

**endPoint2**

- `COMP-OBJ-03`;
- `COMP-RULE-03`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-13 — Response Dynamic Schema

**endPoint1**

- `INF-DYN-05`

**endPoint2**

- `COMP-OBJ-04`;
- `COMP-RULE-04`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-14 — Failure Dynamic Schema

**endPoint1**

- `INF-DYN-06`

**endPoint2**

- `COMP-OBJ-05`;
- `COMP-RULE-05`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-15 — Information Invariant 01

**endPoint1**

- `INF-INV-01`

**endPoint2**

- `COMP-RULE-02`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-16 — Information Invariant 02

**endPoint1**

- `INF-INV-02`

**endPoint2**

- `COMP-RULE-02`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-17 — Information Invariant 03

**endPoint1**

- `INF-INV-03`

**endPoint2**

- `COMP-RULE-03`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-18 — Information Invariant 04

**endPoint1**

- `INF-INV-04`

**endPoint2**

- `COMP-RULE-03`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-19 — Information Invariant 05

**endPoint1**

- `INF-INV-05`

**endPoint2**

- `COMP-RULE-03`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-20 — Information Invariant 06

**endPoint1**

- `INF-INV-06`

**endPoint2**

- `COMP-RULE-02`;
- `COMP-RULE-06`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-21 — Information Invariant 07

**endPoint1**

- `INF-INV-07`

**endPoint2**

- `COMP-RULE-04`.

Applicable rule:

- `CR-COM1-IC-01`.

### CL-COM1-IC-22 — Information Invariant 08

**endPoint1**

- `INF-INV-08`

**endPoint2**

- `COMP-RULE-05`.

Applicable rule:

- `CR-COM1-IC-01`.

---

# CS-COM1-CENG — Computational–Engineering Correspondence Specification

## Corresponding Specifications

- COM1 Computational Viewpoint Specification;
- COM1 Engineering Viewpoint Specification.

## CR-COM1-CENG-01 — Computational Engineering Realization Rule

The Engineering specification shall preserve the explicit Computational object,
interface, operation and rule correspondences without manufacturing
Computational binding objects or additional Engineering terms.

## Correspondence Links

### CL-COM1-CENG-01 — Framed Interaction Service Object

**endPoint1**

- `COMP-OBJ-01`

**endPoint2**

- `ENG-BEO-01`;
- `ENG-BND-01`;
- `ENG-CLUSTER-01`;
- `ENG-CAP-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-02 — Admission Responsibility

**endPoint1**

- `COMP-OBJ-02`

**endPoint2**

- `ENG-BEO-02`;
- `ENG-CLUSTER-01`;
- `ENG-IF-02`;
- `ENG-BIND-02`;
- `ENG-CAP-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-03 — Completion Responsibility

**endPoint1**

- `COMP-OBJ-03`

**endPoint2**

- `ENG-BEO-03`;
- `ENG-CLUSTER-01`;
- `ENG-IF-03`;
- `ENG-BIND-03`;
- `ENG-CAP-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-04 — Response Responsibility

**endPoint1**

- `COMP-OBJ-04`

**endPoint2**

- `ENG-BEO-04`;
- `ENG-CLUSTER-01`;
- `ENG-IF-04`;
- `ENG-BIND-04`;
- `ENG-CAP-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-05 — Failure-Isolation Responsibility

**endPoint1**

- `COMP-OBJ-05`

**endPoint2**

- `ENG-BEO-05`;
- `ENG-CLUSTER-01`;
- `ENG-IF-05`;
- `ENG-BIND-05`;
- `ENG-CAP-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-06 — Bounded Framed Interaction Interface

**endPoint1**

- `COMP-IF-01`

**endPoint2**

- `ENG-IF-01`;
- `ENG-BND-01`;
- `ENG-BIND-01`;
- `ENG-CH-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-07 — Submit Interaction Operation

**endPoint1**

- `COMP-OP-01`

**endPoint2**

- `ENG-IF-01`;
- `ENG-BIND-01`;
- `ENG-BEO-01`.

Correspondence semantics:

- one execution of `COMP-OP-01` is supported by the Engineering interaction
  chain beginning at `ENG-IF-01` / `ENG-BIND-01`;
- the chain passes through the applicable internal Engineering interfaces and
  bindings and terminates in successful-response propagation or explicit
  interaction-failure propagation;
- `ENG-CH-01` supports the service-boundary portion of that chain;
- `ENG-CH-02` supports its internal Engineering interactions within
  `ENG-CLUSTER-01`, contained in `ENG-CAP-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-08 — Information Contract Preservation Rule

**endPoint1**

- `COMP-RULE-01`

**endPoint2**

- `ENG-INV-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-09 — Bounded Admission Preservation Rule

**endPoint1**

- `COMP-RULE-02`

**endPoint2**

- `ENG-INV-02`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-10 — Complete Reception Preservation Rule

**endPoint1**

- `COMP-RULE-03`

**endPoint2**

- `ENG-INV-03`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-11 — Response Eligibility Preservation Rule

**endPoint1**

- `COMP-RULE-04`

**endPoint2**

- `ENG-INV-04`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-12 — Failure Isolation Rule

**endPoint1**

- `COMP-RULE-05`

**endPoint2**

- `ENG-INV-05`.

Applicable rule:

- `CR-COM1-CENG-01`.

### CL-COM1-CENG-13 — Explicit Outcome Rule

**endPoint1**

- `COMP-RULE-06`

**endPoint2**

- `ENG-INV-01`;
- `ENG-IF-01`.

Applicable rule:

- `CR-COM1-CENG-01`.

## Applicability Statements

COM1 does not introduce a separately identified Computational binding object.
No correspondence to a synthetic Computational binding endpoint is therefore
asserted.

`COMP-RULE-07` requires Engineering–Technology separation. Its current
Engineering correspondence is descriptive rather than an independently
identified Engineering endpoint, so no synthetic correspondence link is
introduced for it.

---

# CS-COM1-ENGT — Engineering–Technology Correspondence Specification

## Corresponding Specifications

- COM1 Engineering Viewpoint Specification;
- COM1 Technology Viewpoint Specification.

## CR-COM1-ENGT-01 — Engineering Technology Realization Rule

Each correspondence link below preserves an explicit Engineering-to-Technology
realization whose Technology endpoint is identified in the Technology
Viewpoint Specification.

## Correspondence Links

### CL-COM1-ENGT-01 — Engineering Boundary

**endPoint1**

- `ENG-BND-01`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-01`;
- `TECH-MECH-07`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-02 — Interaction Processing Capsule

**endPoint1**

- `ENG-CAP-01`

**endPoint2**

- `TECH-COMP-02`;
- `TECH-COMP-03`;
- `TECH-COMP-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-03 — Interaction Processing Cluster

**endPoint1**

- `ENG-CLUSTER-01`

**endPoint2**

- `TECH-COMP-02`;
- `TECH-COMP-03`;
- `TECH-COMP-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-04 — Interaction Processing BEO

**endPoint1**

- `ENG-BEO-01`

**endPoint2**

- `TECH-COMP-02`;
- `TECH-COMP-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-05 — Admission BEO

**endPoint1**

- `ENG-BEO-02`

**endPoint2**

- `TECH-COMP-02`;
- `TECH-COMP-03`;
- `TECH-MECH-03`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-06 — Completion BEO

**endPoint1**

- `ENG-BEO-03`

**endPoint2**

- `TECH-COMP-03`;
- `TECH-MECH-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-07 — Response BEO

**endPoint1**

- `ENG-BEO-04`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-05`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-08 — Failure Isolation BEO

**endPoint1**

- `ENG-BEO-05`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-06`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-09 — Service Engineering Interface

**endPoint1**

- `ENG-IF-01`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-01`;
- `TECH-MECH-02`;
- `TECH-MECH-05`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-10 — Admission Engineering Interface

**endPoint1**

- `ENG-IF-02`

**endPoint2**

- `TECH-COMP-02`;
- `TECH-COMP-03`;
- `TECH-MECH-03`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-11 — Completion Engineering Interface

**endPoint1**

- `ENG-IF-03`

**endPoint2**

- `TECH-COMP-03`;
- `TECH-MECH-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-12 — Response Engineering Interface

**endPoint1**

- `ENG-IF-04`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-05`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-13 — Failure Isolation Engineering Interface

**endPoint1**

- `ENG-IF-05`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-06`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-14 — Service Engineering Binding

**endPoint1**

- `ENG-BIND-01`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-01`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-15 — Admission Engineering Binding

**endPoint1**

- `ENG-BIND-02`

**endPoint2**

- `TECH-COMP-02`;
- `TECH-COMP-03`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-16 — Completion Engineering Binding

**endPoint1**

- `ENG-BIND-03`

**endPoint2**

- `TECH-COMP-03`;
- `TECH-MECH-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-17 — Response Engineering Binding

**endPoint1**

- `ENG-BIND-04`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-05`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-18 — Failure Isolation Engineering Binding

**endPoint1**

- `ENG-BIND-05`

**endPoint2**

- `TECH-COMP-04`;
- `TECH-MECH-06`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-19 — Service Interaction Channel

**endPoint1**

- `ENG-CH-01`

**endPoint2**

- `TECH-MECH-01`;
- `TECH-MECH-02`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-20 — Engineering Invariant 01

**endPoint1**

- `ENG-INV-01`

**endPoint2**

- `TECH-INV-01`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-21 — Engineering Invariant 02

**endPoint1**

- `ENG-INV-02`

**endPoint2**

- `TECH-INV-02`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-22 — Engineering Invariant 03

**endPoint1**

- `ENG-INV-03`

**endPoint2**

- `TECH-INV-03`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-23 — Engineering Invariant 04

**endPoint1**

- `ENG-INV-04`

**endPoint2**

- `TECH-INV-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-24 — Engineering Invariant 05

**endPoint1**

- `ENG-INV-05`

**endPoint2**

- `TECH-INV-05`.

Applicable rule:

- `CR-COM1-ENGT-01`.

### CL-COM1-ENGT-25 — Engineering Invariant 06

**endPoint1**

- `ENG-INV-06`

**endPoint2**

- `TECH-MECH-04`.

Applicable rule:

- `CR-COM1-ENGT-01`.

## Applicability Statements

`ENG-CH-02` is realized by in-process .NET interaction among the reference
runtime components.

The current Technology Viewpoint Specification does not identify that
interaction as an independent `TECH-*` term. Therefore this explicit
correspondence statement is preserved without manufacturing a synthetic
Technology endpoint or `CorrespondenceLink`.

---

## Correspondence Set Closure

COM1 explicitly represents the following six pairwise RM-ODP correspondence
specifications:

- `CS-COM1-EI` — Enterprise–Information;
- `CS-COM1-EC` — Enterprise–Computational;
- `CS-COM1-EENG` — Enterprise–Engineering;
- `CS-COM1-IC` — Information–Computational;
- `CS-COM1-CENG` — Computational–Engineering;
- `CS-COM1-ENGT` — Engineering–Technology.

These correspondence specifications are pairwise.

They do not establish a transitive correspondence relation across the five
viewpoints.

F8TF Service Guarantee preservation remains a distinct assurance relation and
is not represented by synthetic RM-ODP correspondence endpoints.
