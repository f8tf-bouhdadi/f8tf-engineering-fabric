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

## Engineering Capsules

### ENG-CAP-01 — Interaction Processing Capsule

Supports the engineering realization of:

- `COMP-IF-01`;
- `COMP-OP-01`.

Responsibilities:

- receive one candidate interaction;
- coordinate internal interaction processing;
- propagate either a successful response or an explicit failure outcome;
- preserve the Computational contract at the service boundary.

### ENG-CAP-02 — Admission Capsule

Realizes:

- `COMP-OBJ-02` — Admission Responsibility.

Responsibilities:

- obtain the declared message extent;
- evaluate the applicable supported bound;
- classify the candidate interaction as admitted or rejected;
- prevent rejected interactions from entering successful completion processing.

### ENG-CAP-03 — Completion Capsule

Realizes:

- `COMP-OBJ-03` — Completion Responsibility.

Responsibilities:

- accumulate message information belonging to one admitted interaction;
- preserve payload ordering;
- determine when the complete declared message has been received;
- prevent incomplete information from being exposed as a complete admitted
  message.

### ENG-CAP-04 — Response Capsule

Realizes:

- `COMP-OBJ-04` — Response Responsibility.

Responsibilities:

- receive one complete admitted message;
- invoke the applicable application processing responsibility;
- establish one successful response only when the response conditions are
  satisfied;
- propagate the response toward the service boundary.

### ENG-CAP-05 — Failure Isolation Capsule

Realizes:

- `COMP-OBJ-05` — Failure-Isolation Responsibility.

Responsibilities:

- terminate or reject the current failed interaction;
- prevent its failure state from redefining independent subsequent interaction
  state;
- preserve the ability of the service boundary to support subsequent
  interactions.

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

Connects the Interaction Processing Capsule to the Admission Capsule.

Carries the information required to evaluate:

- declared message extent;
- admission outcome.

Required properties:

- declared-extent preservation;
- bounded-admission preservation;
- explicit rejection propagation.

`ENG-IF-02` is internal.

### ENG-IF-03 — Completion Engineering Interface

Connects the Interaction Processing Capsule to the Completion Capsule.

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

Connects the Interaction Processing Capsule to the Response Capsule.

Carries:

- one Complete Admitted Message;
- one resulting Interaction Response or response failure.

Required properties:

- response-eligibility preservation;
- explicit outcome propagation.

`ENG-IF-04` is internal.

### ENG-IF-05 — Failure Isolation Engineering Interface

Supports propagation of interaction-specific failure information to the
Failure Isolation Capsule.

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

- `ENG-CAP-01`;
- `ENG-CAP-02`.

Purpose:

- transfer admission-relevant information;
- obtain the corresponding admission decision.

Required properties:

- declared-extent preservation;
- bounded-admission preservation.

### ENG-BIND-03 — Completion Binding

Connects:

- `ENG-CAP-01`;
- `ENG-CAP-03`.

Purpose:

- transfer admitted message information;
- establish complete-message state only after full declared reception.

Required properties:

- payload preservation;
- ordering preservation;
- completion preservation.

### ENG-BIND-04 — Response Binding

Connects:

- `ENG-CAP-01`;
- `ENG-CAP-04`.

Purpose:

- transfer one Complete Admitted Message;
- obtain one corresponding successful response or failure outcome.

Required properties:

- response-eligibility preservation;
- explicit outcome propagation.

### ENG-BIND-05 — Failure Isolation Binding

Connects failed interaction processing to:

- `ENG-CAP-05`.

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

- `ENG-CAP-01`;
- `ENG-CAP-02`;
- `ENG-CAP-03`;
- `ENG-CAP-04`;
- `ENG-CAP-05`.

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

## Computational–Engineering Correspondence

| Computational element | Engineering realization |
|---|---|
| `COMP-OBJ-01` | `ENG-BND-01`, `ENG-CAP-01` |
| `COMP-IF-01` | `ENG-BND-01`, `ENG-IF-01`, `ENG-BIND-01`, `ENG-CH-01` |
| `COMP-OP-01` | `ENG-CAP-01`, `ENG-BIND-01` |
| `COMP-OBJ-02` | `ENG-CAP-02`, `ENG-IF-02`, `ENG-BIND-02` |
| `COMP-OBJ-03` | `ENG-CAP-03`, `ENG-IF-03`, `ENG-BIND-03` |
| `COMP-OBJ-04` | `ENG-CAP-04`, `ENG-IF-04`, `ENG-BIND-04` |
| `COMP-OBJ-05` | `ENG-CAP-05`, `ENG-IF-05`, `ENG-BIND-05` |
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
| `G-COM1-BOUNDED` | `ENG-CAP-02`, `ENG-BIND-02`, `ENG-INV-02` |
| `G-COM1-COMPLETE` | `ENG-CAP-03`, `ENG-BIND-03`, `ENG-INV-03`, `ENG-INV-06` |
| `G-COM1-RESPONSE` | `ENG-CAP-04`, `ENG-BIND-04`, `ENG-INV-04` |
| `G-COM1-ISOLATION` | `ENG-CAP-05`, `ENG-BIND-05`, `ENG-INV-05` |

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
