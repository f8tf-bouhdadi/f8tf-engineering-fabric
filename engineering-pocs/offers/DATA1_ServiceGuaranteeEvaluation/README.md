# DATA1-PoC — Service Guarantee Evaluation

> **Engineering PoC for DATA1-ES — Deterministic Audit Query Engineering Service**

## Purpose

DATA1-PoC evaluates whether the qualified DATA1 Engineering Service can satisfy
its declared Service Guarantees within a bounded customer context.

The PoC is intended for organizations that need objective evidence before
adopting, integrating, adapting, composing, or deploying DATA1-ES.

---

## Customer Question

> Can DATA1-ES register audit-oriented index information consistently and return
> deterministic, repeatable query results that can be independently verified?

---

## Evaluation Scope

The standard DATA1-PoC evaluates the declared DATA1 Service Guarantee set:

- `DATA1-GUA-01` — stable contractual interface;
- `DATA1-GUA-02` — explicit registration outcome;
- `DATA1-GUA-03` — registration idempotence;
- `DATA1-GUA-04` — conflicting identity rejection;
- `DATA1-GUA-05` — preservation after rejected conflict;
- `DATA1-GUA-06` — preservation of the registered source reference;
- `DATA1-GUA-07` — deterministic query response;
- `DATA1-GUA-08` — repeatable query response.

---

## PoC Deliverables

A scoped DATA1-PoC engagement may provide:

1. agreed evaluation scope;
2. Service Guarantee evaluation;
3. acceptance criteria;
4. qualification evidence;
5. qualified V1 delivery;
6. client-verification material;
7. acceptance decision;
8. engineering recommendation.

---

## What the Customer Can Evaluate

The PoC builds on the qualified DATA1 Engineering Service, its Service Contract,
qualification evidence, and client-verifiable delivery mechanisms.

The evaluation is designed to determine whether the standard DATA1-ES boundary
fits the customer's audit-query requirement before a commercial Runtime
Delivery or integration decision is made.

---

## Boundary

DATA1-PoC evaluates DATA1-ES only.

It does not claim DATA0-ES persistence guarantees and does not evaluate the
DATA01 Engineering Service Composition.

A requirement combining persistent source data with deterministic audit-oriented
registration and query belongs to the DATA01 composition boundary.

---

## Commercial Continuation

A successful DATA1-PoC may support:

- standard DATA1 adoption;
- qualified commercial Runtime Delivery;
- client-specific adaptation;
- integration;
- or composition with another F8TF Engineering Service.

For persistence plus deterministic audit-query requirements, the recommended
next evaluation target is DATA01.

---

## Entry Points

- DATA1 Engineering Service:
  `products/data/engineering-services/DATA1/README.md`
- Engineering PoC catalog:
  `engineering-pocs/README.md`

**Interested in evaluating DATA1 for your system?** Contact F8TF at `m.bouhdadi@um5r.ac.ma`.
