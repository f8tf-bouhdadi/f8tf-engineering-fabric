# DATA01-PoC — Composition Guarantee Evaluation

> **Engineering PoC for DATA01-ES — Auditable Data Foundation**

## Purpose

DATA01-PoC evaluates whether the qualified DATA01 Engineering Service
Composition satisfies its declared composition guarantees within a bounded
customer context.

The PoC is intended for organizations that need evidence that persistent source
data can participate in a deterministic, auditable and traceable
persistence-to-query chain.

---

## Customer Question

> Can DATA01-ES preserve an auditable persistence-to-query chain across the
> qualified DATA0 and DATA1 service boundaries, and can the resulting
> composition guarantees be independently verified?

---

## What Is Evaluated

DATA01-PoC evaluates the guarantees of DATA01-ES as a composition.

It does not simply repeat the separate evaluations of DATA0-ES and DATA1-ES.

The standard evaluation covers:

- `DATA01-GUA-01`
- `DATA01-GUA-02`
- `DATA01-GUA-03`
- `DATA01-GUA-04`
- `DATA01-GUA-05`
- `DATA01-GUA-06`
- `DATA01-GUA-07`
- `DATA01-GUA-08`

The evaluation includes complementary accepted and rejected execution paths.

---

## Composition Value

DATA01 combines qualified persistence and deterministic audit-query capabilities
while preserving explicit composition boundaries.

The evaluation examines properties including:

- persistence-to-audit traceability;
- preservation of source references;
- explicit processing outcomes;
- deterministic audit-oriented query behavior;
- composition evidence;
- bounded rejection behavior;
- reproducible qualification;
- independent client verification.

---

## PoC Deliverables

A scoped DATA01-PoC engagement may provide:

1. agreed composition-evaluation scope;
2. acceptance criteria;
3. DATA01 composition guarantee evaluation;
4. structured qualification result;
5. persistent composition evidence;
6. evidence-reference resolution;
7. qualified V1 delivery;
8. client-verification material;
9. acceptance decision;
10. engineering recommendation.

---

## Client Verification

The qualified DATA01 delivery is designed to allow independent verification of:

- package integrity;
- complete DATA01 guarantee qualification;
- complementary qualification scenarios;
- delivered composition evidence;
- correspondence between qualification reports and evidence;
- the declared DATA01 composition boundary.

---

## Boundary

DATA01-PoC evaluates DATA01-ES.

DATA0-ES and DATA1-ES are reused as qualified constituent service boundaries.

The PoC does not independently re-qualify those services and does not claim
guarantees belonging to higher F8TF compositions.

---

## Standard Qualified Delivery

The qualified DATA01 Standard Qualified Delivery 1.0 is publicly available for
independent review and offline verification before or alongside a scoped PoC.

[Download DATA01 Standard Qualified Delivery 1.0](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data01-standard-qualified-delivery-v1.0/F8TF_DATA01_STANDARD_QUALIFIED_DELIVERY_1.0.tar.gz)

[Download the SHA-256 checksum](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data01-standard-qualified-delivery-v1.0/F8TF_DATA01_STANDARD_QUALIFIED_DELIVERY_1.0.tar.gz.sha256)

[Review the GitHub Release](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/data01-standard-qualified-delivery-v1.0)

## Commercial Continuation

A successful DATA01-PoC may support:

- qualified DATA01 adoption;
- commercial qualified delivery;
- client integration;
- adaptation;
- an integration pilot;
- or evaluation of a higher Engineering Service Composition.

Sector-specific applications are treated separately from this generic
composition evaluation.

For example, a healthcare/FHIR application can be evaluated through a later
application PoC without redefining the generic DATA01 contract.

---

## Entry Points

- DATA01 Engineering Service Composition:
  `products/data/engineering-service-compositions/DATA01/README.md`
- DATA0 Engineering Service:
  `products/data/engineering-services/DATA0/README.md`
- DATA1 Engineering Service:
  `products/data/engineering-services/DATA1/README.md`
- Engineering PoC catalog:
  `engineering-pocs/README.md`

**Interested in evaluating DATA01 for your system?** Contact F8TF at `m.bouhdadi@um5r.ac.ma`.
