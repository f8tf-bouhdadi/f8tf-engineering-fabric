# RM-ODP — Engineering Viewpoint (COM2-ES)

## 1. Purpose

The COM2 Engineering Viewpoint defines the abstract interaction mechanisms
required to realize the COM2 Computational Viewpoint.

The authoritative computational operation is:

- `COMP-OP-COM2-01 — submit`

The internal computational activities are:

- `COMP-ACT-COM2-01 — Interpret Submission`
- `COMP-ACT-COM2-02 — Evaluate Admission`
- `COMP-ACT-COM2-03 — Produce Outcome`

## 2. Basic Engineering Object

### ENG-BEO-COM2-01 — COM2 Admission Processing Basic Engineering Object

The COM2 Admission Processing Basic Engineering Object provides the
Engineering object corresponding to:

- `COMP-OBJ-COM2-01 — COM2 Admission Processor`.

Responsibilities:

- provide the Engineering support for the COM2 Admission Processor;
- support the offered interaction through `ENG-IF-COM2-01`;
- participate in the interaction supported by `ENG-CH-COM2-01`;
- preserve the Computational contract without introducing additional
  Computational behaviour.

## 3. Engineering Interface

### ENG-IF-COM2-01 — Interaction Admission Engineering Interface

The Interaction Admission Engineering Interface provides the Engineering
interface corresponding to:

- `COMP-IF-COM2-01 — Interaction Admission Interface`.

It is offered by `ENG-BEO-COM2-01`.

It supports:

- `COMP-OP-COM2-01 — submit`;
- transfer of the interaction submission toward the COM2 admission
  processing object;
- propagation of exactly one explicit `AdmissionOutcome`.

The interface introduces no additional COM2 operation.

## 4. Engineering Channel

### ENG-CH-COM2-01 — Interaction Admission Channel

The Interaction Admission Channel provides the engineering means by which
an Interaction Submitter interacts with the COM2 Admission Processor.

The channel supports:

1. transfer of an interaction submission toward COM2;
2. representation of the transferred submission in a form that can be
   interpreted by COM2;
3. transfer of an explicit admission outcome back to the submitter.

The channel is abstract and technology-independent.

## 5. Engineering Mechanisms

### ENG-MECH-COM2-01 — Submission Transfer

Responsibility:

- carry an interaction submission from the submitter toward the COM2
  processing boundary.

Supports:

- `COMP-OP-COM2-01`
- `COMP-ACT-COM2-01`

### ENG-MECH-COM2-02 — Submission Representation

Responsibility:

- preserve the information needed to establish an `Envelope`;
- preserve the submitted interaction identity so that, when an `Envelope`
  is established, its `Envelope.Id` corresponds to that submitted identity;
- preserve support for optional `Meta`;
- make the transferred submission interpretable by COM2.

Supports:

- `COMP-ACT-COM2-01`
- `INF-COR-COM2-01`
- `INF-INV-05`

### ENG-MECH-COM2-03 — Outcome Transfer

Responsibility:

- carry exactly one explicit admission outcome back to the submitter;
- support both successful and rejected outcomes;
- preserve the accepted interaction identity in the successful outcome.

Supports:

- `COMP-ACT-COM2-03`
- `INF-INV-04`
- `INF-INV-06`
- `INF-INV-07`

## 6. Engineering Constraints

### ENG-CON-COM2-01 — Admission Evaluation Preservation

The engineering realization shall not bypass the admission evaluation
required by `COMP-ACT-COM2-02`.

### ENG-CON-COM2-02 — Explicit Outcome Preservation

The engineering realization shall preserve the explicit outcome semantics
defined by `AdmissionOutcome`.

### ENG-CON-COM2-03 — Identity Preservation

The engineering realization shall preserve the submitted interaction
identity through successful admission.

### ENG-CON-COM2-04 — Optional Meta Preservation

The engineering realization shall not require `Meta` when the computational
contract defines it as optional.

## 7. Computational to Engineering Mapping

| Computational element | Engineering realization |
|---|---|
| `COMP-OBJ-COM2-01` | `ENG-BEO-COM2-01` |
| `COMP-IF-COM2-01` | `ENG-IF-COM2-01` |
| `COMP-OP-COM2-01` | `ENG-IF-COM2-01` + `ENG-CH-COM2-01` |
| `COMP-ACT-COM2-01` | `ENG-MECH-COM2-01` + `ENG-MECH-COM2-02` |
| `INF-COR-COM2-01` | `ENG-MECH-COM2-02` |
| `COMP-ACT-COM2-02` | preserved by `ENG-CON-COM2-01` |
| `COMP-ACT-COM2-03` | `ENG-MECH-COM2-03` |
| `INF-INV-04` | `ENG-CON-COM2-03` |
| `INF-INV-05` | `ENG-CON-COM2-04` |
| `INF-INV-06` | `ENG-CON-COM2-02` |
| `INF-INV-07` | `ENG-CON-COM2-02` |

## 8. Scope

The Engineering Viewpoint does not prescribe:

- HTTP;
- JSON;
- ASP.NET;
- concrete endpoint names;
- concrete serialization libraries;
- source-code structure.

Those choices belong to the Technology Viewpoint.

## 9. Authority

The Enterprise, Information and Computational viewpoints remain
authoritative.

The Engineering Viewpoint shall preserve their obligations while defining
the abstract mechanisms required for realization.
