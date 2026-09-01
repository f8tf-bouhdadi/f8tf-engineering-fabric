# COM3 — Assured Operation Interaction Engineering Service Contract
## LCS-03 — Service Contract and Service Guarantees

## Service Identity

- Engineering Service: **Assured Operation Interaction Engineering Service**

## Contract Purpose

This Service Contract defines the guarantees provided for declared Operation
interactions between a Service Consumer and a Service Provider.

The contract covers both RM-ODP Operation forms:

- Announcement;
- Interrogation.

The contract preserves Operation interaction semantics without prescribing a
specific protocol, serialization format, routing mechanism or transport
technology.

## Contractual Inputs

The contract applies to a declared Operation interaction consisting of:

1. one Declared Operation;
2. one declared Operation form;
3. one Operation Invocation conforming to that Operation; and
4. for an Interrogation, a finite non-empty set of declared termination types.

## Service Guarantees

### G-COM3-01 — Declared Operation Preservation

Every realized Operation interaction shall identify and preserve one Declared
Operation.

### G-COM3-02 — Operation Form Preservation

Every realized Operation interaction shall preserve its declared Operation
form.

An Announcement shall remain an Announcement.

An Interrogation shall remain an Interrogation.

### G-COM3-03 — Invocation Conformance

Every realized Operation Invocation shall conform to the invocation obligations
of its Declared Operation.

### G-COM3-04 — Announcement Termination Independence

An Announcement shall not require a contractual Operation Termination in order
to satisfy its declared Operation semantics.

The existence of lower-level acknowledgements, transport responses or other
technical signals does not transform an Announcement into an Interrogation.

### G-COM3-05 — Declared Termination Conformance

For every Interrogation represented as completed, the established contractual
Operation Termination shall belong to the termination types declared for the
concerned Operation.

### G-COM3-06 — Invocation-Termination Association

Every contractual Operation Termination of an Interrogation shall be associated
with the Operation Invocation from which it results.

### G-COM3-07 — Single Termination Selection

Every Interrogation represented as completed shall establish exactly one
contractual Operation Termination selected from the declared termination types
of the concerned Operation.

This guarantee concerns contractual Operation semantics only.

It does not establish exactly-once network delivery, exactly-once processing or
eventual completion of every started Interrogation.

## Contract Boundary

This Service Contract does not guarantee:

- interaction admission;
- routing or dispatch;
- event notification;
- stream interaction semantics;
- protocol binding;
- serialization;
- retry or retransmission;
- timeout or deadline;
- delivery acknowledgement;
- ordering;
- authentication or authorization;
- persistence;
- exactly-once delivery;
- exactly-once processing; or
- eventual completion of every initiated interaction.

Such properties require separate Engineering Services, composed guarantees or
Technology bindings where applicable.

## Reference JSON/RPC Profile Relationship

A JSON/RPC Request/Response representation may be used as a restricted
Interrogation technology profile.

Within such a profile:

- `Request` may represent an Operation Invocation;
- `result | error` alternatives may represent profile-specific termination
  types;
- `correlationId` may provide one realization mechanism for
  Invocation-Termination Association.

Such representations do not define the generic COM3 Service Contract.

## Enterprise Traceability

| Enterprise Obligation | Service Guarantee |
|---|---|
| ENT-OBL-COM3-01 — Declared Operation | G-COM3-01 — Declared Operation Preservation |
| ENT-OBL-COM3-02 — Operation Form Preservation | G-COM3-02 — Operation Form Preservation |
| ENT-OBL-COM3-03 — Invocation Conformance | G-COM3-03 — Invocation Conformance |
| ENT-OBL-COM3-04 — Announcement Semantics | G-COM3-04 — Announcement Termination Independence |
| ENT-OBL-COM3-05 — Interrogation Termination | G-COM3-05 — Declared Termination Conformance; G-COM3-07 — Single Termination Selection |
| ENT-OBL-COM3-06 — Invocation-Termination Association | G-COM3-06 — Invocation-Termination Association |

## LCS Boundary

This document establishes the Service Contract and Service Guarantees required
by LCS-03.

The Information Viewpoint shall define the information structures and
invariants required to preserve these guarantees.

No Computational, Engineering, Technology, executable or qualification claim
is established by this document.
