# COM1-ES — Product 1 Realization Mapping

## Status

This document defines the Product 1 realization mapping from the authoritative
COM1 Technology Specification to implementation responsibilities suitable for
an independent integrator.

It is part of:

**Product 1 — Engineering Service Specification**

It does not define an executable realization, executable qualification,
Qualified Runtime or Qualified Delivery.

The authoritative upstream specifications remain:

- `SERVICE.md`
- `odp/enterprise.md`
- `odp/information.md`
- `odp/computational.md`
- `odp/engineering.md`
- `odp/technology.md`

The authoritative Service Guarantees remain:

- `G-COM1-BOUNDED`
- `G-COM1-COMPLETE`
- `G-COM1-RESPONSE`
- `G-COM1-ISOLATION`

---

## Realization Mapping Principle

The Product 1 derivation relation is:

    Technology Specification
        ->
    implementation responsibility
        ->
    implementation structure

Every contract-relevant implementation responsibility shall remain traceable
to its Technology Specification origin.

An implementation may choose its internal source-code organization provided
that it preserves:

- the Service Contract;
- the authoritative Service Guarantees;
- the Information invariants;
- the Computational interface semantics and behavioural rules;
- the Engineering interfaces, bindings, channels and invariants;
- the Technology responsibilities, mechanisms and invariants.

No implementation structure may silently redefine an upstream obligation.

---

## Technology Profile Realization

### TECH-PROF-01 — .NET 8 TCP Length-Prefixed Interaction Profile

A realization of the selected COM1 Technology profile shall provide:

- .NET 8 execution;
- TCP byte-stream communication;
- signed 32-bit big-endian length-prefix framing;
- the selected V1 payload bound of `65536`;
- a configurable listening endpoint;
- exact framed-message reconstruction;
- framed response emission;
- per-client interaction failure isolation.

A conforming integrator realization may organize these responsibilities
differently while preserving the Technology Specification.

---

## Technology Component Realization Responsibilities

### TECH-COMP-01 — COM1 Domain Information Component

Implementation responsibility:

- represent one completely reconstructed payload;
- preserve the supplied payload value;
- make the completed payload available to downstream interaction processing.

Upstream correspondence:

- `INF-OBJ-03`
- `INF-OBJ-05`

Reference implementation structure:

- project responsibility: Domain;
- reference type: `FramedMessage`.

---

### TECH-COMP-02 — COM1 Application Interaction Component

Implementation responsibility:

- represent the selected supported payload bound;
- evaluate payload-length admissibility;
- expose an application-level abstraction through which framed interaction
  responsibilities can be used without redefining `COMP-IF-01`.

Reference implementation structure:

- project responsibility: Application;
- reference types:
  - `FramedInteractionPolicy`
  - `IFramedInteractionChannel`

The application abstraction is a realization construct.

It shall not replace or redefine the technology-independent Computational
interface `COMP-IF-01`.

---

### TECH-COMP-03 — COM1 TCP Framed Channel Component

Implementation responsibility:

- read the complete framing field;
- decode the declared length as a signed 32-bit big-endian integer;
- evaluate the declared length against the selected supported bound;
- read exactly the declared payload extent;
- reject premature stream termination as incomplete input;
- construct the completed-message representation only after complete
  reconstruction;
- encode and emit an admissible framed response.

Reference implementation structure:

- project responsibility: Platform;
- reference type: `TcpFramedInteractionChannel`;
- reference operations:
  - `ReceiveAsync(...)`
  - `SendAsync(...)`
  - exact-read responsibility.

---

### TECH-COMP-04 — COM1 Runtime Boundary Component

Implementation responsibility:

- obtain the configured listening endpoint;
- establish the TCP listening boundary;
- instantiate the framed-channel realization;
- accept client interactions;
- execute the receive/process/respond sequence;
- process accepted client interactions independently;
- isolate failure of one interaction from subsequent interactions.

Reference implementation structure:

- project responsibility: Runtime;
- reference entry point: `Program`.

Configuration responsibilities:

- `COM1_HOST`
- `COM1_PORT`

Reference endpoint:

- host: `127.0.0.1`
- port: `5002`

---

## Technology Mechanism Realization Responsibilities

### TECH-MECH-01 — TCP Byte-Stream Transport

The realization shall provide TCP byte-stream communication between the
external interaction environment and the framed interaction boundary.

The particular networking API is an implementation choice.

---

### TECH-MECH-02 — Length-Prefix Framing

The realization shall:

- read the framing field before payload reconstruction;
- interpret the framing field as a signed 32-bit big-endian payload length;
- emit the same framing representation for outbound framed responses.

---

### TECH-MECH-03 — V1 Payload Bound

The selected Product 1 Technology profile defines:

    0 <= declaredLength <= 65536

The realization shall apply this selected bound when deciding framing
admissibility.

The value is a Technology-profile constraint and shall not be promoted to an
upstream universal COM1 invariant.

---

### TECH-MECH-04 — Exact Message Reconstruction

The realization shall continue reception until either:

- the complete declared payload has been obtained; or
- the interaction terminates prematurely.

Premature termination shall not produce a complete admitted message.

---

### TECH-MECH-05 — Framed Response Emission

The realization shall:

- establish response eligibility;
- ensure the outbound payload is admissible;
- encode the response framing field;
- emit framing information and response payload.

---

### TECH-MECH-06 — Per-Client Failure Isolation

The realization shall contain failure associated with one client interaction
without terminating the service's ability to process subsequent independent
interactions.

---

### TECH-MECH-07 — Configurable Runtime Endpoint

The realization shall permit the listening endpoint to be selected through
configuration.

The reference realization uses:

- `COM1_HOST`
- `COM1_PORT`

The configuration mechanism shall not redefine the Computational Service
Contract.

---

## Technology Invariant Realization Mapping

| Technology invariant | Required implementation preservation |
|---|---|
| `TECH-INV-01` | preserve the upstream Service Contract and viewpoint semantics |
| `TECH-INV-02` | enforce supported-bound admission before normal payload processing |
| `TECH-INV-03` | establish exact complete reconstruction before creating a complete admitted message |
| `TECH-INV-04` | preserve receive-before-successful-response ordering |
| `TECH-INV-05` | isolate one interaction failure from subsequent independent interactions |

---

## Service Guarantee Realization Mapping

### G-COM1-BOUNDED

Required realization responsibilities:

- decode the declared extent explicitly;
- evaluate it against the selected supported bound;
- prevent inadmissible framed input from entering normal message processing.

Technology basis:

- `TECH-MECH-02`
- `TECH-MECH-03`
- `TECH-INV-02`

---

### G-COM1-COMPLETE

Required realization responsibilities:

- accumulate payload data until the complete declared extent has been obtained;
- prevent prematurely terminated input from becoming a complete admitted
  message.

Technology basis:

- `TECH-MECH-04`
- `TECH-INV-03`

---

### G-COM1-RESPONSE

Required realization responsibilities:

- establish complete admissible input before successful response production;
- preserve receive-before-process-before-response ordering.

Technology basis:

- `TECH-MECH-05`
- `TECH-INV-04`

---

### G-COM1-ISOLATION

Required realization responsibilities:

- contain failure within the affected interaction;
- preserve the service's ability to accept and process subsequent independent
  interactions.

Technology basis:

- `TECH-MECH-06`
- `TECH-INV-05`

---

## Integrator Derivation Rule

An independent integrator may derive a realization from this Product 1
specification using any implementation structure compatible with the selected
Technology profile.

For every contract-relevant implementation responsibility, the integrator
shall be able to identify its originating Product 1 specification obligation.

The derived realization shall preserve the authoritative Service Guarantees
without redefining them.

Executable realization and executable qualification begin after the Product 1
boundary.

---

## Product 1 Mapping Closure

The COM1 Product 1 realization chain is:

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

This mapping closes the specification-to-realization prescription required for
an implementation-ready COM1 Product 1.

It does not assert that any particular executable realization has already
satisfied those responsibilities.
