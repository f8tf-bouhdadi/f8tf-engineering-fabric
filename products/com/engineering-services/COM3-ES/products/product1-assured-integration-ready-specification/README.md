# COM3 Product 1 — Assured Integration-Ready Engineering Service Specification

## Engineering Service

**COM3-ES — Assured Operation Interaction Engineering Service**

## Version

`1.0.0`

## Purpose

This package provides the assured integration-ready specification of COM3-ES.

It is intended for system architects, engineering teams and integrators that
need to derive or integrate a realization of COM3-ES while preserving its
authoritative Service Contract and Service Guarantees.

## Authoritative Service Guarantees

- `G-COM3-01` — Declared Operation Preservation
- `G-COM3-02` — Operation Form Preservation
- `G-COM3-03` — Invocation Conformance
- `G-COM3-04` — Announcement Termination Independence
- `G-COM3-05` — Declared Termination Conformance
- `G-COM3-06` — Invocation-Termination Association
- `G-COM3-07` — Single Termination Selection

## Download — Assured Specification 1.0.0

COM3-ES Product 1 is publicly downloadable.

Release:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/com3-assured-integration-ready-specification-v1.0.0

Assured Specification archive:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/com3-assured-integration-ready-specification-v1.0.0/F8TF_COM3_ASSURED_INTEGRATION_READY_SPECIFICATION_1.0.0.tar.gz

Archive SHA-256 file:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/com3-assured-integration-ready-specification-v1.0.0/F8TF_COM3_ASSURED_INTEGRATION_READY_SPECIFICATION_1.0.0.tar.gz.sha256

Archive integrity:

Verify the downloaded archive against the companion `.tar.gz.sha256` file
published with the release.

The package contains the complete COM3-ES Product 1 specification surface for
LCS-01 through LCS-07 together with Product identity, integrity manifest and
recipient-side verification.

## Product Boundary

This Product 1 package covers LCS-01 through LCS-07.

It contains the Service Contract, RM-ODP viewpoint specifications,
inter-viewpoint correspondence specifications, UML projections, Specification
Proof Obligations, integrator traceability and the Product 1 realization
mapping.

It does not contain an executable realization, executable qualification,
Qualified Runtime or Qualified Delivery.

## Independent Verification

From the extracted package root run:

    bash ./VERIFY_CLIENT.sh

A PASS establishes that the expected Product 1 package is complete and that its
delivered files match the integrity manifest.

It does not constitute executable qualification.
