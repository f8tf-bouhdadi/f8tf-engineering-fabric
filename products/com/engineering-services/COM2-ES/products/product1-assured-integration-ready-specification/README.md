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
