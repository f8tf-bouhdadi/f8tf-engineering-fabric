# F8TF Engineering PoCs

An F8TF Engineering PoC is a governed and bounded evaluation of an Engineering
Capability or Engineering Product against a concrete client need.

It is not a standalone prototype and it is not limited to proving that a
component can run.

## What an Engineering PoC Does

An Engineering PoC helps a prospective client determine whether a selected
F8TF capability can address a defined need within an explicit scope.

It connects:

Client Need
→ Engineering Capability
→ Engineering Product
→ Acceptance Criteria
→ Verification Actions
→ Evidence
→ Adoption Decision

## What Every PoC Defines

Each Engineering PoC identifies:

- the client need;
- the target capability;
- the Engineering Product involved;
- the bounded scope;
- the guarantees to demonstrate;
- the acceptance criteria;
- the verification actions;
- the evidence to produce;
- the result;
- and the recommended next step.

## Current PoC Areas

### Governed Service Discovery

Evaluate publication, discovery, selection and traceable outcomes using
TRADER0.

### Trusted Distributed Communication

Evaluate policy-constrained bindings, trust boundaries and explicit
communication requirements using NET0.

### Traceable Engineering Data

Evaluate deterministic persistence, indexing, versioning and audit-oriented
traceability using the DATA product family.

## What Happens After a PoC

A completed PoC supports one of the following decisions:

- stop the evaluation;
- revise the scope;
- extend the evaluation;
- begin a pilot engagement;
- or proceed toward adoption.

Continue your journey:

[Review F8TF Guarantees](../guarantees/)

---

## Available Engineering PoC Offers

### DATA0_POC01 — Service Guarantee Evaluation

Evaluate a selected subset of the declared DATA0-ES Service Guarantees
against an agreed customer requirement or bounded integration context.

This is a scoped commercial Engineering PoC. Customers can first inspect
DATA0-ES and its Standard Qualified Delivery at no cost before deciding
whether a customer-specific evaluation is required.

**Offer:**
[`DATA0_POC01 — Service Guarantee Evaluation`](offers/DATA0_POC01_ServiceGuaranteeEvaluation/README.md)

**Engineering Service:**
[`DATA0-ES — Foundational Immutable Data Persistence Engineering Service`](../products/data/engineering-services/DATA0/README.md)

The PoC does not evaluate DATA01 composition guarantees. Auditable
persistence-and-query requirements involving DATA0-ES and DATA1-ES belong
to the DATA01 Engineering Service Composition.

### DATA1-PoC — Service Guarantee Evaluation

Evaluate the declared DATA1-ES Service Guarantees for deterministic,
repeatable audit-oriented registration and query behavior.

**Offer:**
[`DATA1-PoC — Service Guarantee Evaluation`](offers/DATA1_ServiceGuaranteeEvaluation/README.md)

**Engineering Service:**
[`DATA1-ES — Deterministic Audit Query Engineering Service`](../products/data/engineering-services/DATA1/README.md)

Requirements combining persistent source data with deterministic audit-oriented
query belong to the DATA01 Engineering Service Composition.

### DATA01-PoC — Composition Guarantee Evaluation

Evaluate the declared guarantees of the DATA01-ES Auditable Data Foundation
across the qualified DATA0 and DATA1 service boundaries.

**Offer:**
[`DATA01-PoC — Composition Guarantee Evaluation`](offers/DATA01_CompositionGuaranteeEvaluation/README.md)

**Engineering Service Composition:**
[`DATA01-ES — Auditable Data Foundation`](../products/data/engineering-service-compositions/DATA01/README.md)

This PoC evaluates DATA01 composition guarantees rather than repeating the
independent DATA0-ES and DATA1-ES Service Guarantee Evaluations.
