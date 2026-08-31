# COM2-ES — RM-ODP Correspondence Specifications

## Status

This document defines the explicit RM-ODP inter-viewpoint correspondence
specifications for:

**COM2-ES — Controlled Interaction Admission Engineering Service**

The correspondence semantics are aligned with ITU-T X.911 and the
correspondence representation model follows ITU-T X.906 | ISO/IEC 19793.

The authoritative semantics of each viewpoint remain defined by the
corresponding COM2 textual RM-ODP viewpoint specification.

This document does not redefine those viewpoint specifications.

---

## Correspondence Model

Each COM2 correspondence specification relates exactly two RM-ODP
viewpoint specifications.

A correspondence specification contains:

- two corresponding viewpoint specifications;
- one applicable CorrespondenceRule;
- CorrespondenceLinks between explicitly identified terms;
- applicability or absence statements where no explicit link is justified.

Each CorrespondenceLink has two endpoints.

Each endpoint references one or more terms belonging to the corresponding
viewpoint specification.

Absence or non-applicability is not represented by a synthetic endpoint.

The six correspondence specifications are pairwise and non-transitive.

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

Service Guarantees and Specification Proof Obligations are therefore not
introduced as synthetic RM-ODP CorrespondenceLink endpoints.

Technology-to-code and viewpoint-to-runtime relationships are realization
or qualification relationships and are outside this inter-viewpoint
correspondence set.

---

# CS-COM2-EI — Enterprise–Information Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM2 Enterprise Viewpoint Specification
  (`enterprise.md`);
- endpoint viewpoint 2: COM2 Information Viewpoint Specification
  (`information.md`).

## CR-COM2-EI-01 — Enterprise Information Preservation Rule

Enterprise use-case and policy semantics represented in the Information Viewpoint shall preserve the Enterprise meaning without redefining Service Guarantees as RM-ODP correspondence endpoints.

## Correspondence Links

### CL-COM2-EI-01 — Submit Interaction for Admission

**endPoint1**

- `UC-COM2-01`

**endPoint2**

- `INF-DYN-COM2-01`

Applicable rule:

- `CR-COM2-EI-01`.

### CL-COM2-EI-02 — Controlled Admission Policy

**endPoint1**

- `POL-COM2-01`

**endPoint2**

- `INF-INV-01`
- `INF-INV-02`
- `INF-INV-03`
- `INF-DYN-COM2-01`

Correspondence semantics:

- The dynamic-schema correspondence applies to the rejection branches of `INF-DYN-COM2-01`.

Applicable rule:

- `CR-COM2-EI-01`.

### CL-COM2-EI-03 — Explicit Admission Outcome Policy

**endPoint1**

- `POL-COM2-02`

**endPoint2**

- `INF-INV-06`
- `INF-INV-07`
- `INF-DYN-COM2-01`

Correspondence semantics:

- The dynamic-schema correspondence applies to all outcome branches of `INF-DYN-COM2-01`.

Applicable rule:

- `CR-COM2-EI-01`.

### CL-COM2-EI-04 — Interaction Identity Preservation Policy

**endPoint1**

- `POL-COM2-03`

**endPoint2**

- `INF-COR-COM2-01`
- `INF-INV-04`

Applicable rule:

- `CR-COM2-EI-01`.

### CL-COM2-EI-05 — Optional Interaction Information Policy

**endPoint1**

- `POL-COM2-04`

**endPoint2**

- `INF-INV-05`

Applicable rule:

- `CR-COM2-EI-01`.

## Applicability Statements

- `G-COM2-01..04` are Service Guarantees. Their preservation through the viewpoint specifications belongs to F8TF specification assurance and does not create RM-ODP CorrespondenceLink endpoints.
- The Enterprise roles `Interaction Submitter` and `COM2 Service` are not independently identified by canonical Enterprise term identifiers in the current specification. No synthetic Information endpoint is manufactured for them.

---

# CS-COM2-EC — Enterprise–Computational Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM2 Enterprise Viewpoint Specification
  (`enterprise.md`);
- endpoint viewpoint 2: COM2 Computational Viewpoint Specification
  (`computational.md`).

## CR-COM2-EC-01 — Enterprise Computational Realization Rule

The Computational Viewpoint shall provide the computational behaviour explicitly identified as realizing the applicable Enterprise interaction without manufacturing additional Enterprise or Computational concepts.

## Correspondence Links

### CL-COM2-EC-01 — Submit Interaction Operation

**endPoint1**

- `UC-COM2-01`

**endPoint2**

- `COMP-OP-COM2-01`

Correspondence semantics:

- `COMP-OP-COM2-01 — submit` explicitly realizes `UC-COM2-01 — Submit Interaction for Admission`.

Applicable rule:

- `CR-COM2-EC-01`.

## Applicability Statements

- Validation, acceptance and rejection are processing branches of `COMP-OP-COM2-01`; they are not independent Computational operations.
- COM2 does not identify a separate Computational binding object or Computational stream for this interaction. No synthetic endpoint is introduced.

---

# CS-COM2-EENG — Enterprise–Engineering Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM2 Enterprise Viewpoint Specification
  (`enterprise.md`);
- endpoint viewpoint 2: COM2 Engineering Viewpoint Specification
  (`engineering.md`).

## CR-COM2-EENG-01 — Enterprise Engineering Support Rule

The Engineering specification shall identify only Engineering support explicitly specified for the applicable Enterprise interaction and shall not manufacture Engineering structures solely to create a correspondence.

## Correspondence Links

### CL-COM2-EENG-01 — Interaction Admission Engineering Support

**endPoint1**

- `UC-COM2-01`

**endPoint2**

- `ENG-CH-COM2-01`

Correspondence semantics:

- `ENG-CH-COM2-01` provides the Engineering means by which the Interaction Submitter performs the COM2 admission interaction and receives its explicit outcome.

Applicable rule:

- `CR-COM2-EENG-01`.

## Applicability Statements

- COM2 does not currently prescribe an Engineering node, nucleus, capsule or cluster for this Enterprise interaction.
- COM2 does not independently identify a stub, binder, protocol object or interceptor for this Enterprise interaction. Such terms are not inferred from the Engineering channel.

---

# CS-COM2-IC — Information–Computational Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM2 Information Viewpoint Specification
  (`information.md`);
- endpoint viewpoint 2: COM2 Computational Viewpoint Specification
  (`computational.md`).

## CR-COM2-IC-01 — Information Computational Realization Rule

Each correspondence link shall preserve an explicit relationship between an Information term and the Computational operation or internal activity that realizes its processing responsibility.

## Correspondence Links

### CL-COM2-IC-01 — Submit Interaction Dynamic Schema

**endPoint1**

- `INF-DYN-COM2-01`

**endPoint2**

- `COMP-OP-COM2-01`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-02 — Interaction Submission

**endPoint1**

- `INF-OBJ-01`

**endPoint2**

- `COMP-OP-COM2-01`
- `COMP-ACT-COM2-01`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-03 — Envelope

**endPoint1**

- `INF-OBJ-02`

**endPoint2**

- `COMP-ACT-COM2-01`
- `COMP-ACT-COM2-02`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-04 — Admission Outcome

**endPoint1**

- `INF-OBJ-03`

**endPoint2**

- `COMP-OP-COM2-01`
- `COMP-ACT-COM2-03`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-05 — Acceptance Outcome

**endPoint1**

- `INF-OBJ-04`

**endPoint2**

- `COMP-OP-COM2-01`
- `COMP-ACT-COM2-03`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-06 — Invalid Request

**endPoint1**

- `INF-OBJ-05`

**endPoint2**

- `COMP-OP-COM2-01`
- `COMP-ACT-COM2-03`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-07 — Submission Envelope Identity Correspondence

**endPoint1**

- `INF-COR-COM2-01`

**endPoint2**

- `COMP-ACT-COM2-01`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-08 — Admitted Identity Presence

**endPoint1**

- `INF-INV-01`

**endPoint2**

- `COMP-ACT-COM2-02`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-09 — Admitted Kind Presence

**endPoint1**

- `INF-INV-02`

**endPoint2**

- `COMP-ACT-COM2-02`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-10 — Admitted Payload Presence

**endPoint1**

- `INF-INV-03`

**endPoint2**

- `COMP-ACT-COM2-02`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-11 — Accepted Identity Preservation

**endPoint1**

- `INF-INV-04`

**endPoint2**

- `COMP-ACT-COM2-03`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-12 — Optional Meta Information

**endPoint1**

- `INF-INV-05`

**endPoint2**

- `COMP-ACT-COM2-01`
- `COMP-ACT-COM2-02`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-13 — Explicit Evaluation Outcome

**endPoint1**

- `INF-INV-06`

**endPoint2**

- `COMP-ACT-COM2-03`

Applicable rule:

- `CR-COM2-IC-01`.

### CL-COM2-IC-14 — Exclusive Outcome

**endPoint1**

- `INF-INV-07`

**endPoint2**

- `COMP-ACT-COM2-03`

Applicable rule:

- `CR-COM2-IC-01`.

## Applicability Statements

- `COMP-ACT-COM2-01..03` are internal Computational activities and do not introduce additional offered Computational operations.

---

# CS-COM2-CENG — Computational–Engineering Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM2 Computational Viewpoint Specification
  (`computational.md`);
- endpoint viewpoint 2: COM2 Engineering Viewpoint Specification
  (`engineering.md`).

## CR-COM2-CENG-01 — Computational Engineering Realization Rule

The Engineering specification shall preserve the explicit Computational object, interface, operation and activity relationships without manufacturing a Computational binding object or an Engineering binding solely for correspondence.

## Correspondence Links

### CL-COM2-CENG-01 — COM2 Admission Processor

**endPoint1**

- `COMP-OBJ-COM2-01`

**endPoint2**

- `ENG-BEO-COM2-01`

Applicable rule:

- `CR-COM2-CENG-01`.

### CL-COM2-CENG-02 — Interaction Admission Interface

**endPoint1**

- `COMP-IF-COM2-01`

**endPoint2**

- `ENG-IF-COM2-01`

Applicable rule:

- `CR-COM2-CENG-01`.

### CL-COM2-CENG-03 — Submit Operation Engineering Support

**endPoint1**

- `COMP-OP-COM2-01`

**endPoint2**

- `ENG-IF-COM2-01`
- `ENG-CH-COM2-01`

Applicable rule:

- `CR-COM2-CENG-01`.

### CL-COM2-CENG-04 — Interpret Submission Activity

**endPoint1**

- `COMP-ACT-COM2-01`

**endPoint2**

- `ENG-MECH-COM2-01`
- `ENG-MECH-COM2-02`

Applicable rule:

- `CR-COM2-CENG-01`.

### CL-COM2-CENG-05 — Evaluate Admission Activity

**endPoint1**

- `COMP-ACT-COM2-02`

**endPoint2**

- `ENG-CON-COM2-01`

Applicable rule:

- `CR-COM2-CENG-01`.

### CL-COM2-CENG-06 — Produce Outcome Activity

**endPoint1**

- `COMP-ACT-COM2-03`

**endPoint2**

- `ENG-MECH-COM2-03`

Applicable rule:

- `CR-COM2-CENG-01`.

## Applicability Statements

- COM2 does not define a separate Computational binding object.
- No `ENG-BIND-COM2-*`, Engineering cluster or Engineering capsule is introduced solely to manufacture a correspondence.

---

# CS-COM2-ENGT — Engineering–Technology Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM2 Engineering Viewpoint Specification
  (`engineering.md`);
- endpoint viewpoint 2: COM2 Technology Viewpoint Specification
  (`technology.md`).

## CR-COM2-ENGT-01 — Engineering Technology Realization Rule

Each correspondence link shall preserve an explicit Engineering-to-Technology realization whose Technology endpoint is independently identified in the Technology Viewpoint Specification.

## Correspondence Links

### CL-COM2-ENGT-01 — Interaction Admission Channel

**endPoint1**

- `ENG-CH-COM2-01`

**endPoint2**

- `TECH-BIND-COM2-01`

Applicable rule:

- `CR-COM2-ENGT-01`.

### CL-COM2-ENGT-02 — Submission Transfer

**endPoint1**

- `ENG-MECH-COM2-01`

**endPoint2**

- `TECH-END-COM2-01`

Applicable rule:

- `CR-COM2-ENGT-01`.

### CL-COM2-ENGT-03 — Submission Representation

**endPoint1**

- `ENG-MECH-COM2-02`

**endPoint2**

- `TECH-REP-COM2-01`
- `TECH-CODEC-COM2-01`

Applicable rule:

- `CR-COM2-ENGT-01`.

### CL-COM2-ENGT-04 — Outcome Transfer

**endPoint1**

- `ENG-MECH-COM2-03`

**endPoint2**

- `TECH-OUT-COM2-01`

Applicable rule:

- `CR-COM2-ENGT-01`.

### CL-COM2-ENGT-05 — Admission Evaluation Constraint

**endPoint1**

- `ENG-CON-COM2-01`

**endPoint2**

- `TECH-CON-COM2-01`

Applicable rule:

- `CR-COM2-ENGT-01`.

### CL-COM2-ENGT-06 — Explicit Outcome Constraint

**endPoint1**

- `ENG-CON-COM2-02`

**endPoint2**

- `TECH-CON-COM2-02`

Applicable rule:

- `CR-COM2-ENGT-01`.

### CL-COM2-ENGT-07 — Identity Preservation Constraint

**endPoint1**

- `ENG-CON-COM2-03`

**endPoint2**

- `TECH-CON-COM2-03`

Applicable rule:

- `CR-COM2-ENGT-01`.

### CL-COM2-ENGT-08 — Optional Meta Constraint

**endPoint1**

- `ENG-CON-COM2-04`

**endPoint2**

- `TECH-CON-COM2-04`

Applicable rule:

- `CR-COM2-ENGT-01`.

## Applicability Statements

- `ENG-BEO-COM2-01` and `ENG-IF-COM2-01` do not currently have independently identified `TECH-*` endpoints. No synthetic Technology endpoint or CorrespondenceLink is introduced.
- The existing `G-COM2-*` to Technology relationships express F8TF Service Guarantee preservation, not RM-ODP CorrespondenceLink endpoints.

---

## Correspondence Set Closure

COM2 explicitly represents the following six pairwise RM-ODP
correspondence specifications:

- `CS-COM2-EI` — Enterprise–Information;
- `CS-COM2-EC` — Enterprise–Computational;
- `CS-COM2-EENG` — Enterprise–Engineering;
- `CS-COM2-IC` — Information–Computational;
- `CS-COM2-CENG` — Computational–Engineering;
- `CS-COM2-ENGT` — Engineering–Technology.

These correspondence specifications are pairwise.

They do not establish a transitive correspondence relation across the
five viewpoints.

F8TF Service Guarantee preservation remains a distinct assurance relation
and is not represented by synthetic RM-ODP correspondence endpoints.
