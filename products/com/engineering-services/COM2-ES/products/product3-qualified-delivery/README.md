# COM2-ES Product 3 — Qualified Delivery

## Engineering Service

**COM2-ES — Controlled Interaction Admission Engineering Service**

## Product

**Product 3 — Qualified Delivery**

Product 3 extends the COM2-ES Qualified Runtime established by Product 2 through:

- `LCS-11 — Operator Contract`
- `LCS-12 — Runtime Delivery`
- `LCS-13 — Delivery Verification`
- `LCS-14 — Qualified Delivery Identity`
- `LCS-15 — Sealed Delivery`
- `LCS-16 — Independent Client Verification and Operation`

It answers the question:

**Which exact COM2 delivery can the recipient independently verify and operate?**

## Product 2 Origin

Product 3 preserves the Qualified Runtime established by:

**COM2-ES Product 2 — Qualified Runtime**

The Product 2 runtime identity remains authoritative for the executable
components embedded in Product 3.

## LCS-11 — Operator Contract

The delivery defines the operational responsibilities required to install,
configure, start, inspect, stop and uninstall COM2.

See:

- [Operator Contract](operator/OPERATOR_CONTRACT.md)

## LCS-12 — Runtime Delivery

The Qualified Runtime is incorporated into a self-contained Runtime Delivery
together with its operator and integration surfaces.

## LCS-13 — Delivery Verification

The Runtime Delivery is verified for completeness, Qualified Runtime identity,
runtime integrity, operator surface, integration surface, configuration model
and independent operational execution.

## LCS-14 — Qualified Delivery Identity

The verified 27-file Runtime Delivery has its own reproducible SHA-256 content
identity.

See:

- [Qualified Delivery Identity](identity/qualified_delivery.sha256)

This identity is distinct from the Product 2 Qualified Runtime Identity.

## LCS-15 — Sealed Delivery

The Qualified Delivery is materialized as a distributable sealed package.

Its package content is represented by:

- [Sealed Package Manifest](identity/sealed_package_manifest.sha256)

The distributable archive has its own SHA-256 identity:

- [Sealed Delivery Identity](identity/sealed_delivery.sha256)

## LCS-16 — Independent Client Verification and Operation

The sealed delivery was exercised from an external client boundary without
operational dependency on the development repository.

The verification covered acquisition, archive identity, package integrity,
Qualified Delivery identity, installation, startup, health, documented service
interaction, contractual outcome observation, logs, shutdown and
uninstallation.

See:

- [Independent Client Verification](qualification/INDEPENDENT_CLIENT_VERIFICATION.md)
- [Qualification Summary](qualification/QUALIFICATION_SUMMARY.md)
- [Integration Contract](integration/INTEGRATION_CONTRACT.md)

## Download — Qualified Delivery 1.0.0

COM2-ES Product 3 is publicly downloadable.

Release:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/com2-qualified-delivery-v1.0.0

Sealed Delivery archive:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/com2-qualified-delivery-v1.0.0/F8TF_COM2_SEALED_DELIVERY_1.0.0.tar.gz

Archive SHA-256 file:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/com2-qualified-delivery-v1.0.0/F8TF_COM2_SEALED_DELIVERY_1.0.0.tar.gz.sha256

Published sealed archive SHA-256:

`4ae3945f81739a6956c579108fc04ea996ddf8d3d1f4fe74f22253030a6b2d4a`

The published archive is the exact sealed COM2 Qualified Delivery established
by LCS-15 and subsequently exercised through LCS-16 Independent Client
Verification and Operation.

## Product 3 Boundary

Product 3 establishes:

**Operator Contract → Runtime Delivery → Delivery Verification → Qualified
Delivery Identity → Sealed Delivery → Independent Client Verification and
Operation**

The public Product 3 surface exposes the contracts, identities and qualification
results required to understand and independently verify the delivered product.

Internal construction and qualification machinery is not part of this public
product surface.

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
