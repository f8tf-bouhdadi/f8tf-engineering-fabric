# RM-ODP — Computational Viewpoint (COM1-ES)

## Status

This document defines the Computational Viewpoint specification of:

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

It refines the COM1 Information Viewpoint by defining the
technology-independent computational objects, offered interface, operation,
interaction outcomes and behavioural rules required to realize the COM1
Service Contract and Service Guarantees.

The Computational Viewpoint does not prescribe transport protocol, runtime
framework, encoding, deployment topology or implementation language.

---

## Computational Objective

Provide one technology-independent computational interaction through which a
Service Consumer may submit a candidate framed interaction and obtain either:

- one successful Interaction Response; or
- one explicit Interaction Failure Outcome.

The operation shall preserve the Information contracts governing bounded
admission, complete reception, response eligibility and interaction-failure
isolation.

---

## Computational Objects

### COMP-OBJ-01 — COM1 Framed Interaction Service Object

Provides the externally offered bounded framed-interaction capability.

Its offered service scope exposes one operational interface.

### COMP-OBJ-02 — Admission Responsibility

Evaluates whether the declared message extent of a submitted interaction is
admissible.

This is an internal computational responsibility.

It is not an additional offered interface.

### COMP-OBJ-03 — Completion Responsibility

Determines whether the complete declared message has been received.

This is an internal computational responsibility.

It is not an additional offered interface.

### COMP-OBJ-04 — Response Responsibility

Establishes the successful interaction response only after the applicable
completion and response conditions are satisfied.

This is an internal computational responsibility.

It is not an additional offered interface.

### COMP-OBJ-05 — Failure-Isolation Responsibility

Terminates or rejects a failed interaction without invalidating the service's
ability to process subsequent independent interactions.

This is an internal computational responsibility.

It is not an additional offered interface.

---

## Offered Computational Interface

### COMP-IF-01 — Bounded Framed Interaction Interface

The Bounded Framed Interaction Interface provides the operational COM1 service
interaction.

Offered operation:

`COMP-OP-01 — submitInteraction(CandidateFramedInteraction) -> InteractionResponse | InteractionFailureOutcome`

The operation is technology-independent.

It does not prescribe:

- transport protocol;
- framing-field representation;
- byte order;
- payload encoding;
- endpoint representation;
- implementation language.

---

## Computational Information Types

### CandidateFramedInteraction

Corresponds to:

- `INF-OBJ-01` — Candidate Framed Interaction;
- `INF-OBJ-02` — Declared Message Extent;
- `INF-OBJ-03` — Message Payload.

### InteractionResponse

Corresponds to:

- `INF-OBJ-06` — Interaction Response.

### InteractionFailureOutcome

Corresponds to:

- `INF-OBJ-07` — Interaction Failure Outcome.

Admission and completion state correspond to Information objects and
conditions but are not exposed as additional client operations.

---

## COMP-OP-01 — submitInteraction

### Precondition

The invocation begins from an interaction context consistent with
`INF-INIT-01`.

A candidate framed interaction is supplied with sufficient information to
evaluate its declared message extent.

### Behaviour

For one submitted candidate interaction, the COM1 service shall:

1. evaluate admission under the supported bound;
2. reject an inadmissible interaction;
3. for an admitted interaction, accumulate the declared message information;
4. establish completion only when the full declared message has been received;
5. prevent incomplete input from becoming a complete admitted message;
6. permit successful response production only after complete admissible input;
7. return the corresponding successful response when response production
   succeeds;
8. otherwise produce or propagate an Interaction Failure Outcome;
9. preserve the ability to process subsequent independent interactions after
   failure of the current interaction.

### Successful Postcondition

A successful `InteractionResponse` exists only if:

- the submitted interaction was admitted;
- a Complete Admitted Message was established;
- response production succeeded.

### Failure Postcondition

When the current interaction fails:

- no successful response is attributed to an incomplete or inadmissible
  interaction;
- the failure is confined to the current interaction;
- subsequent independent interactions remain processable.

---

## Computational Rules

### COMP-RULE-01 — Information Contract Preservation

`COMP-OP-01` shall preserve the COM1 Information objects, invariants and dynamic
conditions applicable to the operational interaction.

### COMP-RULE-02 — Bounded Admission Preservation

An interaction outside the supported message-extent bound shall not be
processed as an admitted interaction.

Corresponds to:

- `INF-INV-01`;
- `INF-INV-02`;
- `INF-DYN-02`;
- `G-COM1-BOUNDED`.

### COMP-RULE-03 — Complete Reception Preservation

A submitted interaction shall not establish a complete admitted message until
its complete declared message has been received.

Corresponds to:

- `INF-INV-03`;
- `INF-INV-04`;
- `INF-INV-05`;
- `INF-DYN-03`;
- `INF-DYN-04`;
- `G-COM1-COMPLETE`.

### COMP-RULE-04 — Response Eligibility Preservation

A successful response shall not be produced for an incomplete or inadmissible
interaction.

Corresponds to:

- `INF-INV-07`;
- `INF-DYN-05`;
- `G-COM1-RESPONSE`.

### COMP-RULE-05 — Interaction Failure Isolation

Failure of one interaction shall not prevent the service object from accepting
and processing subsequent independent interactions.

Corresponds to:

- `INF-INV-08`;
- `INF-DYN-06`;
- `G-COM1-ISOLATION`.

### COMP-RULE-06 — Explicit Outcome

One completed invocation of `COMP-OP-01` shall result in either:

- one successful `InteractionResponse`; or
- one `InteractionFailureOutcome`.

A failure outcome is not a successful service response.

### COMP-RULE-07 — No Technology Assumption

The offered computational interface shall remain independent of:

- concrete transport;
- connection mechanism;
- frame-header representation;
- framing-field width;
- byte order;
- payload character encoding;
- runtime framework;
- operating-system conventions;
- implementation language.

---

## Internal Computational Interaction

The internal logical responsibility sequence for one invocation is:

`COMP-IF-01`
→ `COMP-OBJ-02` Admission Responsibility
→ `COMP-OBJ-03` Completion Responsibility
→ `COMP-OBJ-04` Response Responsibility

On interaction failure:

`COMP-OBJ-05` Failure-Isolation Responsibility

preserves availability for subsequent independent interactions.

These internal responsibilities may be decomposed differently by an admissible
Engineering realization provided that the offered Computational contract is
preserved.

---

## Information–Computational Correspondence

| Information element | Computational realization |
|---|---|
| `INF-OBJ-01` | `COMP-IF-01`, `COMP-OP-01`, `CandidateFramedInteraction` |
| `INF-OBJ-02` | `COMP-OBJ-02`, `COMP-RULE-02` |
| `INF-OBJ-03` | `COMP-OP-01`, `COMP-OBJ-03` |
| `INF-OBJ-04` | `COMP-OBJ-02`, `COMP-RULE-02` |
| `INF-OBJ-05` | `COMP-OBJ-03`, `COMP-RULE-03` |
| `INF-OBJ-06` | `COMP-IF-01`, `COMP-OP-01`, `InteractionResponse` |
| `INF-OBJ-07` | `COMP-IF-01`, `COMP-OP-01`, `InteractionFailureOutcome`, `COMP-OBJ-05` |
| `INF-INIT-01` | initial interaction context assumed by `COMP-OP-01` before processing one submitted interaction |
| `INF-DYN-01` | invocation and submission phase of `COMP-OP-01` |
| `INF-DYN-02` | `COMP-OBJ-02`, `COMP-RULE-02` |
| `INF-DYN-03` | `COMP-OBJ-03`, `COMP-RULE-03` |
| `INF-DYN-04` | `COMP-OBJ-03`, `COMP-RULE-03` |
| `INF-DYN-05` | `COMP-OBJ-04`, `COMP-RULE-04` |
| `INF-DYN-06` | `COMP-OBJ-05`, `COMP-RULE-05` |
| `INF-INV-01` | `COMP-RULE-02` |
| `INF-INV-02` | `COMP-RULE-02` |
| `INF-INV-03` | `COMP-RULE-03` |
| `INF-INV-04` | `COMP-RULE-03` |
| `INF-INV-05` | `COMP-RULE-03` |
| `INF-INV-06` | `COMP-RULE-02`, `COMP-RULE-06` |
| `INF-INV-07` | `COMP-RULE-04` |
| `INF-INV-08` | `COMP-RULE-05` |

---

## Enterprise Structural Correspondence

Not every Enterprise element becomes an Information object or an offered
Computational operation.

The following correspondence preserves the Enterprise structure without
collapsing RM-ODP viewpoint semantics:

| Enterprise element | Computational correspondence |
|---|---|
| `ENT-COMM-01` | community whose operational service is represented by `COMP-OBJ-01` and `COMP-IF-01` |
| `ENT-OBJ-01` | realized operationally by `COMP-IF-01`, `COMP-OP-01` and `COMP-RULE-02` through `COMP-RULE-05` |
| `ENT-ROLE-01` | external invoker of `COMP-IF-01` / `COMP-OP-01` |
| `ENT-ROLE-02` | `COMP-OBJ-01` — COM1 Framed Interaction Service Object |
| `ENT-ROLE-03` | enterprise operational role; does not define an additional Computational operation |
| `ENT-PROC-01` | realized by one invocation of `COMP-OP-01` and its internal responsibility sequence |

Enterprise roles remain Enterprise concepts.

Their correspondence to Computational entities does not redefine them as
Computational objects.

---

## Enterprise Action Correspondence

| Enterprise action | Computational realization |
|---|---|
| `ENT-ACT-01` — Submit Framed Interaction | `COMP-IF-01`, `COMP-OP-01` |
| `ENT-ACT-02` — Admit Framed Interaction | `COMP-OBJ-02`, `COMP-RULE-02` |
| `ENT-ACT-03` — Complete Framed Interaction | `COMP-OBJ-03`, `COMP-RULE-03` |
| `ENT-ACT-04` — Produce Interaction Response | `COMP-OBJ-04`, `COMP-RULE-04` |
| `ENT-ACT-05` — Isolate Failed Interaction | `COMP-OBJ-05`, `COMP-RULE-05` |

---

## Service Guarantee Correspondence

| Service Guarantee | Computational elements |
|---|---|
| `G-COM1-BOUNDED` | `COMP-OP-01`, `COMP-OBJ-02`, `COMP-RULE-02` |
| `G-COM1-COMPLETE` | `COMP-OP-01`, `COMP-OBJ-03`, `COMP-RULE-03` |
| `G-COM1-RESPONSE` | `COMP-OP-01`, `COMP-OBJ-04`, `COMP-RULE-04` |
| `G-COM1-ISOLATION` | `COMP-OBJ-05`, `COMP-RULE-05` |

The Service Guarantees remain authoritative.

The Computational Viewpoint defines the technology-independent operational
interaction and logical responsibilities required to realize those guarantees.

---

## Computational Scope

The offered COM1 Computational service consists of:

- one service object;
- one offered operational interface;
- one offered interaction operation;
- explicit success or failure outcome;
- bounded admission;
- complete-message preservation;
- response eligibility preservation;
- interaction-failure isolation.

The following are not additional offered Computational operations:

- installation;
- start;
- stop;
- status;
- log inspection;
- runtime configuration;
- packaging;
- evidence persistence.

Those concerns are outside the offered Computational interface.
