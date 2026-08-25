# COM1-ES Product 2 — Qualified Runtime

## Engineering Service

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

## Product

**Product 2 — Qualified Runtime**

Product 2 is established through:

- `LCS-08 — Executable Realization`
- `LCS-09 — Executable Qualification`
- `LCS-10 — Qualified Runtime Identity`

Product 2 preserves the authoritative COM1-ES Service Guarantees established
by Product 1 and extends the Engineering Service boundary through executable
realization and qualification.

## Product 1 Origin

The Qualified Runtime realizes:

**COM1-ES Product 1 — Assured Integration-Ready Engineering Service Specification**

The executable realization preserves the Service Contract, authoritative
Service Guarantees and specification semantics established by Product 1.

## LCS-08 — Executable Realization

A structured executable realization of COM1-ES exists and implements the
selected Technology Specification.

The realization correspondence from Technology responsibilities to executable
responsibilities is established by the COM1 Technology-to-Code mapping.

The public Product 2 surface documents the qualified realization without
publishing the private development source tree.

## LCS-09 — Executable Qualification

The executable realization has been evaluated against the four authoritative
COM1-ES Service Guarantees:

- `G-COM1-BOUNDED`
- `G-COM1-COMPLETE`
- `G-COM1-RESPONSE`
- `G-COM1-ISOLATION`

Executable qualification is governed by:

`F8TF_EXECUTABLE_QUALIFICATION_PROCESS_V3`

The executable Proof Obligations and the captured qualification result are
published under:

- [Executable Proof Obligations](qualification/EXECUTABLE_PROOF_OBLIGATIONS.md)
- [Qualification Result](qualification/QUALIFICATION_RESULT.md)

## LCS-10 — Qualified Runtime Identity

The exact runtime binaries for which qualification has been demonstrated are
identified reproducibly by SHA-256.

See:

- [Qualified Runtime Identity](identity/qualified_runtime.sha256)

This identity corresponds to the runtime binaries qualified by the captured V1
qualification execution.

## Product 2 Boundary

Product 2 establishes the qualified executable realization and its identity.

Product 2 does not include:

- Operator Contract;
- Runtime Delivery;
- Delivery Verification;
- Qualified Delivery Identity;
- Sealed Delivery;
- Independent Client Verification and Operation.

Those concerns belong to:

**COM1-ES Product 3 — Qualified Delivery**

## Lifecycle Position

    Product 1
    Assured Integration-Ready Engineering Service Specification
        ->
    LCS-08 — Executable Realization
        ->
    LCS-09 — Executable Qualification
        ->
    LCS-10 — Qualified Runtime Identity
        ->
    Product 2 — Qualified Runtime
