# RM-ODP — Information Viewpoint (COM2-ES)

## 1. Purpose

The COM2 Information Viewpoint defines the information structures,
information-state transitions and invariants required to preserve the
COM2 Enterprise Service Contract and Service Guarantees.

The authoritative Enterprise use case is:

- `UC-COM2-01 — Submit Interaction for Admission`

The applicable Service Guarantees are:

- `G-COM2-01 — Controlled Interaction Admission`
- `G-COM2-02 — Explicit Admission Outcome`
- `G-COM2-03 — Interaction Identity Preservation`
- `G-COM2-04 — Optional Interaction Information`

## 2. Static Schema

### INF-OBJ-01 — InteractionSubmission

Represents information presented to COM2 for admission evaluation.

An `InteractionSubmission` may or may not establish an `Envelope`.

The submitted information may represent an interaction identity.

When an `InteractionSubmission` establishes an `Envelope`, the identity
represented by the submitted interaction information shall be preserved as
the `Envelope.Id`.

### INF-COR-COM2-01 — Submission–Envelope Identity Correspondence

For an `InteractionSubmission` `s` that establishes an `Envelope` `e`:

`e.Id = submittedInteractionIdentity(s)`

This correspondence does not require the Technology representation of
`InteractionSubmission` to expose identity as a separate field. It specifies
the information-level identity relation that shall be preserved when the
submitted information is interpreted as an `Envelope`.

### INF-OBJ-02 — Envelope

Represents an interaction submission that has been interpreted as an
interaction envelope for admission evaluation.

Information elements:

- `Id`
- `Kind`
- `Payload`
- `Meta` — optional

### INF-OBJ-03 — AdmissionOutcome

Represents the explicit outcome produced by the evaluation of an
`InteractionSubmission`.

Every evaluated `InteractionSubmission` produces exactly one
`AdmissionOutcome`.

### INF-OBJ-04 — AcceptanceOutcome

Represents successful admission.

Information elements:

- `Accepted`
- `Id`
- `ReceivedAt`

### INF-OBJ-05 — InvalidRequest

Represents explicit rejection.

Information elements:

- `Error`
- `Message`

`AcceptanceOutcome` and `InvalidRequest` are mutually exclusive forms of
`AdmissionOutcome`.

## 3. Dynamic Schema

### INF-DYN-COM2-01 — Submit Interaction for Admission

Corresponds to:

- `UC-COM2-01 — Submit Interaction for Admission`

#### Precondition

An `InteractionSubmission` exists and is presented to COM2 for admission
evaluation.

#### Action

Evaluate the `InteractionSubmission` for admission.

#### Postcondition — Submission Does Not Establish an Envelope

If the submitted information cannot establish an `Envelope`:

1. no `Envelope` is admitted;
2. an `InvalidRequest` outcome exists.

#### Postcondition — Envelope Is Not Admissible

If an `Envelope` is established but the admission conditions do not hold:

1. the `Envelope` is not admitted;
2. an `InvalidRequest` outcome exists.

#### Postcondition — Accepted

If an `Envelope` is established and the admission conditions hold:

1. the `Envelope` is admitted;
2. an `AcceptanceOutcome` exists;
3. `AcceptanceOutcome.Accepted = true`;
4. `AcceptanceOutcome.Id = Envelope.Id`.

## 4. Information Invariants

### INF-INV-01 — Admitted Identity Presence

An admitted `Envelope` shall have a present and non-empty `Id`.

### INF-INV-02 — Admitted Kind Presence

An admitted `Envelope` shall have a present and non-empty `Kind`.

### INF-INV-03 — Admitted Payload Presence

An admitted `Envelope` shall have a present and non-null `Payload`.

### INF-INV-04 — Accepted Identity Preservation

For every accepted `Envelope`:

`AcceptanceOutcome.Id = Envelope.Id`

### INF-INV-05 — Optional Meta Information

`Meta` is optional.

The absence of `Meta` alone shall not prevent admission.

### INF-INV-06 — Explicit Evaluation Outcome

Every evaluated `InteractionSubmission` shall produce exactly one
`AdmissionOutcome`.

### INF-INV-07 — Exclusive Outcome

An `AdmissionOutcome` shall be exactly one of:

- `AcceptanceOutcome`;
- `InvalidRequest`.

## 5. Enterprise–Information Correspondence Source Mapping

| Enterprise element | Information realization |
|---|---|
| `UC-COM2-01` | `INF-DYN-COM2-01` |
| `POL-COM2-01` | `INF-INV-01`, `INF-INV-02`, `INF-INV-03` and rejection branches of `INF-DYN-COM2-01` |
| `POL-COM2-02` | `INF-INV-06`, `INF-INV-07` and all outcome branches of `INF-DYN-COM2-01` |
| `POL-COM2-03` | `INF-COR-COM2-01` and `INF-INV-04` |
| `POL-COM2-04` | `INF-INV-05` |
## 6. Service Guarantee Preservation

| Service Guarantee | Information preservation basis |
|---|---|
| `G-COM2-01` | controlled rejection plus `INF-INV-01`, `INF-INV-02`, `INF-INV-03` |
| `G-COM2-02` | `INF-INV-06`, `INF-INV-07` |
| `G-COM2-03` | `INF-COR-COM2-01` and `INF-INV-04` |
| `G-COM2-04` | `INF-INV-05` |

These relationships belong to F8TF Service Guarantee preservation and are
not RM-ODP CorrespondenceLink endpoints.

## 7. Authority

The COM2 Enterprise Service Contract and Service Guarantees remain
authoritative.

The Information Viewpoint shall preserve those obligations while defining
the information structures, state transitions and invariants required by
subsequent COM2 viewpoint specifications.
