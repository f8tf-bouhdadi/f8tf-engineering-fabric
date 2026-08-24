# RM-ODP — Information Viewpoint (COM1-ES)

## Status

This document defines the Information Viewpoint specification of:

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

It refines the COM1 Enterprise Viewpoint by defining the information objects,
state conditions, invariants and information dynamics required to satisfy the
COM1 Service Contract and Service Guarantees.

The Information Viewpoint remains independent of computational decomposition,
engineering mechanisms and implementation technology.

---

## Information Objective

Define the information required to represent one bounded framed-message
interaction, determine whether the interaction is admissible and complete,
represent its successful response or failure outcome, and preserve the
information conditions required by the COM1 Enterprise policies.

---

## Information Objects

### INF-OBJ-01 — Candidate Framed Interaction

Represents one framed-message interaction submitted by a Service Consumer.

Information:

- one declared message extent;
- zero or more received payload units;
- an interaction identity local to the interaction context where required.

This object does not prescribe how the declared extent is encoded or transported.

### INF-OBJ-02 — Declared Message Extent

Represents the extent declared for the message carried by one candidate framed
interaction.

Information:

- `declaredExtent : integer`

The concrete representation and encoding of this extent belong to later
viewpoints.

### INF-OBJ-03 — Message Payload

Represents the application information carried by a framed interaction.

Information:

- an ordered finite sequence of payload units;
- `receivedExtent : integer`

No concrete payload encoding is prescribed by this viewpoint.

### INF-OBJ-04 — Admission Outcome

Represents the result of evaluating whether a candidate framed interaction is
admissible.

Possible values:

- `Admitted`
- `Rejected`

### INF-OBJ-05 — Complete Admitted Message

Represents an admitted message whose complete declared payload has been
received.

It exists only when the corresponding interaction is admitted and the received
payload extent equals the declared message extent.

### INF-OBJ-06 — Interaction Response

Represents the response information associated with successful processing of a
complete admitted message.

This viewpoint does not prescribe the application transformation used to
produce the response payload.

### INF-OBJ-07 — Interaction Failure Outcome

Represents failure of one candidate interaction.

A failure outcome may result from:

- inadmissible declared message extent;
- incomplete reception;
- premature interaction termination;
- another failure preventing successful completion of that interaction.

The failure of one interaction does not redefine the state of subsequent
independent interactions.

---

## Static Schema

### INF-INIT-01 — Initial Interaction State

Before a candidate interaction is submitted:

- no candidate framed interaction is active for that interaction context;
- no message has been admitted;
- no complete admitted message exists;
- no successful interaction response exists;
- no interaction failure outcome exists;
- received payload extent is zero for a newly established interaction context.

This initial state does not require absence of other independent interactions.

---

## Information Invariants

### INF-INV-01 — Non-Negative Declared Extent

For an interaction eligible for admission:

`declaredExtent >= 0`

### INF-INV-02 — Supported Bound Preservation

An interaction is admitted only when its declared message extent satisfies the
supported COM1 bound.

The numeric value of the supported bound is not fixed by this Information
Viewpoint.

### INF-INV-03 — Received Extent Bound

For one active interaction:

`0 <= receivedExtent <= declaredExtent`

until that interaction terminates successfully or fails.

### INF-INV-04 — Complete Message Correspondence

A `Complete Admitted Message` exists only when:

- the corresponding admission outcome is `Admitted`; and
- `receivedExtent = declaredExtent`.

### INF-INV-05 — Incomplete Input Non-Completion

If:

`receivedExtent < declaredExtent`

then no `Complete Admitted Message` exists for that interaction.

### INF-INV-06 — Rejected Interaction Non-Completion

An interaction whose Admission Outcome is `Rejected` does not establish a
`Complete Admitted Message`.

### INF-INV-07 — Response Eligibility

A successful `Interaction Response` may exist only for an interaction for which
a `Complete Admitted Message` exists.

### INF-INV-08 — Failed Interaction Isolation

An `Interaction Failure Outcome` for one interaction does not invalidate the
information state of subsequent independent candidate interactions.

---

## Dynamic Schema

### INF-DYN-01 — Submit Candidate Interaction

Precondition:

- an interaction context is available for a new candidate interaction.

Input:

- one candidate framed interaction.

Postcondition:

- the candidate interaction becomes the current interaction under evaluation;
- no admission outcome is implied solely by submission;
- no successful response exists solely because submission occurred.

Corresponds to:

- `ENT-ACT-01`.

---

### INF-DYN-02 — Evaluate Admission

Precondition:

- one candidate framed interaction exists;
- its declared message extent is available for evaluation.

Postcondition — admissible case:

- `AdmissionOutcome = Admitted`.

Postcondition — inadmissible case:

- `AdmissionOutcome = Rejected`;
- no `Complete Admitted Message` is established;
- no successful `Interaction Response` is established.

Preserved invariants:

- `INF-INV-01`;
- `INF-INV-02`;
- `INF-INV-06`.

Corresponds to:

- `ENT-ACT-02`;
- `ENT-POL-01`.

---

### INF-DYN-03 — Accumulate Message Payload

Precondition:

- `AdmissionOutcome = Admitted`;
- the interaction has not failed;
- `receivedExtent < declaredExtent`.

Input:

- one or more additional payload units.

Postcondition:

- `receivedExtent' >= receivedExtent`;
- `receivedExtent' <= declaredExtent`;
- accumulated payload order is preserved.

If:

`receivedExtent' < declaredExtent`

then the interaction remains incomplete.

If:

`receivedExtent' = declaredExtent`

then the interaction becomes eligible to establish a Complete Admitted Message.

Preserved invariants:

- `INF-INV-03`;
- `INF-INV-05`.

---

### INF-DYN-04 — Establish Complete Admitted Message

Precondition:

- `AdmissionOutcome = Admitted`;
- `receivedExtent = declaredExtent`.

Postcondition:

- exactly one corresponding `Complete Admitted Message` is established for the
  interaction.

Preserved invariants:

- `INF-INV-04`;
- `INF-INV-05`;
- `INF-INV-06`.

Corresponds to:

- `ENT-ACT-03`;
- `ENT-POL-02`.

---

### INF-DYN-05 — Produce Interaction Response

Precondition:

- one `Complete Admitted Message` exists;
- application processing of that message succeeds;
- response information satisfies the applicable response conditions.

Postcondition:

- one corresponding successful `Interaction Response` is established.

Prohibited post-state:

- a successful response shall not exist for an incomplete or rejected
  interaction.

Preserved invariant:

- `INF-INV-07`.

Corresponds to:

- `ENT-ACT-04`;
- `ENT-POL-03`.

---

### INF-DYN-06 — Fail Interaction

Precondition:

- one candidate interaction exists;
- the interaction cannot successfully complete.

Postcondition:

- one `Interaction Failure Outcome` is established;
- no successful response is established as a consequence of that failure;
- subsequent independent interaction contexts remain admissible for use.

Preserved invariants:

- `INF-INV-06`;
- `INF-INV-07`;
- `INF-INV-08`.

Corresponds to:

- `ENT-ACT-05`;
- `ENT-POL-04`.

---

## Enterprise–Information Correspondence

| Enterprise element | Information realization |
|---|---|
| `ENT-ACT-01` | `INF-OBJ-01`, `INF-DYN-01` |
| `ENT-ACT-02` | `INF-OBJ-02`, `INF-OBJ-04`, `INF-DYN-02` |
| `ENT-ACT-03` | `INF-OBJ-03`, `INF-OBJ-05`, `INF-DYN-03`, `INF-DYN-04` |
| `ENT-ACT-04` | `INF-OBJ-06`, `INF-DYN-05` |
| `ENT-ACT-05` | `INF-OBJ-07`, `INF-DYN-06` |
| `ENT-POL-01` | `INF-INV-01`, `INF-INV-02`, `INF-INV-06` |
| `ENT-POL-02` | `INF-INV-03`, `INF-INV-04`, `INF-INV-05` |
| `ENT-POL-03` | `INF-INV-07`, `INF-DYN-05` |
| `ENT-POL-04` | `INF-INV-08`, `INF-DYN-06` |

---

## Service Guarantee Correspondence

| Service Guarantee | Information elements |
|---|---|
| `G-COM1-BOUNDED` | `INF-OBJ-02`, `INF-OBJ-04`, `INF-INV-01`, `INF-INV-02`, `INF-DYN-02` |
| `G-COM1-COMPLETE` | `INF-OBJ-03`, `INF-OBJ-05`, `INF-INV-03`, `INF-INV-04`, `INF-INV-05`, `INF-DYN-03`, `INF-DYN-04` |
| `G-COM1-RESPONSE` | `INF-OBJ-06`, `INF-INV-07`, `INF-DYN-05` |
| `G-COM1-ISOLATION` | `INF-OBJ-07`, `INF-INV-08`, `INF-DYN-06` |

The Service Guarantees remain authoritative.

The Information Viewpoint expresses the information conditions required to
evaluate those guarantees without prescribing their concrete realization.

---

## Information Scope

The current COM1 Information scope includes:

- candidate framed interactions;
- declared message extent;
- message payload;
- admission outcome;
- complete admitted message;
- interaction response;
- interaction failure outcome.

The Information Viewpoint does not prescribe:

- TCP;
- sockets;
- concrete frame-header width;
- byte order;
- concrete payload encoding;
- endpoint addresses;
- runtime framework;
- implementation language;
- source-code types.
