# DATA01 — F8TF Auditable Data Foundation

> **Persist. Audit.**

## Composition Identity

- **Composition ID:** `DATA01-ADF`
- **Product Name:** F8TF Auditable Data Foundation
- **Composition Type:** Qualified Engineering Service Composition
- **Included Engineering Services:**
  - `DATA0-ES` — Foundational Immutable Data Persistence Engineering Service
  - `DATA1-ES` — Deterministic Audit Query Engineering Service

## Purpose

DATA01 composes DATA0-ES and DATA1-ES to establish a traceable and
deterministic engineering chain from accepted application content to a
reproducible audit-query result.

The composition preserves the correspondence between:

- the content submitted to DATA0;
- its effective persistent identity;
- its effective persistence timestamp;
- the audit entry registered through DATA1;
- and the information returned by DATA1 audit queries.

## Qualified Interaction Chain

AppendRequest.payload
→ RawPersistenceService.append(AppendRequest)
→ AppendResult(offset, ts_utc)
→ Persisted Record
→ DATA1 AuditIndexEntry
→ AuditIndexRegistrationService.registerEntry(AuditIndexEntry)
→ RegistrationDecision
→ AuditQueryService.query(QueryRequest)
→ QueryResponse

## Composition Principle

DATA01 is not a simple grouping of DATA0-ES and DATA1-ES.

It is a qualified Engineering Service Composition with its own:

- service bindings;
- information correspondences;
- invariants;
- end-to-end guarantees;
- acceptance criteria;
- verification rules;
- composition evidence.

## Composition Guarantees

Within the qualified DATA01 boundary:

- accepted content receives an explicit persistent source identity;
- the effective DATA0 persistence timestamp is preserved;
- no composition-specific replacement timestamp is introduced;
- the audit-entry identity is deterministically derived from the DATA0 offset;
- identical registration yields `ALREADY_REGISTERED`;
- conflicting registration yields `REJECTED`;
- rejected registration does not mutate the registered entry;
- repeated equivalent queries over unchanged indexed state produce equivalent responses;
- returned audit results preserve `raw_ref`, `ts_utc` and payload correspondence.

## Qualification Status

DATA01 is a qualified Engineering Service Composition of the independently
qualified DATA0-ES and DATA1-ES Engineering Services.

The DATA01 qualification covers eight declared composition Service Guarantees:

- `DATA01-GUA-01` — Accepted Source Guarantee;
- `DATA01-GUA-02` — Content Preservation Guarantee;
- `DATA01-GUA-03` — Source Traceability Guarantee;
- `DATA01-GUA-04` — Deterministic Identity Guarantee;
- `DATA01-GUA-05` — Registration Idempotence Guarantee;
- `DATA01-GUA-06` — Deterministic Query Guarantee;
- `DATA01-GUA-07` — Explicit Outcome Guarantee;
- `DATA01-GUA-08` — Evidence Traceability Guarantee.

These guarantees apply within the declared DATA01 composition boundary and do
not extend the independently qualified guarantees of DATA0-ES or DATA1-ES.

The technology-independent service contracts, composition guarantees,
acceptance criteria and qualification evidence define the public engineering
surface. Runtime implementations and internal realization assets remain
separate from that public surface.

## Standard Qualified Delivery

DATA01 provides a public Standard Qualified Delivery for independent review
and offline verification of the qualified V1 composition boundary.

The delivery contains:

- the declared DATA01 composition boundary;
- acceptance criteria;
- qualification evidence covering `DATA01-GUA-01` through `DATA01-GUA-08`;
- persistent composition evidence for accepted and rejected execution paths;
- RM-ODP and UML documentation;
- contracts and representative samples;
- integrity information;
- and an offline client verification procedure.

The delivery verifies DATA01 as an Engineering Service Composition.
It does not independently re-qualify DATA0-ES or DATA1-ES and does not expose
their commercial runtime deliveries.

[Download DATA01 Standard Qualified Delivery 1.0](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data01-standard-qualified-delivery-v1.0/F8TF_DATA01_STANDARD_QUALIFIED_DELIVERY_1.0.tar.gz)

[Download the SHA-256 checksum](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data01-standard-qualified-delivery-v1.0/F8TF_DATA01_STANDARD_QUALIFIED_DELIVERY_1.0.tar.gz.sha256)

[Review the GitHub Release](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/data01-standard-qualified-delivery-v1.0)

## Composition Boundary

The initial qualified composition is bounded to:

- one qualified DATA0 persistence service;
- one qualified DATA1 registration service;
- one qualified DATA1 audit-query service;
- one application payload per DATA0 append interaction;
- one explicit audit topic supplied by the Binding Profile;
- deterministic identity derived from the DATA0 offset;
- deterministic registration outcomes;
- deterministic repeated audit queries over unchanged indexed state.

Technology-specific implementations may use JSONL, SQLite or other declared
technologies, but these technologies do not define the technology-independent
DATA01 service contract.

## Out of Scope

DATA01 does not provide:

- additional persistent document-management services;
- distributed ingestion;
- streaming transport;
- automatic continuous synchronization;
- authentication or authorization;
- cross-service identity propagation beyond the qualified binding;
- replication, sharding or high availability;
- sector-specific compliance certification;
- complete formal proof.

Any future extension of DATA01 must be defined through a separately qualified
Engineering Service Composition. Service numbering alone does not imply a
composition or dependency.

## Product Position

DATA01 is not merely a storage implementation and not merely an audit-query
interface.

It is a qualified **Auditable Data Foundation** that composes persistence and
auditability through explicit service contracts, information correspondences,
engineering bindings, acceptance rules and reproducible evidence.

> **Persist. Audit.**

**Interested in evaluating DATA01 for your system?** Contact F8TF at `m.bouhdadi@um5r.ac.ma`.
