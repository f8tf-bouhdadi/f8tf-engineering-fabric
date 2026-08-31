# RM-ODP — Computational Viewpoint (COM2-ES)

## 1. Purpose

The COM2 Computational Viewpoint defines the processing objects,
interfaces and operations required to realize the COM2 Information
Viewpoint.

The authoritative Information dynamic schema is:

- `INF-DYN-COM2-01 — Submit Interaction for Admission`

## 2. Computational Object

### COMP-OBJ-COM2-01 — COM2 Admission Processor

The COM2 Admission Processor evaluates interaction submissions for
controlled admission.

## 3. Offered Interface

### COMP-IF-COM2-01 — Interaction Admission Interface

The COM2 Admission Processor offers the Interaction Admission Interface.

## 4. Offered Operation

### COMP-OP-COM2-01 — submit

Signature:

`submit(InteractionSubmission) -> AdmissionOutcome`

The operation realizes:

- `UC-COM2-01 — Submit Interaction for Admission`
- `INF-DYN-COM2-01 — Submit Interaction for Admission`

### Input

- `InteractionSubmission`

### Output

Exactly one `AdmissionOutcome`:

- `AcceptanceOutcome`, or
- `InvalidRequest`.

### Processing Contract

The operation shall:

1. evaluate the submitted interaction information;
2. establish an `Envelope` when the submitted information supports it;
3. apply the admission conditions;
4. produce an explicit `AdmissionOutcome`;
5. preserve the submitted interaction identity when admission succeeds.

## 5. Internal Processing Decomposition

`COMP-OP-COM2-01 — submit` is the single offered service operation.

Its realization is decomposed into the following internal computational
activities.

### COMP-ACT-COM2-01 — Interpret Submission

Input:

- `InteractionSubmission`

Responsibility:

- interpret the submitted interaction information;
- establish an `Envelope` when the submitted information supports it;
- preserve the submitted interaction identity as `Envelope.Id` when an
  `Envelope` is established, as required by `INF-COR-COM2-01`;
- preserve support for optional `Meta` information.

Outcome:

- `Envelope`, or
- interpretation failure.

This activity is internal and is not independently offered through the
Interaction Admission Interface.

### COMP-ACT-COM2-02 — Evaluate Admission

Input:

- an established `Envelope`

Responsibility:

- evaluate the admission conditions associated with `Id`, `Kind` and
  `Payload`;
- ensure that absence of optional `Meta` alone does not prevent admission.

Outcome:

- admissible, or
- inadmissible.

This activity is internal and is not independently offered through the
Interaction Admission Interface.

### COMP-ACT-COM2-03 — Produce Outcome

Input:

- the interpretation and admission evaluation result

Responsibility:

- produce exactly one `AdmissionOutcome`;
- produce `InvalidRequest` for rejection;
- produce `AcceptanceOutcome` for successful admission;
- preserve the submitted interaction identity in a successful outcome.

Outcome:

- `AcceptanceOutcome`, or
- `InvalidRequest`.

This activity is internal and is not independently offered through the
Interaction Admission Interface.

## 6. Preserved Information Constraints

The operation and its internal processing activities shall preserve:

- `INF-COR-COM2-01`
- `INF-INV-01`
- `INF-INV-02`
- `INF-INV-03`
- `INF-INV-04`
- `INF-INV-05`
- `INF-INV-06`
- `INF-INV-07`

## 7. Scope

COM2 exposes one computational processing operation for the service use case:

- `COMP-OP-COM2-01 — submit`

Validation, acceptance and rejection are processing branches of this operation.

They are not exposed as independent computational operations.

## 8. Authority

The Enterprise Service Contract and Information Viewpoint remain authoritative.

The Computational Viewpoint shall preserve their guarantees, information
constraints and dynamic-schema obligations.
