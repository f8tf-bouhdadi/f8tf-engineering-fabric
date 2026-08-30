# RM-ODP — Technology Viewpoint (COM1-ES)

## Status

This document defines the reference Technology Viewpoint realization of:

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

It realizes the COM1 Engineering Viewpoint using the selected V1 technology
profile.

Technology choices shall realize, and shall not redefine, the COM1
Computational contracts, Engineering boundary, capsules, interfaces, bindings,
channels and invariants.

Alternative technology profiles remain admissible when they preserve the same
upstream COM1 specifications and Service Guarantees.

---

## Technology Objective

Provide a concrete reference realization of the COM1 Engineering specification
using a bounded length-prefixed message interaction over a TCP byte-stream
transport and a .NET 8 runtime.

The current technology profile shall preserve:

- bounded admission;
- complete message reconstruction;
- response eligibility;
- failure isolation between client interactions.

---

## Technology Profile

### TECH-PROF-01 — .NET 8 TCP Length-Prefixed Interaction Profile

The selected COM1 V1 reference technology profile uses:

- .NET 8;
- TCP byte-stream transport;
- one listening service endpoint;
- one connection context per client interaction;
- a 4-byte signed big-endian message-length field;
- a supported V1 payload bound of 65536 bytes;
- exact payload reconstruction according to the declared length;
- framed response emission;
- asynchronous per-client interaction processing.

The default reference endpoint is:

`127.0.0.1:5002`

The runtime permits host and port configuration through the declared COM1
runtime configuration mechanism.

---

## Technology Components

### TECH-COMP-01 — COM1 Domain Information Component

Provides the technology-profile representation of the framed message
information required by the runtime.

Responsibilities:

- represent one reconstructed message payload;
- preserve payload bytes presented to the application layer;
- remain independent of TCP connection management.

### TECH-COMP-02 — COM1 Application Interaction Component

Provides the technology-profile application abstractions required to express:

- framed interaction policy;
- admissible payload-length evaluation;
- technology-profile interaction port semantics.

Responsibilities:

- expose the supported framing policy;
- expose the runtime interaction abstraction used by the Platform component;
- remain independent of concrete listener lifecycle management.

### TECH-COMP-03 — COM1 TCP Framed Channel Component

Provides the TCP realization of the bounded framed-interaction channel.

Responsibilities:

- receive the fixed-size framing field;
- interpret the declared message length;
- reject lengths outside the supported V1 bound;
- reconstruct exactly the declared payload;
- emit a corresponding framed response;
- detect premature peer termination before frame completion.

### TECH-COMP-04 — COM1 Runtime Boundary Component

Provides the technology-profile service boundary.

Responsibilities:

- establish the configured listening endpoint;
- accept client connections;
- invoke the framed interaction component;
- invoke the reference application processing behaviour;
- emit the resulting framed response when admissible;
- isolate one failed client interaction from subsequent interactions.

## Technology Mechanisms

### TECH-MECH-01 — TCP Byte-Stream Transport

`ENG-CH-01` is realized using TCP.

TCP provides the byte-stream transport over which the COM1 framing mechanism is
realized.

TCP itself is not treated as preserving COM1 application-message boundaries.

### TECH-MECH-02 — Length-Prefix Framing

One message is represented at the technology boundary as:

`[4-byte signed big-endian payload length][payload bytes]`

The framing field declares the number of payload bytes belonging to the current
message.

### TECH-MECH-03 — V1 Payload Bound

The current reference technology profile uses:

`0 <= declaredLength <= 65536`

This numeric bound belongs to `TECH-PROF-01`.

It realizes the abstract supported-bound requirement defined upstream.

A different technology profile may use a different supported bound provided
that the upstream bounded-admission contract is preserved and the profile
explicitly declares that bound.

### TECH-MECH-04 — Exact Message Reconstruction

After an admissible declared length is obtained, the technology realization
continues reception until exactly the declared number of payload bytes has been
obtained.

Premature stream termination does not establish a complete message.

### TECH-MECH-05 — Framed Response Emission

A response payload admitted by the same V1 framing bound is emitted using the
same length-prefixed representation:

`[4-byte signed big-endian response length][response payload bytes]`

### TECH-MECH-06 — Per-Client Failure Isolation

Each accepted client interaction is processed independently within the current
runtime process.

Failure of the current interaction is contained so that the listening service
may continue accepting subsequent interactions.

### TECH-MECH-07 — Configurable Runtime Endpoint

The current runtime profile has the default endpoint:

`127.0.0.1:5002`

The host and port are externally configurable by the COM1 runtime configuration
mechanism.

Endpoint configuration changes Technology deployment parameters.

It does not redefine the COM1 Computational interface.

---

## Reference Application Processing

The selected reference technology profile interprets application payload
text using UTF-8 and specifies an echo-oriented response containing:

- the received payload representation;
- a server timestamp.

This application transformation is reference-profile behaviour.

It is not generalized into an additional COM1 Service Guarantee.

The authoritative V1 guarantees remain:

- `G-COM1-BOUNDED`;
- `G-COM1-COMPLETE`;
- `G-COM1-RESPONSE`;
- `G-COM1-ISOLATION`.

---

## Technology Invariants

### TECH-INV-01 — Upstream Contract Preservation

The Technology realization shall preserve:

- `COMP-IF-01`;
- `COMP-OP-01`;
- applicable Computational rules;
- applicable Engineering invariants.

### TECH-INV-02 — Bounded Admission Preservation

The TCP framing realization shall reject a declared message length outside the
V1 supported bound before treating the interaction as admitted.

### TECH-INV-03 — Complete Reconstruction Preservation

The Technology realization shall not establish a complete framed message before
all bytes declared by the framing field have been received.

### TECH-INV-04 — Response Eligibility Preservation

The Technology realization shall not emit a successful framed response before
successful reception of a complete admissible input.

### TECH-INV-05 — Interaction Failure Isolation Preservation

Failure of one client interaction shall not terminate the listening service or
prevent subsequent independent interactions from being accepted.

## Engineering–Technology Correspondence

| Engineering element | Technology realization |
|---|---|
| `ENG-BND-01` | `TECH-COMP-04`, `TECH-MECH-01`, `TECH-MECH-07` |
| `ENG-CAP-01` | `TECH-COMP-02`, `TECH-COMP-03`, `TECH-COMP-04` |
| `ENG-CLUSTER-01` | `TECH-COMP-02`, `TECH-COMP-03`, `TECH-COMP-04` |
| `ENG-BEO-01` | `TECH-COMP-02`, `TECH-COMP-04` |
| `ENG-BEO-02` | `TECH-COMP-02`, `TECH-COMP-03`, `TECH-MECH-03` |
| `ENG-BEO-03` | `TECH-COMP-03`, `TECH-MECH-04` |
| `ENG-BEO-04` | `TECH-COMP-04`, `TECH-MECH-05` |
| `ENG-BEO-05` | `TECH-COMP-04`, `TECH-MECH-06` |
| `ENG-IF-01` | `TECH-COMP-04`, `TECH-MECH-01`, `TECH-MECH-02`, `TECH-MECH-05` |
| `ENG-IF-02` | `TECH-COMP-02`, `TECH-COMP-03`, `TECH-MECH-03` |
| `ENG-IF-03` | `TECH-COMP-03`, `TECH-MECH-04` |
| `ENG-IF-04` | `TECH-COMP-04`, `TECH-MECH-05` |
| `ENG-IF-05` | `TECH-COMP-04`, `TECH-MECH-06` |
| `ENG-BIND-01` | `TECH-COMP-04`, `TECH-MECH-01` |
| `ENG-BIND-02` | `TECH-COMP-02`, `TECH-COMP-03` |
| `ENG-BIND-03` | `TECH-COMP-03`, `TECH-MECH-04` |
| `ENG-BIND-04` | `TECH-COMP-04`, `TECH-MECH-05` |
| `ENG-BIND-05` | `TECH-COMP-04`, `TECH-MECH-06` |
| `ENG-CH-01` | `TECH-MECH-01`, `TECH-MECH-02` |
| `ENG-CH-02` | in-process .NET interaction among reference runtime components |
| `ENG-INV-01` | `TECH-INV-01` |
| `ENG-INV-02` | `TECH-INV-02` |
| `ENG-INV-03` | `TECH-INV-03` |
| `ENG-INV-04` | `TECH-INV-04` |
| `ENG-INV-05` | `TECH-INV-05` |
| `ENG-INV-06` | `TECH-MECH-04` |

---

## Service Guarantee Correspondence

| Service Guarantee | Technology elements |
|---|---|
| `G-COM1-BOUNDED` | `TECH-MECH-02`, `TECH-MECH-03`, `TECH-INV-02` |
| `G-COM1-COMPLETE` | `TECH-MECH-04`, `TECH-INV-03` |
| `G-COM1-RESPONSE` | `TECH-MECH-05`, `TECH-INV-04` |
| `G-COM1-ISOLATION` | `TECH-MECH-06`, `TECH-INV-05` |

The Service Guarantees remain authoritative.

---

## Technology-to-Code Boundary

This Technology Viewpoint specifies the reference technology responsibilities
and mechanisms.

It does not itself define the source-code mapping.

The separate Technology-to-Code Mapping shall identify the concrete projects,
types, methods and configuration artifacts that realize each Technology
element.

No source-code artifact shall silently redefine an upstream COM1 specification.

---

## Technology Scope

The current COM1 V1 Technology profile includes:

- .NET 8 runtime;
- TCP byte-stream transport;
- length-prefixed framing;
- signed 32-bit big-endian length representation;
- 65536-byte supported V1 payload bound;
- exact payload reconstruction;
- framed response emission;
- configurable listening endpoint;
- per-client interaction failure isolation.
