# RM-ODP — Engineering Viewpoint (COM1-ES)

## Status

This document defines the Engineering Viewpoint specification of:

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

It specifies the technology-independent engineering arrangements required to
realize the COM1 Computational Viewpoint while preserving the declared Service
Guarantees.

The Engineering Viewpoint does not prescribe concrete transport protocols,
runtime frameworks, byte representations, endpoint technologies or
implementation languages.

---

## Engineering Objective

Realize the offered Computational interaction:

`COMP-IF-01 — Bounded Framed Interaction Interface`

and its operation:

`COMP-OP-01 — submitInteraction`

through an engineering structure that preserves:

- bounded admission;
- complete-message reception;
- response eligibility;
- interaction-failure isolation.

---

## Engineering Service Boundary

### ENG-BND-01 — COM1 Engineering Service Boundary

The COM1 Engineering Service Boundary realizes the externally visible
Computational interface:

- `COMP-IF-01`.

The boundary supports the offered operation:

- `COMP-OP-01`.

The boundary separates:

- the externally visible bounded interaction;
- internal admission and completion responsibilities;
- response-production responsibility;
- interaction-failure isolation responsibility;
- technology-specific realization mechanisms.

No additional COM1 operational service operation is introduced by this
boundary.

---

## Engineering Capsule

### ENG-CAP-01 — COM1 Interaction Processing Capsule

The COM1 Engineering Capsule provides the enclosing technology-independent
Engineering context for the COM1 interaction-processing structure.

It supports:

- `COMP-OBJ-01` through `COMP-OBJ-05`;
- `COMP-IF-01`;
- `COMP-OP-01`.

The capsule contains:

- `ENG-CLUSTER-01`.

It preserves the Engineering Service Boundary and the declared Service
Guarantees.

It does not prescribe a process, runtime, deployment unit or concrete
communication technology.

---

## Engineering Cluster

### ENG-CLUSTER-01 — COM1 Interaction Processing Cluster

The COM1 Interaction Processing Cluster groups the Basic Engineering Objects
that jointly support one bounded framed interaction.

It contains:

- `ENG-BEO-01`;
- `ENG-BEO-02`;
- `ENG-BEO-03`;
- `ENG-BEO-04`;
- `ENG-BEO-05`.

It is contained within:

- `ENG-CAP-01`.

The Engineering Viewpoint does not prescribe whether the cluster is realized
in one process or across several processes.

---

## Basic Engineering Objects

The following Basic Engineering Objects provide the explicit RM-ODP
Engineering structures supporting the non-binding Computational objects.

For COM1, each Basic Engineering Object belongs to `ENG-CLUSTER-01`.

`ENG-CLUSTER-01` is contained within `ENG-CAP-01`.

The Basic Engineering Objects provide the Engineering objects used for the
Computational–Engineering object correspondence.

### ENG-BEO-01 — Interaction Processing Basic Engineering Object

Contained in:

- `ENG-CLUSTER-01`.

Corresponds to:

- `COMP-OBJ-01`.

Responsibilities:

- support the externally offered Computational interaction;
- coordinate the Engineering interactions required for one invocation;
- preserve the Computational contract and explicit outcome semantics.

### ENG-BEO-02 — Admission Basic Engineering Object

Contained in:

- `ENG-CLUSTER-01`.

Corresponds to:

- `COMP-OBJ-02`.

Responsibilities:

- evaluate declared extent against the supported bound;
- establish admission or rejection;
- prevent rejected interaction state from entering successful completion.

### ENG-BEO-03 — Completion Basic Engineering Object

Contained in:

- `ENG-CLUSTER-01`.

Corresponds to:

- `COMP-OBJ-03`.

Responsibilities:

- accumulate admitted interaction information;
- preserve required ordering;
- establish completion only after complete declared reception.

### ENG-BEO-04 — Response Basic Engineering Object

Contained in:

- `ENG-CLUSTER-01`.

Corresponds to:

- `COMP-OBJ-04`.

Responsibilities:

- accept one complete admitted message;
- support response production;
- propagate success only when response eligibility conditions hold.

### ENG-BEO-05 — Failure Isolation Basic Engineering Object

Contained in:

- `ENG-CLUSTER-01`.

Corresponds to:

- `COMP-OBJ-05`.

Responsibilities:

- contain interaction-specific failure;
- terminate or reject the affected interaction;
- preserve subsequent independent interaction capability.

---

## Engineering Interfaces

### ENG-IF-01 — External Interaction Engineering Interface

Supports:

- `COMP-IF-01`;
- `COMP-OP-01`.

Carries the engineering information required for:

- one Candidate Framed Interaction;
- one successful Interaction Response; or
- one Interaction Failure Outcome.

Required properties:

- Computational contract preservation;
- explicit outcome propagation;
- no introduction of additional COM1 operational operations.

### ENG-IF-02 — Admission Engineering Interface

Connects `ENG-BEO-01` to `ENG-BEO-02` within `ENG-CLUSTER-01`.

Carries the information required to evaluate:

- declared message extent;
- admission outcome.

Required properties:

- declared-extent preservation;
- bounded-admission preservation;
- explicit rejection propagation.

`ENG-IF-02` is internal.

### ENG-IF-03 — Completion Engineering Interface

Connects `ENG-BEO-01` to `ENG-BEO-03` within `ENG-CLUSTER-01`.

Carries the information required to establish:

- accumulated message payload;
- received message extent;
- complete admitted message state.

Required properties:

- payload-order preservation;
- received-extent preservation;
- complete-message correspondence.

`ENG-IF-03` is internal.

### ENG-IF-04 — Response Engineering Interface

Connects `ENG-BEO-01` to `ENG-BEO-04` within `ENG-CLUSTER-01`.

Carries:

- one Complete Admitted Message;
- one resulting Interaction Response or response failure.

Required properties:

- response-eligibility preservation;
- explicit outcome propagation.

`ENG-IF-04` is internal.

### ENG-IF-05 — Failure Isolation Engineering Interface

Supports propagation of interaction-specific failure information to the
`ENG-BEO-05`.

Required properties:

- failed-interaction identification within the current interaction context;
- isolation from subsequent independent interactions;
- preservation of service-boundary availability.

`ENG-IF-05` is internal.

---

## Engineering Bindings

### ENG-BIND-01 — Invocation Binding

Connects:

- the invoking environment;
- `ENG-BND-01`;
- `ENG-CAP-01`.

Purpose:

- transfer one candidate interaction to COM1;
- initiate one `COMP-OP-01` execution;
- propagate its explicit outcome.

Required properties:

- invocation preservation;
- Computational contract preservation;
- explicit success/failure propagation.

### ENG-BIND-02 — Admission Binding

Connects:

- `ENG-BEO-01`;
- `ENG-BEO-02`.

Purpose:

- transfer admission-relevant information;
- obtain the corresponding admission decision.

Required properties:

- declared-extent preservation;
- bounded-admission preservation.

### ENG-BIND-03 — Completion Binding

Connects:

- `ENG-BEO-01`;
- `ENG-BEO-03`.

Purpose:

- transfer admitted message information;
- establish complete-message state only after full declared reception.

Required properties:

- payload preservation;
- ordering preservation;
- completion preservation.

### ENG-BIND-04 — Response Binding

Connects:

- `ENG-BEO-01`;
- `ENG-BEO-04`.

Purpose:

- transfer one Complete Admitted Message;
- obtain one corresponding successful response or failure outcome.

Required properties:

- response-eligibility preservation;
- explicit outcome propagation.

### ENG-BIND-05 — Failure Isolation Binding

Connects failed interaction processing to:

- `ENG-BEO-05` within `ENG-CLUSTER-01`.

Purpose:

- terminate the current failed interaction;
- preserve subsequent independent interaction capability.

Required property:

- interaction-failure isolation.

---

## Engineering Channels

### ENG-CH-01 — Service Interaction Channel

Supports interaction between the invoking environment and:

- `ENG-BND-01`.

Required properties:

- interaction-order preservation within one interaction;
- transfer of candidate interaction information;
- explicit outcome propagation;
- preservation of `COMP-IF-01` and `COMP-OP-01`.

The Technology Viewpoint determines the concrete communication mechanism.

### ENG-CH-02 — Internal Interaction Processing Channel

Supports the internal engineering interactions among:

- `ENG-BEO-01`;
- `ENG-BEO-02`;
- `ENG-BEO-03`;
- `ENG-BEO-04`;
- `ENG-BEO-05`;

within `ENG-CLUSTER-01`.

The Engineering Viewpoint does not prescribe whether these responsibilities are
realized:

- in one process;
- across several processes;
- synchronously;
- asynchronously;
- through any particular communication technology.

Any admissible realization shall preserve the Computational contract.

---

## Engineering Invariants

### ENG-INV-01 — Computational Contract Preservation

The Engineering realization shall preserve:

- `COMP-IF-01`;
- `COMP-OP-01`;
- all applicable Computational information types;
- explicit success/failure outcome semantics.

No additional operational COM1 service operation shall be introduced.

### ENG-INV-02 — Bounded Admission Preservation

An interaction rejected by the supported bound shall not enter successful
completion processing.

### ENG-INV-03 — Complete Reception Preservation

A complete admitted message shall not be established until all declared message
information has been received.

### ENG-INV-04 — Response Eligibility Preservation

A successful response shall not be propagated unless a Complete Admitted Message
has been established and response production succeeds.

### ENG-INV-05 — Failure Isolation Preservation

Failure of one interaction shall not terminate the Engineering Service Boundary
or prevent processing of subsequent independent interactions.

### ENG-INV-06 — Information Ordering Preservation

The Engineering realization shall preserve the ordering of message information
within one interaction where that ordering is required by the Information
contract.

## Enterprise–Engineering Correspondence

There are no additional COM1 Engineering structures introduced solely to
represent Enterprise concepts.

The following correspondence statements identify the Engineering support
provided for the applicable Enterprise specification.

### Enterprise Interaction Correspondence

| Enterprise element | Engineering support |
|---|---|
| `ENT-INTER-01` | `ENG-IF-01`, `ENG-BIND-01`, `ENG-CH-01`, supported within `ENG-BND-01` and `ENG-CAP-01` |

`ENT-INTER-01` applies to every COM1 bounded framed interaction.

The service-side Engineering support for that interaction is provided by
`ENG-CAP-01`, containing `ENG-CLUSTER-01` and its Basic Engineering Objects.

COM1 does not prescribe an Engineering node or nucleus for this support.

COM1 does not independently specify a distinct Engineering stub, binder,
protocol object or interceptor for `ENT-INTER-01`.

Those concepts shall not be inferred merely from the existence of
`ENG-BIND-01` or `ENG-CH-01`.

---

## Computational–Engineering Correspondence

### Computational Object Correspondence

| Computational object | Basic Engineering Object | Supporting Engineering structure |
|---|---|---|
| `COMP-OBJ-01` | `ENG-BEO-01` | `ENG-BND-01`, `ENG-CLUSTER-01`, `ENG-CAP-01` |
| `COMP-OBJ-02` | `ENG-BEO-02` | `ENG-CLUSTER-01`, `ENG-IF-02`, `ENG-BIND-02`, `ENG-CAP-01` |
| `COMP-OBJ-03` | `ENG-BEO-03` | `ENG-CLUSTER-01`, `ENG-IF-03`, `ENG-BIND-03`, `ENG-CAP-01` |
| `COMP-OBJ-04` | `ENG-BEO-04` | `ENG-CLUSTER-01`, `ENG-IF-04`, `ENG-BIND-04`, `ENG-CAP-01` |
| `COMP-OBJ-05` | `ENG-BEO-05` | `ENG-CLUSTER-01`, `ENG-IF-05`, `ENG-BIND-05`, `ENG-CAP-01` |

### Computational Interface and Operation Correspondence

| Computational element | Engineering correspondence |
|---|---|
| `COMP-IF-01` | `ENG-IF-01`, supported by `ENG-BND-01`, `ENG-BIND-01`, `ENG-CH-01` |
| `COMP-OP-01` | interaction initiated through `ENG-IF-01` and `ENG-BIND-01`, coordinated by `ENG-BEO-01` |

The interaction corresponding to one execution of `COMP-OP-01` is supported by
an Engineering interaction chain beginning at `ENG-IF-01` / `ENG-BIND-01`,
passing through the applicable internal Engineering interfaces and bindings,
and terminating in either successful response propagation or explicit
interaction-failure propagation.

`ENG-CH-01` supports the service-boundary portion of that interaction chain.

`ENG-CH-02` supports the internal Engineering interactions among the Basic
Engineering Objects within `ENG-CLUSTER-01`, contained in `ENG-CAP-01`.

The Technology Viewpoint selects the concrete mechanisms that realize these
channels and interactions.

COM1 does not introduce a separate Computational binding object in its current
Computational Specification. Therefore no correspondence to an independently
identified Computational binding object is asserted here.

### Computational Rule Correspondence

| Computational rule | Engineering correspondence |
|---|---|
| `COMP-RULE-01` | `ENG-INV-01` |
| `COMP-RULE-02` | `ENG-INV-02` |
| `COMP-RULE-03` | `ENG-INV-03` |
| `COMP-RULE-04` | `ENG-INV-04` |
| `COMP-RULE-05` | `ENG-INV-05` |
| `COMP-RULE-06` | `ENG-INV-01`, `ENG-IF-01` |
| `COMP-RULE-07` | Engineering–Technology separation |

---

## Service Guarantee Correspondence

| Service Guarantee | Engineering elements |
|---|---|
| `G-COM1-BOUNDED` | `ENG-BEO-02`, `ENG-BIND-02`, `ENG-INV-02` |
| `G-COM1-COMPLETE` | `ENG-BEO-03`, `ENG-BIND-03`, `ENG-INV-03`, `ENG-INV-06` |
| `G-COM1-RESPONSE` | `ENG-BEO-04`, `ENG-BIND-04`, `ENG-INV-04` |
| `G-COM1-ISOLATION` | `ENG-BEO-05`, `ENG-BIND-05`, `ENG-INV-05` |

The Service Guarantees remain authoritative.

---

## Engineering–Technology Separation

This Engineering Viewpoint intentionally does not prescribe:

- TCP;
- sockets;
- connection endpoints;
- frame-header width;
- integer representation;
- byte order;
- concrete payload encoding;
- .NET;
- operating-system process model;
- source-code classes.

Those concerns belong to the Technology Viewpoint and Technology-to-Code
Mapping.

---

## Engineering Scope

The COM1 Engineering scope includes:

- one Engineering Service Boundary;
- one interaction-processing responsibility;
- bounded-admission responsibility;
- complete-reception responsibility;
- response responsibility;
- failure-isolation responsibility;
- technology-independent interfaces, bindings and channels preserving the
  Computational contract.
