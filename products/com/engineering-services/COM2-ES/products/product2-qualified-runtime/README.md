# COM2-ES Product 2 — Qualified Runtime

## Engineering Service

**COM2-ES — Controlled Interaction Admission Engineering Service**

## Product

**Product 2 — Qualified Runtime**

Product 2 extends the assured Product 1 specification through:

- `LCS-08 — Executable Realization`
- `LCS-09 — Executable Qualification`
- `LCS-10 — Qualified Runtime Identity`

It answers the question:

**Which exact executable realization has been qualified against the COM2-ES Service Guarantees?**

## Product 1 Origin

The Qualified Runtime realizes:

**COM2-ES Product 1 — Assured Integration-Ready Engineering Service Specification**

The authoritative Service Guarantees remain:

- `G-COM2-01 — Controlled Interaction Admission`
- `G-COM2-02 — Explicit Admission Outcome`
- `G-COM2-03 — Interaction Identity Preservation`
- `G-COM2-04 — Optional Interaction Information`

## LCS-08 — Executable Realization

A .NET 8 HTTP/JSON executable realization implements the selected COM2
Technology Specification and exposes the qualified interaction-admission
boundary.

Product 2 documents the qualified realization without publishing the internal
development and qualification implementation.

## LCS-09 — Executable Qualification

The executable realization was evaluated at its runtime boundary against the
four authoritative COM2-ES Service Guarantees.

See:

- [Executable Proof Obligations](qualification/EXECUTABLE_PROOF_OBLIGATIONS.md)
- [Qualification Result](qualification/QUALIFICATION_RESULT.md)

## LCS-10 — Qualified Runtime Identity

The exact executable realization for which qualification was demonstrated is
identified by SHA-256 over six runtime components.

See:

- [Qualified Runtime Identity](identity/qualified_runtime.sha256)

The identity allows a recipient of the corresponding runtime to establish that
the obtained executable is the realization to which the published qualification
result applies.

## Product 2 Boundary

Product 2 establishes:

**Executable Realization → Executable Qualification → Qualified Runtime Identity**

Product 2 does not establish:

- Operator Contract;
- Runtime Delivery;
- Delivery Verification;
- Qualified Delivery Identity;
- Sealed Delivery;
- Independent Client Verification and Operation.

Those responsibilities belong to:

**COM2-ES Product 3 — Qualified Delivery**

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
