# COM3-ES Product 2 — Executable Proof Obligations

## Purpose

These Executable Proof Obligations establish the executable qualification
criteria for:

**COM3-ES — Assured Operation Interaction Engineering Service**

They derive from the authoritative Product 1 Service Guarantees and are
evaluated against the executable realization at its qualified runtime boundary.

They do not introduce new Service Guarantees.

## Qualification Rule

Each obligation follows:

Service Guarantee
→ executable realization responsibility
→ executable scenario
→ expected observable result
→ qualification disposition

## Q-COM3-G01 — Declared Operation Preservation

Derived from:

`G-COM3-01 — Declared Operation Preservation`

The executable realization shall preserve the identity of the originating
declared Operation.

Qualification shall establish that:

- an invocation of a declared Operation preserves that Operation identity;
- an undeclared Operation is rejected.

**Disposition**

`SATISFIED`

## Q-COM3-G02 — Operation Form Preservation

Derived from:

`G-COM3-02 — Operation Form Preservation`

The executable realization shall preserve the declared Operation form.

Qualification shall establish that:

- Announcement remains Announcement;
- Interrogation remains Interrogation;
- incompatible use of an Operation form is rejected.

**Disposition**

`SATISFIED`

## Q-COM3-G03 — Invocation Conformance

Derived from:

`G-COM3-03 — Invocation Conformance`

The executable realization shall accept conforming Operation Invocations and
reject non-conforming invocations.

Qualification shall establish that:

- the declared parameter set is accepted;
- missing declared parameters are rejected;
- undeclared parameters are rejected;
- incompatible parameter counts are rejected.

**Disposition**

`SATISFIED`

## Q-COM3-G04 — Announcement Termination Independence

Derived from:

`G-COM3-04 — Announcement Termination Independence`

The executable realization shall preserve Announcement semantics without
requiring a contractual Operation Termination.

Qualification shall establish that:

- an Announcement establishes an Operation Invocation;
- Announcement form is preserved;
- no contractual termination type is required;
- the Announcement invocation carries no contractual Operation Termination.

**Disposition**

`SATISFIED`

## Q-COM3-G05 — Declared Termination Conformance

Derived from:

`G-COM3-05 — Declared Termination Conformance`

A contractual Interrogation termination shall conform to a declared termination
type and its declared parameters.

Qualification shall establish that:

- a declared termination type is accepted;
- declared termination parameters are accepted;
- undeclared termination types are rejected;
- missing declared termination parameters are rejected;
- undeclared termination parameters are rejected.

**Disposition**

`SATISFIED`

## Q-COM3-G06 — Invocation-Termination Association

Derived from:

`G-COM3-06 — Invocation-Termination Association`

A contractual Operation Termination shall remain associated with the
originating Operation Invocation.

Qualification shall establish that:

- the termination preserves the originating invocation;
- the originating invocation identity is preserved;
- a completed Interrogation preserves its selected termination;
- the termination remains associated with the corresponding invocation.

**Disposition**

`SATISFIED`

## Q-COM3-G07 — Single Termination Selection

Derived from:

`G-COM3-07 — Single Termination Selection`

A completed Interrogation shall establish exactly one selected contractual
termination.

Qualification shall establish that:

- an Interrogation initially has no selected termination;
- the first declared termination completes the Interrogation;
- the first termination remains selected;
- a second contractual termination is rejected;
- rejection of a second completion does not replace the selected termination.

This obligation does not imply exactly-once transport delivery, exactly-once
processing or eventual completion.

**Disposition**

`SATISFIED`

## Qualification Summary

| Obligation | Service Guarantee | Disposition |
|---|---|---|
| Q-COM3-G01 | G-COM3-01 | SATISFIED |
| Q-COM3-G02 | G-COM3-02 | SATISFIED |
| Q-COM3-G03 | G-COM3-03 | SATISFIED |
| Q-COM3-G04 | G-COM3-04 | SATISFIED |
| Q-COM3-G05 | G-COM3-05 | SATISFIED |
| Q-COM3-G06 | G-COM3-06 | SATISFIED |
| Q-COM3-G07 | G-COM3-07 | SATISFIED |

All seven executable qualification obligations are satisfied for the exact
runtime identified by the COM3 Product 2 Qualified Runtime Identity.
