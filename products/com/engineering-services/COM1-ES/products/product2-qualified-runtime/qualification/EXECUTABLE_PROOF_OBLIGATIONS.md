# COM1 Executable Proof Obligations

## Purpose

This document defines the executable Proof Obligations used to qualify
COM1-ES against its authoritative Service Guarantees under
F8TF Executable Qualification Process V3.

The obligations do not introduce new COM1 service semantics.

They make explicit the executable qualification predicates already derived
from the COM1 Service Contract and RM-ODP viewpoint specifications.

---

## PO-COM1-01 — Bounded Frame Admission

### Service Guarantee

`G-COM1-BOUNDED — Bounded Frame Acceptance`

### Normative Basis

The obligation is derived from the COM1 bounded-admission specification,
including:

- `ENT-ACT-02 — Admit Framed Interaction`
- `ENT-POL-01 — Bounded Admission`
- `INF-INV-01 — Non-Negative Declared Extent`
- `INF-INV-02 — Supported Bound Preservation`
- `INF-DYN-02 — Evaluate Admission`
- `COMP-RULE-02 — Bounded Admission Preservation`
- `ENG-INV-02 — Bounded Admission Preservation`
- `TECH-MECH-02 — Length-Prefix Framing`
- `TECH-MECH-03 — V1 Payload Bound`
- `TECH-INV-02 — Bounded Admission Preservation`

### Executable Obligation

Within the declared qualification scope:

- a frame having an invalid negative declared length shall be rejected; and
- a frame whose declared length exceeds the supported V1 bound shall be rejected.

Conceptually:

`InvalidLengthRejected ∧ OversizedLengthRejected`

### Qualification Evaluation

This obligation is evaluated by the executable qualification mechanism against the applicable Qualification Observations.

---

## PO-COM1-02 — Complete Frame Reception

### Service Guarantee

`G-COM1-COMPLETE — Complete Frame Reception`

### Normative Basis

The obligation is derived from the COM1 complete-reception specification,
including:

- `ENT-ACT-03 — Complete Framed Interaction`
- `ENT-POL-02 — Complete Reception`
- `INF-INV-03 — Received Extent Bound`
- `INF-INV-04 — Complete Message Correspondence`
- `INF-INV-05 — Incomplete Input Non-Completion`
- `INF-DYN-03 — Accumulate Message Payload`
- `INF-DYN-04 — Establish Complete Admitted Message`
- `COMP-RULE-03 — Complete Reception Preservation`
- `ENG-INV-03 — Complete Reception Preservation`
- `ENG-INV-06 — Information Ordering Preservation`
- `TECH-MECH-04 — Exact Message Reconstruction`
- `TECH-INV-03 — Complete Reconstruction Preservation`

### Executable Obligation

Within the declared qualification scope:

- a complete admissible frame shall be reconstructed as a complete payload; and
- a prematurely truncated frame shall not be accepted as complete.

Conceptually:

`CompletePayloadReconstructed ∧ TruncatedFrameRejected`

### Qualification Evaluation

This obligation is evaluated by the executable qualification mechanism against the applicable Qualification Observations.

---

## PO-COM1-03 — Response Eligibility

### Service Guarantee

`G-COM1-RESPONSE — Response After Complete Admissible Input`

### Normative Basis

The obligation is derived from the COM1 response-eligibility specification,
including:

- `ENT-ACT-04 — Produce Interaction Response`
- `ENT-POL-03 — Response Eligibility`
- `INF-INV-07 — Response Eligibility`
- `INF-DYN-05 — Produce Interaction Response`
- `COMP-RULE-04 — Response Eligibility Preservation`
- `ENG-INV-04 — Response Eligibility Preservation`
- `TECH-MECH-05 — Framed Response Emission`
- `TECH-INV-04 — Response Eligibility Preservation`

### Executable Obligation

Within the declared qualification scope, successful response production shall
require prior successful reception of a complete admissible input frame.

Conceptually:

`ResponseRequiresCompleteAcceptedInput`

### Qualification Evaluation

This obligation is evaluated by the executable qualification mechanism against the applicable Qualification Observations.

---

## PO-COM1-04 — Client Failure Isolation

### Service Guarantee

`G-COM1-ISOLATION — Client Interaction Failure Isolation`

### Normative Basis

The obligation is derived from the COM1 interaction-failure-isolation
specification, including:

- `ENT-ACT-05 — Isolate Failed Interaction`
- `ENT-POL-04 — Interaction Failure Isolation`
- `INF-INV-08 — Failed Interaction Isolation`
- `INF-DYN-06 — Fail Interaction`
- `COMP-RULE-05 — Interaction Failure Isolation`
- `ENG-INV-05 — Failure Isolation Preservation`
- `TECH-MECH-06 — Per-Client Failure Isolation`
- `TECH-INV-05 — Interaction Failure Isolation Preservation`

### Executable Obligation

Within the declared qualification scope, failure of one client interaction
shall not prevent the service from successfully processing a subsequent valid
interaction.

Conceptually:

`ClientFailureIsolated`

### Qualification Evaluation

This obligation is evaluated by the executable qualification mechanism against the applicable Qualification Observations.

---

## Qualification Result Semantics

Each executable Proof Obligation shall produce an explicit Proof Obligation
Result with one of the EQP V3 qualification statuses:

- `Satisfied`
- `Unsatisfied`
- `NotEvaluated`

The Proof Obligation Result shall preserve the evidence references associated
with the Qualification Observations used for its evaluation.

The corresponding Service Guarantee result shall be derived from the same
evaluated predicate and shall not introduce a second or different qualification
predicate.

---

## Traceability Summary

| Executable Proof Obligation | Service Guarantee |
|---|---|
| `PO-COM1-01` | `G-COM1-BOUNDED` |
| `PO-COM1-02` | `G-COM1-COMPLETE` |
| `PO-COM1-03` | `G-COM1-RESPONSE` |
| `PO-COM1-04` | `G-COM1-ISOLATION` |

The intended qualification chain is:

Service Guarantee
→ normative RM-ODP obligations
→ Qualification Scenario
→ Qualification Observations
→ Executable Proof Obligation
→ Proof Obligation Result
→ Guarantee Qualification Result
→ evidence reference
