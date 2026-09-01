# COM3-ES — RM-ODP Correspondence Specifications

## Status

This document defines the explicit RM-ODP inter-viewpoint correspondence
specifications for:

**COM3-ES — Assured Operation Interaction Engineering Service**

The Enterprise semantics are aligned with ITU-T X.911.

The correspondence representation model follows ITU-T X.906 |
ISO/IEC 19793.

The authoritative semantics of each viewpoint remain defined by the
corresponding COM3 textual RM-ODP viewpoint specification.

This document does not redefine those viewpoint specifications.

---

## Correspondence Model

Each COM3 correspondence specification relates exactly two RM-ODP
viewpoint specifications.

A correspondence specification contains:

- two corresponding viewpoint specifications;
- one applicable CorrespondenceRule;
- CorrespondenceLinks between explicitly identified terms;
- applicability or absence statements where no explicit link is justified.

Each CorrespondenceLink has two endpoints.

Each endpoint references one or more terms explicitly identified in the
corresponding viewpoint specification.

Absence or non-applicability shall not be represented by a synthetic endpoint.

The correspondence specifications are pairwise and non-transitive.

---

## Separation from F8TF Specification Assurance

RM-ODP correspondence and F8TF Service Guarantee preservation are distinct
Product 1 relationships.

RM-ODP correspondence relates explicitly identified terms belonging to
different viewpoint specifications.

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

# CS-COM3-EI — Enterprise–Information Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM3 Enterprise Viewpoint Specification
  (`odp/enterprise/01_scope.md`);
- endpoint viewpoint 2: COM3 Information Viewpoint Specification
  (`odp/information/information.md`).

## CR-COM3-EI-01 — Enterprise Information Preservation Rule

Information terms representing declared Operation semantics shall preserve
the corresponding Enterprise meaning without redefining Service Guarantees
as RM-ODP correspondence endpoints.

## Correspondence Links

### CL-COM3-EI-01 — Declared Operation

**endPoint1**

- `ENT-OBJ-COM3-01`

**endPoint2**

- `INF-OBJ-COM3-01`

Applicable rule:

- `CR-COM3-EI-01`.

### CL-COM3-EI-02 — Operation Invocation

**endPoint1**

- `ENT-OBJ-COM3-02`

**endPoint2**

- `INF-OBJ-COM3-04`

Applicable rule:

- `CR-COM3-EI-01`.

### CL-COM3-EI-03 — Operation Termination

**endPoint1**

- `ENT-OBJ-COM3-03`

**endPoint2**

- `INF-OBJ-COM3-05`

Applicable rule:

- `CR-COM3-EI-01`.

### CL-COM3-EI-04 — Operation Form Preservation

**endPoint1**

- `ENT-OBL-COM3-02`

**endPoint2**

- `INF-INV-COM3-03`
- `INF-INV-COM3-04`

Applicable rule:

- `CR-COM3-EI-01`.

### CL-COM3-EI-05 — Invocation Conformance

**endPoint1**

- `ENT-OBL-COM3-03`

**endPoint2**

- `INF-INV-COM3-02`

Applicable rule:

- `CR-COM3-EI-01`.

### CL-COM3-EI-06 — Announcement Semantics

**endPoint1**

- `ENT-OBL-COM3-04`

**endPoint2**

- `INF-INV-COM3-03`

Applicable rule:

- `CR-COM3-EI-01`.

### CL-COM3-EI-07 — Interrogation Termination

**endPoint1**

- `ENT-OBL-COM3-05`

**endPoint2**

- `INF-INV-COM3-04`
- `INF-INV-COM3-05`
- `INF-INV-COM3-06`
- `INF-INV-COM3-08`

Applicable rule:

- `CR-COM3-EI-01`.

### CL-COM3-EI-08 — Invocation–Termination Association

**endPoint1**

- `ENT-OBL-COM3-06`

**endPoint2**

- `INF-INV-COM3-07`

Applicable rule:

- `CR-COM3-EI-01`.

## Applicability Statements

- Service Guarantees `G-COM3-01..07` belong to F8TF specification assurance
  and are not RM-ODP CorrespondenceLink endpoints.
- Enterprise roles are not mapped to synthetic Information role objects.

---

# CS-COM3-EC — Enterprise–Computational Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM3 Enterprise Viewpoint Specification
  (`odp/enterprise/01_scope.md`);
- endpoint viewpoint 2: COM3 Computational Viewpoint Specification
  (`odp/computational/interfaces.md`).

## CR-COM3-EC-01 — Enterprise Computational Realization Rule

The Computational Viewpoint shall provide explicitly identified
computational behaviour supporting the applicable Enterprise Operation
interaction without manufacturing additional Enterprise or Computational terms.

## Correspondence Links

### CL-COM3-EC-01 — Declared Operation Interaction

**endPoint1**

- `ENT-OBJ-COM3-01`
- `ENT-OBJ-COM3-02`

**endPoint2**

- `COMP-IF-COM3-01`
- `COMP-OBJ-COM3-01`
- `COMP-OBL-COM3-01`

Applicable rule:

- `CR-COM3-EC-01`.

### CL-COM3-EC-02 — Invocation Conformance

**endPoint1**

- `ENT-OBL-COM3-03`

**endPoint2**

- `COMP-OBL-COM3-02`

Applicable rule:

- `CR-COM3-EC-01`.

### CL-COM3-EC-03 — Operation Form Preservation

**endPoint1**

- `ENT-OBL-COM3-02`

**endPoint2**

- `COMP-OBL-COM3-03`

Applicable rule:

- `CR-COM3-EC-01`.

### CL-COM3-EC-04 — Announcement Semantics

**endPoint1**

- `ENT-OBL-COM3-04`

**endPoint2**

- `COMP-OBL-COM3-04`

Applicable rule:

- `CR-COM3-EC-01`.

### CL-COM3-EC-05 — Interrogation Termination

**endPoint1**

- `ENT-OBL-COM3-05`

**endPoint2**

- `COMP-OBL-COM3-05`
- `COMP-OBL-COM3-06`
- `COMP-OBL-COM3-08`

Applicable rule:

- `CR-COM3-EC-01`.

### CL-COM3-EC-06 — Invocation–Termination Association

**endPoint1**

- `ENT-OBL-COM3-06`

**endPoint2**

- `COMP-OBL-COM3-07`

Applicable rule:

- `CR-COM3-EC-01`.

## Applicability Statements

- Announcement and Interrogation outcome sections are behaviour descriptions,
  not independently identified `COMP-OP-*` terms.
- No synthetic Computational operation identifier is introduced.

---

# CS-COM3-EENG — Enterprise–Engineering Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM3 Enterprise Viewpoint Specification
  (`odp/enterprise/01_scope.md`);
- endpoint viewpoint 2: COM3 Engineering Viewpoint Specification
  (`odp/engineering/mechanisms.md`).

## CR-COM3-EENG-01 — Enterprise Engineering Support Rule

The Engineering Viewpoint shall identify only Engineering mechanisms
explicitly specified as supporting the applicable Enterprise Operation
interaction.

Engineering structures shall not be manufactured solely to create a
correspondence.

## Correspondence Links

### CL-COM3-EENG-01 — Declared Operation Support

**endPoint1**

- `ENT-OBJ-COM3-01`

**endPoint2**

- `ENG-COMP-COM3-01`

Applicable rule:

- `CR-COM3-EENG-01`.

### CL-COM3-EENG-02 — Invocation Conformance Support

**endPoint1**

- `ENT-OBL-COM3-03`

**endPoint2**

- `ENG-COMP-COM3-02`

Applicable rule:

- `CR-COM3-EENG-01`.

### CL-COM3-EENG-03 — Operation Form Support

**endPoint1**

- `ENT-OBL-COM3-02`

**endPoint2**

- `ENG-COMP-COM3-03`

Applicable rule:

- `CR-COM3-EENG-01`.

### CL-COM3-EENG-04 — Announcement Completion Support

**endPoint1**

- `ENT-OBL-COM3-04`

**endPoint2**

- `ENG-COMP-COM3-04`

Applicable rule:

- `CR-COM3-EENG-01`.

### CL-COM3-EENG-05 — Interrogation Termination Support

**endPoint1**

- `ENT-OBL-COM3-05`

**endPoint2**

- `ENG-COMP-COM3-05`
- `ENG-COMP-COM3-06`
- `ENG-COMP-COM3-08`

Applicable rule:

- `CR-COM3-EENG-01`.

### CL-COM3-EENG-06 — Invocation–Termination Association Support

**endPoint1**

- `ENT-OBL-COM3-06`

**endPoint2**

- `ENG-COMP-COM3-05`
- `ENG-COMP-COM3-07`

Applicable rule:

- `CR-COM3-EENG-01`.

## Applicability Statements

- COM3 currently defines no independently identified Engineering channel,
  Engineering interface, capsule or cluster.
- No such Engineering term is introduced solely to manufacture a correspondence.

---

# CS-COM3-IC — Information–Computational Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM3 Information Viewpoint Specification
  (`odp/information/information.md`);
- endpoint viewpoint 2: COM3 Computational Viewpoint Specification
  (`odp/computational/interfaces.md`).

## CR-COM3-IC-01 — Information Computational Realization Rule

Each CorrespondenceLink shall preserve an explicit relationship between an
Information term and the Computational responsibility that realizes its
processing semantics.

## Correspondence Links

### CL-COM3-IC-01 — Declared Operation Reference

**endPoint1**

- `INF-OBJ-COM3-01`
- `INF-INV-COM3-01`

**endPoint2**

- `COMP-OBL-COM3-01`

Applicable rule:

- `CR-COM3-IC-01`.

### CL-COM3-IC-02 — Invocation Signature Conformance

**endPoint1**

- `INF-OBJ-COM3-02`
- `INF-OBJ-COM3-04`
- `INF-INV-COM3-02`

**endPoint2**

- `COMP-OBL-COM3-02`

Applicable rule:

- `CR-COM3-IC-01`.

### CL-COM3-IC-03 — Announcement Semantics

**endPoint1**

- `INF-INV-COM3-03`

**endPoint2**

- `COMP-OBL-COM3-03`
- `COMP-OBL-COM3-04`

Applicable rule:

- `CR-COM3-IC-01`.

### CL-COM3-IC-04 — Interrogation Termination Set

**endPoint1**

- `INF-INV-COM3-04`
- `INF-INV-COM3-05`

**endPoint2**

- `COMP-OBL-COM3-05`

Applicable rule:

- `CR-COM3-IC-01`.

### CL-COM3-IC-05 — Termination Signature Conformance

**endPoint1**

- `INF-INV-COM3-06`

**endPoint2**

- `COMP-OBL-COM3-06`

Applicable rule:

- `CR-COM3-IC-01`.

### CL-COM3-IC-06 — Invocation–Termination Association

**endPoint1**

- `INF-OBJ-COM3-05`
- `INF-INV-COM3-07`

**endPoint2**

- `COMP-OBL-COM3-07`

Applicable rule:

- `CR-COM3-IC-01`.

### CL-COM3-IC-07 — Single Contractual Termination

**endPoint1**

- `INF-INV-COM3-08`

**endPoint2**

- `COMP-OBL-COM3-08`

Applicable rule:

- `CR-COM3-IC-01`.

---

# CS-COM3-CENG — Computational–Engineering Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM3 Computational Viewpoint Specification
  (`odp/computational/interfaces.md`);
- endpoint viewpoint 2: COM3 Engineering Viewpoint Specification
  (`odp/engineering/mechanisms.md`).

## CR-COM3-CENG-01 — Computational Engineering Realization Rule

The Engineering Viewpoint shall preserve explicitly identified Computational
responsibilities through explicitly identified Engineering mechanisms.

No Engineering structure shall be introduced solely to manufacture a
correspondence.

## Correspondence Links

### CL-COM3-CENG-01 — Declared Operation Resolution

**endPoint1**

- `COMP-OBL-COM3-01`

**endPoint2**

- `ENG-COMP-COM3-01`

Applicable rule:

- `CR-COM3-CENG-01`.

### CL-COM3-CENG-02 — Invocation Conformance

**endPoint1**

- `COMP-OBL-COM3-02`

**endPoint2**

- `ENG-COMP-COM3-02`

Applicable rule:

- `CR-COM3-CENG-01`.

### CL-COM3-CENG-03 — Operation Form Preservation

**endPoint1**

- `COMP-OBL-COM3-03`

**endPoint2**

- `ENG-COMP-COM3-03`

Applicable rule:

- `CR-COM3-CENG-01`.

### CL-COM3-CENG-04 — Announcement Termination Independence

**endPoint1**

- `COMP-OBL-COM3-04`

**endPoint2**

- `ENG-COMP-COM3-04`

Applicable rule:

- `CR-COM3-CENG-01`.

### CL-COM3-CENG-05 — Declared Interrogation Termination

**endPoint1**

- `COMP-OBL-COM3-05`

**endPoint2**

- `ENG-COMP-COM3-05`
- `ENG-COMP-COM3-06`

Applicable rule:

- `CR-COM3-CENG-01`.

### CL-COM3-CENG-06 — Termination Conformance

**endPoint1**

- `COMP-OBL-COM3-06`

**endPoint2**

- `ENG-COMP-COM3-06`

Applicable rule:

- `CR-COM3-CENG-01`.

### CL-COM3-CENG-07 — Invocation–Termination Association

**endPoint1**

- `COMP-OBL-COM3-07`

**endPoint2**

- `ENG-COMP-COM3-05`
- `ENG-COMP-COM3-07`

Applicable rule:

- `CR-COM3-CENG-01`.

### CL-COM3-CENG-08 — Single Contractual Termination

**endPoint1**

- `COMP-OBL-COM3-08`

**endPoint2**

- `ENG-COMP-COM3-08`

Applicable rule:

- `CR-COM3-CENG-01`.

---

# CS-COM3-ENGT — Engineering–Technology Correspondence Specification

## Corresponding Specifications

- endpoint viewpoint 1: COM3 Engineering Viewpoint Specification
  (`odp/engineering/mechanisms.md`);
- endpoint viewpoint 2: COM3 Technology Viewpoint Specification
  (`odp/technology/technology.md`).

## CR-COM3-ENGT-01 — Engineering Technology Realization Rule

Each CorrespondenceLink shall preserve an explicit Engineering-to-Technology
realization whose Technology endpoint is independently identified in the
Technology Viewpoint Specification.

## Correspondence Links

### CL-COM3-ENGT-01 — Operation Declaration Binding

**endPoint1**

- `ENG-COMP-COM3-01`

**endPoint2**

- `TECH-BIND-COM3-01`

Applicable rule:

- `CR-COM3-ENGT-01`.

### CL-COM3-ENGT-02 — Invocation Conformance Guard

**endPoint1**

- `ENG-COMP-COM3-02`

**endPoint2**

- `TECH-GUARD-COM3-01`

Applicable rule:

- `CR-COM3-ENGT-01`.

### CL-COM3-ENGT-03 — Operation Form Guard

**endPoint1**

- `ENG-COMP-COM3-03`

**endPoint2**

- `TECH-GUARD-COM3-02`

Applicable rule:

- `CR-COM3-ENGT-01`.

### CL-COM3-ENGT-04 — Announcement Completion Boundary

**endPoint1**

- `ENG-COMP-COM3-04`

**endPoint2**

- `TECH-BOUND-COM3-01`

Applicable rule:

- `CR-COM3-ENGT-01`.

### CL-COM3-ENGT-05 — Interrogation State Binding

**endPoint1**

- `ENG-COMP-COM3-05`

**endPoint2**

- `TECH-STATE-COM3-01`

Applicable rule:

- `CR-COM3-ENGT-01`.

### CL-COM3-ENGT-06 — Termination Conformance Guard

**endPoint1**

- `ENG-COMP-COM3-06`

**endPoint2**

- `TECH-GUARD-COM3-03`

Applicable rule:

- `CR-COM3-ENGT-01`.

### CL-COM3-ENGT-07 — Invocation–Termination Binding

**endPoint1**

- `ENG-COMP-COM3-07`

**endPoint2**

- `TECH-COR-COM3-01`

Applicable rule:

- `CR-COM3-ENGT-01`.

### CL-COM3-ENGT-08 — Single Termination Guard

**endPoint1**

- `ENG-COMP-COM3-08`

**endPoint2**

- `TECH-GUARD-COM3-04`

Applicable rule:

- `CR-COM3-ENGT-01`.

## Applicability Statements

- Technology architecture components may participate in realization but are
  not added as redundant correspondence endpoints where an explicitly
  identified Technology realization term already exists.
- `TECH-CON-COM3-*` terms belong to F8TF guarantee-preservation assurance
  unless an independent RM-ODP correspondence requirement justifies their use.

---

## Correspondence Set Closure

COM3 explicitly represents the following six pairwise RM-ODP
correspondence specifications:

- `CS-COM3-EI` — Enterprise–Information;
- `CS-COM3-EC` — Enterprise–Computational;
- `CS-COM3-EENG` — Enterprise–Engineering;
- `CS-COM3-IC` — Information–Computational;
- `CS-COM3-CENG` — Computational–Engineering;
- `CS-COM3-ENGT` — Engineering–Technology.

These correspondence specifications are pairwise.

They do not establish a transitive correspondence relation across the
five viewpoints.

F8TF Service Guarantee preservation remains a distinct assurance relation
and is not represented by synthetic RM-ODP correspondence endpoints.
