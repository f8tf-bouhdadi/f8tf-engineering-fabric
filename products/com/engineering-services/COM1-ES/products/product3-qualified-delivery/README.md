# COM1-ES Product 3 — Qualified Delivery

## Engineering Service

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

## Product

**Product 3 — Qualified Delivery**

Product 3 extends the COM1-ES Qualified Runtime established by Product 2 through
the complete delivery boundary:

- `LCS-11 — Operator Contract`
- `LCS-12 — Runtime Delivery`
- `LCS-13 — Delivery Verification`
- `LCS-14 — Qualified Delivery Identity`
- `LCS-15 — Sealed Delivery`
- `LCS-16 — Independent Client Verification and Operation`

The authoritative COM1-ES Service Contract and Service Guarantees are preserved
from Product 1 through Product 2 into Product 3.

## Product 2 Origin

Product 3 delivers the executable realization established as:

**COM1-ES Product 2 — Qualified Runtime**

The Qualified Delivery preserves the identity of the qualified runtime while
adding the artifacts required for independent verification and operation.

## LCS-11 — Operator Contract

The Qualified Delivery defines the external operational actions required to:

- install;
- configure;
- start;
- verify;
- interact with;
- inspect;
- stop; and
- uninstall

COM1-ES.

See:

- [Operator Contract](operator/OPERATOR_CONTRACT.md)

## LCS-12 — Runtime Delivery

A self-contained runtime delivery has been constructed from the Qualified
Runtime and the operational and integration artifacts required by the delivery
boundary.

The internal construction mechanism is not part of the public Product 3
surface.

## LCS-13 — Delivery Verification

The Runtime Delivery is verified against its expected contents and against the
Qualified Runtime Identity established by Product 2.

The verified Runtime Delivery has its own reproducible identity:

- [Qualified Runtime Delivery Identity](identity/qualified_runtime_delivery.sha256)

See also:

- [Qualification Summary](qualification/QUALIFICATION_SUMMARY.md)

## LCS-14 — Qualified Delivery Identity

The complete verified delivery has a reproducible content identity that binds
the qualified runtime, the verified Runtime Delivery, the qualification binding,
the qualification evidence and the client verification mechanism.

The complete delivery identity is represented by its integrity manifest.

See:

- [Qualified Delivery Identity](identity/qualified_delivery_manifest.sha256)

## LCS-15 — Sealed Delivery

The Qualified Delivery is materialized as an immutable distributable archive
whose integrity is independently checkable through its published SHA-256
identity.

See:

- [Sealed Delivery Identity](identity/sealed_delivery.sha256)

## LCS-16 — Independent Client Verification and Operation

The sealed delivery has been exercised from an independent client boundary
without access to the development repository.

The exercise covered delivery verification, runtime-identity verification,
installation, startup, runtime verification, documented client interaction,
status and log inspection, shutdown and uninstallation.

See:

- [Independent Client Verification](qualification/INDEPENDENT_CLIENT_VERIFICATION.md)
- [Integration Contract](integration/INTEGRATION_CONTRACT.md)

## Access Boundary

The public Product 3 surface documents the Qualified Delivery, its identities,
its operational contract, its integration boundary and its independent
verification result.

The internal mechanisms used to construct, qualify and seal the delivery are
not part of this public product surface.

The distributable Qualified Delivery may therefore be provided independently
of the private engineering repository and its internal production mechanisms.

## Lifecycle Position

    Product 1
    Assured Integration-Ready Engineering Service Specification
        ->
    Product 2
    Qualified Runtime
        ->
    LCS-11 — Operator Contract
        ->
    LCS-12 — Runtime Delivery
        ->
    LCS-13 — Delivery Verification
        ->
    LCS-14 — Qualified Delivery Identity
        ->
    LCS-15 — Sealed Delivery
        ->
    LCS-16 — Independent Client Verification and Operation
        ->
    Product 3 — Qualified Delivery
