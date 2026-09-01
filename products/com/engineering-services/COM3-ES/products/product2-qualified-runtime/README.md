# COM3-ES Product 2 — Qualified Runtime

## Engineering Service

**COM3-ES — Assured Operation Interaction Engineering Service**

## Product

**Product 2 — Qualified Runtime**

Product 2 extends the assured Product 1 specification through:

- `LCS-08 — Executable Realization`
- `LCS-09 — Executable Qualification`
- `LCS-10 — Qualified Runtime Identity`

It answers:

**Which exact executable realization has been qualified against the COM3-ES Service Guarantees?**

## Product 1 Origin

The Qualified Runtime realizes:

**COM3-ES Product 1 — Assured Integration-Ready Engineering Service Specification**

The authoritative Service Guarantees remain:

- `G-COM3-01 — Declared Operation Preservation`
- `G-COM3-02 — Operation Form Preservation`
- `G-COM3-03 — Invocation Conformance`
- `G-COM3-04 — Announcement Termination Independence`
- `G-COM3-05 — Declared Termination Conformance`
- `G-COM3-06 — Invocation-Termination Association`
- `G-COM3-07 — Single Termination Selection`

## LCS-08 — Executable Realization

The COM3 Product 1 specification has an executable .NET 8 realization.

The Product 2 Qualified Runtime consists of exactly six executable components:

- `F8TF.COM3.Api.dll`
- `F8TF.COM3.Application.dll`
- `F8TF.COM3.Domain.dll`
- `F8TF.COM3.Platform.dll`
- `F8TF.COM3.Api.runtimeconfig.json`
- `F8TF.COM3.Api.deps.json`

Product 2 publishes the exact qualified executable identity without publishing
the internal development or qualification implementation.

## LCS-09 — Executable Qualification

The executable realization was evaluated against all seven authoritative
COM3-ES Service Guarantees.

See:

- [Executable Proof Obligations](qualification/EXECUTABLE_PROOF_OBLIGATIONS.md)
- [Qualification Result](qualification/QUALIFICATION_RESULT.md)

All seven executable qualification obligations are satisfied.

## LCS-10 — Qualified Runtime Identity

The exact executable realization to which the qualification result applies is
identified by SHA-256 over the six qualified runtime components.

See:

- [Qualified Runtime Identity](identity/qualified_runtime.sha256)

The SHA-256 identity of the Qualified Runtime Identity file is:

`ca46316d0ae42311bdafe67a315ff609a72ee7234d859631beef4400b4e53c79`

This allows a recipient of the corresponding runtime to establish that the
obtained executable components correspond exactly to the runtime to which the
published qualification result applies.

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

**COM3-ES Product 3 — Qualified Delivery**

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

## Publication Status

The Qualified Runtime is established.

The downloadable Product 2 release package is published separately from this
engineering surface.
