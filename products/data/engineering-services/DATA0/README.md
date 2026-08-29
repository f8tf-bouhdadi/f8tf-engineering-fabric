## DATA0-ES — Foundational Immutable Data Persistence Engineering Service

### Engineering Promise

Preserve engineering data without destructive mutation.

### Customer Need

Use DATA0-ES when an engineering system needs to record information while
preserving the existing data baseline.

This is relevant when recorded information must remain available for later
verification, replay, traceability or audit.

### Engineering Concern

DATA0-ES addresses foundational concerns related to:

- persistent append recording within the declared runtime scope;
- non-destructive persistence;
- traceability of persistence operations;
- reproducible verification;
- preservation of an auditable data baseline.

### Engineering Capability

DATA0-ES provides the capability to validate and append raw engineering data
through an explicit service contract.

It may participate in qualified Engineering Service Compositions requiring
immutable persistence and explicit persistence traceability.

### Service Contract

The service defines explicit:

- inputs;
- preconditions;
- successful outcomes;
- failure conditions;
- trace records;
- and verification evidence.

The underlying implementation remains separated from the public service
contract.

### Engineering Guarantees

Current DATA0-ES guarantees include:

- append-only preservation;
- no destructive mutation through append;
- validation of required input;
- scoped monotonic offset assignment;
- persistence following successful append;
- append serialization within one service instance;
- minimal timestamp-based persistence trace information;
- and reproducible verification and packaging.

All eight declared DATA0-ES Service Guarantees are qualified at V1 within
the currently declared service scope.

Guarantees remain bounded by the declared service scope and maturity.

### Verification and Evidence

DATA0-ES is progressively qualified through:

- runnable verification at V0;
- audit-ready verification at V1;
- a verified maturity target at V2.

Available evidence includes:

- behavioural V0 execution results;
- strict V1 contract-audit results;
- RM-ODP and UML rendering results;
- captured gate reports;
- contract schemas and samples;
- integrity manifests;
- and an offline client verification procedure.

### Current Qualification

DATA0-ES is currently qualified at:

- **V0 — Runnable and behaviourally verified**;
- **V1 — Audit-ready and client-verifiable**.

The DATA0-ES Service Contract is qualified at V1 within its declared scope.

The qualification covers all eight declared Service Guarantees: accepted
append persistence, non-destructive append behaviour, scoped monotonic offset
assignment, required-input validation, minimal durability, append
serialization within one service instance, timestamp-based traceability, and
reproducible verification and delivery integrity.

The current verification does not claim:

- recovery of persistence across process restart;
- multi-process or distributed write serialization;
- replication or sharding;
- high availability;
- production-scale performance;
- or formal proof at V1.

### Runtime Realization

DATA0-ES is realized by an executable persistent-data runtime implementing the
declared DATA0 Service Contract within the currently qualified scope.

The runtime is an Engineering Asset realizing the service; it is not the
Engineering Service itself.

A controlled DATA0 Runtime Delivery profile packages that runtime for operator
deployment and is verified through a dedicated runtime-delivery lifecycle gate.

The qualified Runtime Delivery is publicly available at no cost for independent
deployment, operation and evaluation within the currently qualified DATA0-ES
scope.

It contains the executable runtime together with operator tooling, integration
material, runtime verification, qualification binding and integrity evidence.

The Runtime Delivery remains distinct from the DATA0 Standard Qualified
Delivery described below. The Standard Qualified Delivery supports independent
review of the Service Contract, guarantees, qualification evidence and package
integrity, while the Qualified Runtime Delivery additionally enables the client
to operate and verify the qualified executable realization.

Client-specific engineering services remain outside the public standard delivery.

### Obtain the DATA0 Qualified Runtime Delivery

The DATA0 Qualified Runtime Delivery 1.0.2 is publicly available at no cost for
independent deployment, operation and evaluation within the currently qualified
DATA0-ES scope.

[Download DATA0 Qualified Runtime Delivery 1.0.2](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data0-qualified-runtime-delivery-v1.0.2/F8TF_DATA0_QUALIFIED_RUNTIME_DELIVERY_1.0.2.tar.gz)

[Download the SHA-256 checksum](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data0-qualified-runtime-delivery-v1.0.2/F8TF_DATA0_QUALIFIED_RUNTIME_DELIVERY_1.0.2.tar.gz.sha256)

[Review the GitHub Release](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/data0-qualified-runtime-delivery-v1.0.2)

A client can independently:

1. verify the release archive checksum;
2. verify the complete delivery manifest;
3. verify the qualified runtime identity;
4. install DATA0 locally;
5. start the service;
6. execute the documented runtime verification;
7. perform append operations;
8. inspect service status and logs;
9. stop and uninstall the service.

### Standard Qualified Delivery

DATA0-ES provides a qualified standard delivery for reviewing the published
service contract, declared guarantees, limitations and verification evidence.

The standard delivery does not require a client-defined scenario or new
acceptance criteria. Its scope and qualified behavior are already defined by
the published DATA0 Engineering Service contract.

The qualified delivery verifies:

- successful append behavior;
- rejection of invalid input;
- preservation of previously recorded data;
- scoped monotonic offset behavior;
- minimal persistence traceability;
- contract artefacts;
- reproducible verification evidence;
- and package integrity.

### Standard Client Journey

The standard DATA0 client journey is:

1. **Discover** — understand the generic data engineering need addressed by
   DATA0-ES.
2. **Review** — examine the published service contract, guarantees and
   limitations.
3. **Obtain the qualified delivery** — receive or access the identified and
   versioned DATA0 package.
4. **Prepare the environment** — review the runtime, tools and configuration
   required by the delivery.
5. **Execute** — run the documented DATA0 interactions.
6. **Verify** — check package integrity, qualified behavior and supplied
   evidence using the client verification procedure.
7. **Assess suitability** — determine whether the standard DATA0 service fits
   the intended use.
8. **Contact F8TF if needed** — contact F8TF when the standard delivery does
   not fully cover the intended context.

Possible outcomes include:

- the standard DATA0 delivery is sufficient;
- the intended use is outside the currently qualified scope;
- or further technical evaluation is required.

### Obtain the DATA0 Standard Delivery

A qualified DATA0 V1 delivery package exists.

The qualified delivery contains:

- an identified and versioned DATA0 package;
- the applicable service scope and declared limitations;
- contract schemas and representative samples;
- behavioral and audit verification evidence;
- integrity manifests;
- and an offline client verification procedure.

The delivery enables a client to verify package integrity, inspect the
qualification evidence and compare the observed results with the declared
DATA0 guarantees.

The qualified DATA0 Standard Delivery 1.0 is publicly available at no cost.

[Download DATA0 Standard Qualified Delivery 1.0](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data0-standard-qualified-delivery-v1.0/F8TF_DATA0_STANDARD_QUALIFIED_DELIVERY_1.0.tar.gz)

[Download the SHA-256 checksum](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/download/data0-standard-qualified-delivery-v1.0/F8TF_DATA0_STANDARD_QUALIFIED_DELIVERY_1.0.tar.gz.sha256)

[Review the GitHub Release](https://github.com/f8tf-bouhdadi/f8tf-engineering-fabric/releases/tag/data0-standard-qualified-delivery-v1.0)

## Portfolio Progression

DATA0-ES provides the foundational persistence layer.

Additional F8TF Data Engineering Services progressively address:

- deterministic audit queries;
- persistent document storage;
- versioned key-value indexing;
- distributed data;
- workflows;
- observability;
- identity;
- replication;
- sharding;
- and idempotency.
