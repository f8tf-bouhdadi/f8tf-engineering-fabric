# COM2-ES — Engineering Service Specification

## Service Identity

- Service ID: `COM2-ES`
- Engineering Asset: `COM2_Envelope_JSON`
- Lifecycle Product: `Product 1 — Assured Integration-Ready Engineering Service Specification`

## Enterprise Objective

COM2-ES provides controlled admission of structured interaction envelopes.

It enables an Interaction Submitter to submit an identifiable interaction unit
and obtain an explicit outcome indicating whether that interaction unit has
been admitted.

## Service Contract

COM2-ES commits to provide controlled interaction admission within the
declared Service Contract scope.

The Service Contract requires satisfaction of the following authoritative
Service Guarantees:

- `G-COM2-01`
- `G-COM2-02`
- `G-COM2-03`
- `G-COM2-04`

## Service Guarantees

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

## Service Boundary

COM2-ES is responsible for:

- controlled interaction-envelope admission;
- explicit admission outcome;
- interaction identity preservation;
- preservation of optional interaction information semantics.

Other distributed-system concerns belong to separate Engineering Services and
may be composed with COM2-ES when required.

## Contractual Interaction

### Input

An interaction submission presented to COM2-ES for admission.

An admissible interaction submission is accepted as an interaction envelope.

### Outcome

An explicit acceptance or rejection outcome.

### Acceptance Obligations

For an accepted interaction:

1. the interaction submission satisfied the service admission conditions;
2. acceptance is explicitly reported;
3. the submitted interaction identity is preserved in the acceptance outcome.

### Optional Information Obligation

The absence of optional interaction information MUST NOT by itself prevent
admission.

### Rejection Obligation

An interaction submission that does not satisfy the service admission
conditions MUST NOT be accepted.

## Specification Structure

The authoritative Service Contract and Service Guarantees are preserved
through five RM-ODP viewpoint specifications:

1. Enterprise Specification
2. Information Specification
3. Computational Specification
4. Engineering Specification
5. Technology Specification

Applicable inter-viewpoint correspondences are represented separately from
F8TF Service Guarantee preservation.
