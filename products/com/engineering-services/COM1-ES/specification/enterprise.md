# RM-ODP — Enterprise Viewpoint (COM1-ES)

## Status

This document defines the Enterprise Viewpoint specification of:

**COM1-ES — Bounded Framed Message Interaction Engineering Service**

It expresses the purpose, community, roles, actions, policies and success
conditions of the service independently of its computational decomposition,
engineering realization and implementation technology.

---

## ENT-COMM-01 — Bounded Framed Interaction Community

The Bounded Framed Interaction Community is established to enable service
consumers to exchange bounded messages through a stream-oriented communication
environment while preserving explicit message boundaries and preventing
inadmissible or incomplete framed inputs from being treated as valid messages.

---

## ENT-OBJ-01 — Establish Bounded Framed Message Interaction

Enable bounded application-message interaction over a stream-oriented
transport so that message boundaries are explicit, inadmissible or incomplete
framed inputs are not treated as valid messages, and failure of one interaction
does not prevent subsequent interactions.

---

## Enterprise Roles

### ENT-ROLE-01 — Service Consumer

Initiates a framed message interaction and supplies the information required by
that interaction.

### ENT-ROLE-02 — Framed Interaction Service

Provides the bounded framed-message interaction capability and enforces the
applicable enterprise policies.

### ENT-ROLE-03 — Service Operator

Makes the Engineering Service available for use and controls its operational
lifecycle without changing the semantics of the Service Contract.

---

## ENT-BND-01 — Bounded Framed Interaction Service Boundary

The COM1-ES enterprise boundary begins when a Service Consumer submits a
candidate framed interaction to the Framed Interaction Service and ends when
that interaction produces an eligible response or terminates without affecting
the service's ability to process subsequent interactions.

Within this boundary, COM1-ES is responsible for bounded admission,
establishment of complete reception, response eligibility and isolation of an
individual interaction failure.

The boundary does not prescribe the concrete transport, encoding,
implementation technology or deployment mechanism, and does not define the
application-specific meaning or processing of the carried message payload.

---

## Enterprise Actions

### ENT-ACT-01 — Submit Framed Interaction

The Service Consumer submits a candidate framed interaction to the Framed
Interaction Service.

### ENT-ACT-02 — Admit Framed Interaction

The Framed Interaction Service determines whether the submitted interaction is
admissible under the applicable framing policy.

### ENT-ACT-03 — Complete Framed Interaction

The Framed Interaction Service establishes that the complete declared message
has been received before permitting successful processing.

### ENT-ACT-04 — Produce Interaction Response

The Framed Interaction Service produces a response only for a complete
admissible interaction whose processing succeeds.

### ENT-ACT-05 — Isolate Failed Interaction

The Framed Interaction Service prevents failure of one client interaction from
terminating its ability to process subsequent interactions.

---

## Enterprise Policies

The normative enterprise policies use the ODP policy modalities:

- **MUST** — obligation;
- **MUST NOT** — prohibition;
- **MAY** — permission.

### ENT-POL-01 — Bounded Admission

The Framed Interaction Service **MUST** admit an interaction for processing only
when its declared message extent satisfies the supported bound.

The Framed Interaction Service **MUST NOT** treat an interaction outside the
supported bound as an admitted interaction.

Corresponding Service Guarantee:

- `G-COM1-BOUNDED`

### ENT-POL-02 — Complete Reception

The Framed Interaction Service **MUST** establish complete reception of the
declared message before treating that message as complete.

The Framed Interaction Service **MUST NOT** treat prematurely terminated input
as a complete admitted message.

Corresponding Service Guarantee:

- `G-COM1-COMPLETE`

### ENT-POL-03 — Response Eligibility

The Framed Interaction Service **MUST** produce a successful interaction
response only after successful reception of a complete admissible input.

The Framed Interaction Service **MUST NOT** produce a successful response for
an incomplete or inadmissible input.

Corresponding Service Guarantee:

- `G-COM1-RESPONSE`

### ENT-POL-04 — Interaction Failure Isolation

Failure of one client interaction **MUST NOT** terminate the Framed Interaction
Service's ability to process subsequent interactions.

Corresponding Service Guarantee:

- `G-COM1-ISOLATION`

---

## Enterprise Process

### ENT-PROC-01 — Execute Bounded Framed Interaction

1. A Service Consumer submits a candidate framed interaction.
2. The Framed Interaction Service evaluates whether the interaction is
   admissible.
3. The Framed Interaction Service establishes complete reception of the
   declared message before successful processing.
4. When processing succeeds and response conditions are satisfied, the Framed
   Interaction Service produces the interaction response.
5. If the interaction fails, that failure is isolated from subsequent client
   interactions.

---

## Service Guarantee Correspondence

| Service Guarantee | Enterprise realization |
|---|---|
| `G-COM1-BOUNDED` | `ENT-ACT-02`, `ENT-POL-01` |
| `G-COM1-COMPLETE` | `ENT-ACT-03`, `ENT-POL-02` |
| `G-COM1-RESPONSE` | `ENT-ACT-04`, `ENT-POL-03` |
| `G-COM1-ISOLATION` | `ENT-ACT-05`, `ENT-POL-04` |

The Service Guarantees remain authoritative.

The Enterprise Viewpoint expresses their enterprise meaning and does not
introduce additional COM1 Service Guarantees.

---

## Enterprise Success Conditions

COM1-ES fulfils its Enterprise Objective when:

1. bounded admission is required;
2. incomplete messages are not treated as complete admitted messages;
3. successful responses require complete admissible input;
4. failure of one interaction does not prevent subsequent interactions.

---

## Viewpoint Independence

This Enterprise Viewpoint intentionally does not prescribe:

- TCP;
- sockets;
- byte order;
- framing-field width;
- UTF-8;
- endpoint addresses;
- .NET;
- classes or source-code components;
- deployment topology.

Those concerns belong to subsequent RM-ODP viewpoints or their realization
mappings.

---

## Refinement Obligation

The Information and Computational viewpoints shall refine the enterprise
concepts defined here.

Subsequent Engineering and Technology viewpoints shall define how the
computational specification is realized.

Explicit correspondence specifications shall preserve traceability between
these viewpoints and between the Technology Viewpoint and the Product 1 realization
mapping.
