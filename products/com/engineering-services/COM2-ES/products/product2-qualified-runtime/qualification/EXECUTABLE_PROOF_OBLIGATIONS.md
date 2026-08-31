# COM2-ES Product 2 — Executable Proof Obligations

## Purpose

These executable Proof Obligations qualify the COM2 runtime against the
authoritative COM2-ES Service Guarantees.

They do not introduce new service semantics.

They evaluate whether the executable realization preserves the properties
established by Product 1.

## PO-COM2-RT-ADM — Runtime Controlled Admission

### Service Guarantee

`G-COM2-01 — Controlled Interaction Admission`

### Executable Obligation

Within the declared qualification scope:

- valid interaction submissions are accepted; and
- submissions missing required `Id`, `Kind` or `Payload` information are
  rejected by the candidate runtime.

### Qualification Result

`Satisfied`

## PO-COM2-RT-OUT — Runtime Explicit Outcome

### Service Guarantee

`G-COM2-02 — Explicit Admission Outcome`

### Executable Obligation

Every executed runtime qualification scenario shall produce exactly one
recognized contractual HTTP admission outcome.

### Qualification Result

`Satisfied`

## PO-COM2-RT-ID — Runtime Identity Preservation

### Service Guarantee

`G-COM2-03 — Interaction Identity Preservation`

### Executable Obligation

Every accepted runtime outcome shall preserve the submitted interaction
identity.

### Qualification Result

`Satisfied`

## PO-COM2-RT-META — Runtime Optional Interaction Information

### Service Guarantee

`G-COM2-04 — Optional Interaction Information`

### Executable Obligation

Absence of optional `Meta` information alone shall not prevent admission by the
candidate runtime.

### Qualification Result

`Satisfied`

## Guarantee Qualification Binding

| Executable Proof Obligation | Service Guarantee | Result |
|---|---|---|
| `PO-COM2-RT-ADM` | `G-COM2-01` | `Satisfied` |
| `PO-COM2-RT-OUT` | `G-COM2-02` | `Satisfied` |
| `PO-COM2-RT-ID` | `G-COM2-03` | `Satisfied` |
| `PO-COM2-RT-META` | `G-COM2-04` | `Satisfied` |

## Qualification Boundary

The obligations evaluate the executable realization at the declared runtime
boundary.

Executable qualification does not establish delivery qualification.

Delivery concerns belong to COM2-ES Product 3.
