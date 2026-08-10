# DATA0_POC01 — Service Guarantee Evaluation

> **Engineering PoC for DATA0-ES — Foundational Immutable Data Persistence Engineering Service**

## Purpose

DATA0_POC01 evaluates whether the qualified DATA0 Engineering Service can
satisfy an agreed subset of its declared Service Guarantees within a bounded
customer context.

The PoC is intended for organizations that need evidence before adopting,
integrating, adapting, or deploying DATA0-ES.

---

## Customer Question

> Can DATA0-ES satisfy the selected persistence guarantees required by our
> system, and can those guarantees be evaluated through reproducible evidence?

---

## Evaluation Scope

A DATA0_POC01 engagement defines a bounded evaluation scope from the declared
DATA0 Service Guarantees.

The qualified guarantee set includes:

- `G-DATA0-APPEND`
- `G-DATA0-NONDESTRUCTIVE`
- `G-DATA0-MONOTONIC`
- `G-DATA0-VALIDATION`
- `G-DATA0-DURABILITY-MIN`
- `G-DATA0-SERIALIZATION`
- `G-DATA0-TRACE`
- `G-DATA0-REPRO`

The exact subset evaluated in a customer engagement is agreed before execution.

---

## PoC Deliverables

A scoped DATA0_POC01 engagement may provide:

1. agreed evaluation scope;
2. selected Service Guarantees;
3. acceptance criteria;
4. verification plan;
5. executed guarantee evaluation;
6. evidence package;
7. qualification result;
8. acceptance record;
9. engineering recommendation.

The final recommendation may support:

- adoption of the standard DATA0 delivery;
- qualified runtime delivery;
- adaptation;
- integration;
- composition with another Engineering Service;
- or rejection when the required guarantees are not satisfied.

---

## What the Customer Can Evaluate First

Before commissioning this PoC, customers can inspect the public DATA0
Engineering Service and its Standard Qualified Delivery.

The public delivery provides a no-cost entry point for examining:

- the DATA0 Service Contract;
- declared guarantees;
- documented limitations;
- qualification evidence;
- package integrity;
- client-side verification material.

DATA0_POC01 is therefore not required merely to inspect DATA0.

It is the commercial engineering engagement used when evaluation must be
performed against a specific customer requirement or bounded integration
context.

---

## Boundary

DATA0_POC01 evaluates DATA0-ES.

It does not claim the guarantees of compositions or other Engineering Services.

In particular, an auditable persistence-and-query foundation involving
DATA0-ES and DATA1-ES belongs to the DATA01 Engineering Service Composition and
is outside the boundary of this PoC.

---

## Commercial Engagement

DATA0_POC01 is offered as a scoped commercial Engineering PoC.

Scope, schedule, acceptance criteria, delivery conditions, and commercial terms
are agreed for each engagement.

The public repository intentionally exposes the offer and evaluation model,
while customer-specific execution material and qualified commercial
deliverables are supplied through the corresponding engagement.

---

## Entry Points

- DATA0 Engineering Service:
  `products/data/engineering-services/DATA0/README.md`
- Engineering PoC process:
  `engineering-pocs/README.md`
- DATA0 evaluation process:
  `engineering-pocs/DATA0_EVALUATION_PROCESS.md`
- DATA0 execution process:
  `engineering-pocs/DATA0_SERVICE_EXECUTION_PROCESS.md`
- Remote delivery and verification:
  `engineering-pocs/DATA0_REMOTE_DELIVERY_AND_VERIFICATION.md`
