# RM-ODP — Enterprise Viewpoint (COM2-ES)

## 1. Enterprise Objective

COM2 provides controlled admission of structured interaction envelopes.

It enables an Interaction Submitter to submit an identifiable interaction
unit and obtain an explicit outcome indicating whether that interaction
unit has been admitted.

## 2. Enterprise Roles

### Interaction Submitter

Submits an interaction submission for admission.

### COM2 Service

Evaluates the interaction submission and returns an explicit
admission outcome.

### UC-COM2-01 — Submit Interaction for Admission

The Interaction Submitter submits an identifiable interaction to the
COM2 Service for controlled admission and obtains an explicit admission
outcome.

The use case is governed by G-COM2-01, G-COM2-02, G-COM2-03 and
G-COM2-04.

## 3. Enterprise Policies

### POL-COM2-01 — Controlled Admission

An interaction submission MUST satisfy the service admission conditions
before it can be accepted as an interaction envelope.

An interaction submission that does not satisfy the service admission
conditions MUST NOT be accepted.

### POL-COM2-02 — Explicit Admission Outcome

The service MUST return an explicit admission outcome for an evaluated
interaction submission.

### POL-COM2-03 — Interaction Identity Preservation

When an interaction submission is accepted as an interaction envelope,
the acceptance outcome MUST preserve the identity of the submitted
interaction.

### POL-COM2-04 — Optional Interaction Information

An interaction submission MAY carry additional optional information.

The absence of optional information MUST NOT by itself prevent admission.

## 4. Service Guarantees

### G-COM2-01 — Controlled Interaction Admission

The service guarantees that an interaction submission that does not satisfy
the service admission conditions is not accepted.

### G-COM2-02 — Explicit Admission Outcome

The service guarantees an explicit admission outcome for an evaluated
interaction submission.

### G-COM2-03 — Interaction Identity Preservation

For every accepted interaction envelope, the service guarantees that the
interaction identity returned in the acceptance outcome is equal to the
identity of the interaction submission from which the envelope was admitted.

### G-COM2-04 — Optional Interaction Information

The service guarantees that the absence of optional interaction information
does not by itself prevent admission.

## 5. Service Boundary

COM2 is responsible for:

- controlled interaction-envelope admission;
- explicit admission outcome;
- interaction identity preservation;
- preservation of optional interaction information semantics.

Other distributed-system concerns are provided by separate Engineering
Services and may be composed with COM2 when required.

## 6. Enterprise Service Contract

### Input

An interaction submission presented to COM2 for admission.

An admissible interaction submission is accepted as an interaction envelope.

### Outcome

An explicit acceptance or rejection outcome.

### Acceptance Obligations

For an accepted interaction:

1. the interaction submission satisfied the service admission conditions;
2. acceptance is explicitly reported;
3. the submitted interaction identity is preserved in the acceptance
   outcome.

### Optional Information Obligation

The absence of optional interaction information MUST NOT by itself prevent
admission.

### Rejection Obligation

An interaction submission that does not satisfy the service admission
conditions MUST NOT be accepted.

## 7. Authority

The Enterprise Service Contract and Service Guarantees defined by this
specification are authoritative for the subsequent COM2 viewpoint
specifications and realization.

Subsequent specifications shall preserve these guarantees while progressively
realizing them through the COM2 viewpoint specifications and executable
realization.
