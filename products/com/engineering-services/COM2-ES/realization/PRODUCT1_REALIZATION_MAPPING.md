# COM2-ES — Product 1 Realization Mapping

## 1. Status

This document defines the Product 1 realization mapping from the
authoritative COM2 Technology Specification to implementation
responsibilities suitable for an independent integrator.

It is part of:

**Product 1 — Assured Integration-Ready Engineering Service Specification**

It does not define an executable realization, executable qualification,
Qualified Runtime or Qualified Delivery.

The authoritative COM2 Service Contract and Service Guarantees remain
authoritative.

The authoritative Service Guarantees are:

- `G-COM2-01 — Controlled Interaction Admission`
- `G-COM2-02 — Explicit Admission Outcome`
- `G-COM2-03 — Interaction Identity Preservation`
- `G-COM2-04 — Optional Interaction Information`

## 2. Realization Mapping Principle

The Product 1 derivation relation is:

    Technology Specification
        ->
    implementation responsibility
        ->
    implementation structure

Every contract-relevant implementation responsibility shall remain traceable
to its Technology Specification origin.

An independent integrator may choose its internal source-code organization
provided that the realization preserves:

- the Service Contract;
- the authoritative Service Guarantees;
- the Information objects, correspondences and invariants;
- the Computational interface semantics and behavioural rules;
- the Engineering interfaces, channels, mechanisms and constraints;
- the Technology responsibilities, bindings and constraints.

No implementation structure may silently redefine an upstream obligation.

## 3. Technology Profile Realization

### TECH-PROF-COM2-01 — .NET 8 HTTP/JSON Interaction Admission Profile

A realization of the selected COM2 Technology profile shall provide:

- .NET 8 execution;
- an HTTP request/response service boundary;
- HTTP POST interaction submission;
- JSON interaction representation;
- `System.Text.Json` interpretation;
- separation of Domain, Application, Platform and API responsibilities.

Alternative implementation structures may be used when they preserve the
selected Technology profile and all upstream COM2 obligations.

## 4. Technology Architecture Realization Responsibilities

### TECH-ARCH-COM2-01 — Domain Information Layer

Implementation responsibility:

- represent `InteractionSubmission`;
- represent `Envelope`;
- represent `AdmissionOutcome`;
- represent `AcceptanceOutcome`;
- represent `InvalidRequest`;
- keep service information semantics independent of HTTP, JSON and API
  composition concerns.

### TECH-ARCH-COM2-02 — Application Processing Layer

Implementation responsibility:

- realize `COMP-OP-COM2-01 — submit`;
- preserve the computational decomposition:
  - `COMP-ACT-COM2-01 — Interpret Submission`;
  - `COMP-ACT-COM2-02 — Evaluate Admission`;
  - `COMP-ACT-COM2-03 — Produce Outcome`;
- expose the abstractions required to obtain technology-specific
  interpretation without embedding concrete HTTP or JSON mechanisms into the
  computational processing semantics.

### TECH-ARCH-COM2-03 — Platform Adapter Layer

Implementation responsibility:

- provide technology mechanisms required by Application processing;
- bind submission interpretation to the selected JSON representation;
- provide the required technology-facing mechanisms without redefining
  admission semantics.

### TECH-ARCH-COM2-04 — API Boundary Layer

Implementation responsibility:

- expose the selected HTTP service boundary;
- expose `POST /send`;
- transfer an interaction submission toward Application processing;
- invoke the COM2 processing responsibility;
- map the resulting admission outcome to the selected HTTP response
  representation;
- compose the required Application and Platform responsibilities.

### TECH-ARCH-COM2-05 — Dependency Direction

The realization shall preserve the architectural separation established by
the Technology Specification.

In particular:

- Domain responsibilities shall remain independent of Application, Platform
  and API concerns;
- Application processing shall remain independent of concrete HTTP and JSON
  realization mechanisms;
- technology-specific mechanisms shall remain behind explicit integration
  responsibilities;
- API composition shall not redefine COM2 service semantics.

## 5. Technology Component Realization Responsibilities

### TECH-COMP-COM2-01 — COM2 Domain Component

Implementation responsibility:

- realize the COM2 information representations required by the Domain layer;
- preserve the Information Viewpoint semantics independently of concrete
  transport and representation mechanisms.

### TECH-COMP-COM2-02 — COM2 Application Component

Implementation responsibility:

- realize `COMP-OP-COM2-01 — submit`;
- realize the required admission-processing activities;
- preserve controlled admission evaluation;
- produce an explicit admission outcome;
- preserve accepted interaction identity;
- access technology-specific interpretation through an explicit abstraction.

### TECH-COMP-COM2-03 — COM2 JSON Platform Component

Implementation responsibility:

- realize JSON interaction interpretation;
- bind the selected JSON representation to COM2 information objects;
- support optional `meta`;
- preserve submitted identity when an `Envelope` is established;
- expose interpretation through the Application-defined technology boundary.

### TECH-COMP-COM2-04 — COM2 HTTP Boundary Component

Implementation responsibility:

- expose the selected HTTP request/response boundary;
- expose `POST /send`;
- obtain the submitted interaction representation;
- invoke COM2 Application processing;
- map the resulting admission outcome to the selected HTTP response.

## 6. Technology Binding Realization Responsibilities

### TECH-BIND-COM2-01 — HTTP Request/Response Binding

The realization shall provide HTTP request/response interaction for
`ENG-CH-COM2-01`.

HTTP remains a Technology choice and shall not redefine the Computational
contract.

### TECH-END-COM2-01 — POST /send

The realization shall expose `POST /send` as the selected transfer endpoint
for one interaction submission.

The endpoint shall transfer the submission toward COM2 processing without
introducing additional admission semantics.

### TECH-REP-COM2-01 — JSON Interaction Representation

The realization shall support the selected JSON interaction representation
containing:

- `id`;
- `kind`;
- `payload`;
- optional `meta`.

### TECH-CODEC-COM2-01 — System.Text.Json Binding

The selected Product 1 Technology profile shall provide JSON interpretation
using `System.Text.Json`.

Successful representation interpretation shall establish the information
required for COM2 admission processing.

Representation failure shall remain a rejected admission outcome.

### TECH-COR-COM2-01 — Submission–Envelope Identity Correspondence

For a submitted representation that successfully establishes an `Envelope`,
the realization shall preserve the submitted interaction identity as the
`Envelope` identity.

This responsibility realizes `INF-COR-COM2-01`.

### TECH-OUT-COM2-01 — HTTP Admission Outcome Mapping

The realization shall map the admission result to an explicit HTTP response.

Successful admission shall produce the selected successful representation
containing:

- `accepted = true`;
- accepted interaction `id`;
- `receivedAt`.

Rejected admission shall produce the selected rejection representation
containing:

- `error`;
- `message`.

## 7. Technology Constraint Realization Mapping

| Technology constraint | Required implementation preservation |
|---|---|
| `TECH-CON-COM2-01` | evaluate the required admission conditions before producing a successful outcome |
| `TECH-CON-COM2-02` | produce an explicit accepted or rejected outcome for every controlled evaluation |
| `TECH-CON-COM2-03` | preserve the submitted interaction identity in every successful outcome |
| `TECH-CON-COM2-04` | permit absent `meta` and prevent its absence alone from causing rejection |

## 8. Service Guarantee Realization Mapping

### G-COM2-01 — Controlled Interaction Admission

Required realization responsibilities:

- interpret the submitted interaction;
- evaluate the required admission conditions;
- prevent a submission that fails those conditions from producing a successful
  admission outcome.

Technology basis:

- `TECH-CON-COM2-01`
- `TECH-COMP-COM2-02`

Specification Proof Obligation:

- `SPO-COM2-01`

### G-COM2-02 — Explicit Admission Outcome

Required realization responsibilities:

- produce an explicit outcome for every controlled admission evaluation;
- map that outcome to the selected HTTP response representation.

Technology basis:

- `TECH-OUT-COM2-01`
- `TECH-CON-COM2-02`
- `TECH-COMP-COM2-02`
- `TECH-COMP-COM2-04`

Specification Proof Obligation:

- `SPO-COM2-02`

### G-COM2-03 — Interaction Identity Preservation

Required realization responsibilities:

- preserve the submitted interaction identity when establishing an
  `Envelope`;
- preserve that identity in the successful admission outcome.

Technology basis:

- `TECH-COR-COM2-01`
- `TECH-CON-COM2-03`
- `TECH-COMP-COM2-02`
- `TECH-COMP-COM2-03`

Specification Proof Obligation:

- `SPO-COM2-03`

### G-COM2-04 — Optional Interaction Information

Required realization responsibilities:

- support an interaction representation without `meta`;
- ensure that absence of `meta` alone does not cause rejection.

Technology basis:

- `TECH-REP-COM2-01`
- `TECH-CODEC-COM2-01`
- `TECH-CON-COM2-04`
- `TECH-COMP-COM2-03`

Specification Proof Obligation:

- `SPO-COM2-04`

## 9. Integrator Derivation Rule

An independent integrator may derive a realization from this Product 1
specification using any implementation structure compatible with the selected
Technology profile.

For every contract-relevant implementation responsibility, the integrator
shall be able to identify its originating Product 1 specification obligation.

The derived realization shall preserve the authoritative Service Contract and
Service Guarantees without redefining them.

Executable realization and executable qualification begin after the Product 1
boundary.

## 10. Product 1 Mapping Closure

The COM2 Product 1 construction and realization order is:

    Service Contract
        ->
    Service Guarantees
        ->
    Enterprise Specification
        ->
    Information Specification
        ->
    Computational Specification
        ->
    Engineering Specification
        ->
    Technology Specification
        ->
    Product 1 Realization Mapping
        ->
    implementation responsibilities

This ordered construction and realization path does not define a transitive
RM-ODP correspondence relation.

This mapping closes the specification-to-realization prescription required
for an integration-ready COM2 Product 1.

It does not assert that any particular executable realization has already
satisfied those responsibilities.

## 11. Authority

The COM2 Enterprise Service Contract and Service Guarantees remain
authoritative.

This realization mapping derives implementation responsibilities from the
Product 1 Technology Specification. It does not redefine the Service Contract,
Service Guarantees or upstream RM-ODP specifications.
