# COM2 Product1 — Assured Integration-Ready Engineering Service Specification

Service:

COM2-ES — Controlled Interaction Admission Engineering Service

Version:

1.0.0

## Purpose

This package provides the assured integration-ready specification of COM2-ES.

It is intended for system architects, engineering teams and integrators that
need to derive or integrate a realization of COM2-ES while preserving its
authoritative Service Contract and Service Guarantees.

## Authoritative Service Guarantees

- G-COM2-01 — Controlled Interaction Admission
- G-COM2-02 — Explicit Admission Outcome
- G-COM2-03 — Interaction Identity Preservation
- G-COM2-04 — Optional Interaction Information

## Download — Assured Specification 1.0.0

COM2-ES Product 1 is publicly downloadable.

Release:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/com2-assured-integration-ready-specification-v1.0.0

Assured Specification archive:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/com2-assured-integration-ready-specification-v1.0.0/F8TF_COM2_ASSURED_INTEGRATION_READY_SPECIFICATION_1.0.0.tar.gz

Archive SHA-256 file:

https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/com2-assured-integration-ready-specification-v1.0.0/F8TF_COM2_ASSURED_INTEGRATION_READY_SPECIFICATION_1.0.0.tar.gz.sha256

Published archive SHA-256:

`657227c8ba270dfb516266720f46fc9c46fb0cf9fd9dfa8f0b81c539001822dd`

The package contains the complete COM2-ES Product1 specification surface for
LCS-01 through LCS-07 together with Product identity, integrity manifest and
recipient-side verification.

## Product Boundary

This Product1 package covers LCS-01 through LCS-07.

It contains the Service Contract, RM-ODP viewpoint specifications,
inter-viewpoint correspondence specifications, UML projections,
Specification Proof Obligations, integrator traceability and the Product1
realization mapping.

It does not contain an executable realization, executable qualification,
Qualified Runtime or Qualified Delivery.

## Independent Verification

From the extracted package root run:

    bash ./VERIFY_CLIENT.sh

A PASS establishes that the expected Product1 package is complete and that
its delivered files match the integrity manifest.

It does not constitute executable qualification.
