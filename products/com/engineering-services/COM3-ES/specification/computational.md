# COM3 — Assured Operation Interaction Engineering Service
## LCS-05 — Computational Viewpoint Specification

## Purpose

This Computational Viewpoint derives the computational interactions and
obligations required to preserve the Information invariants and Service
Guarantees of the Assured Operation Interaction Engineering Service.

The specification is technology-independent.

## Computational Interface

### COMP-IF-COM3-01 — OperationInteractionService

The OperationInteractionService supports declared Operation interactions in
either Announcement or Interrogation form.

It provides the following abstract computational operations:

- `InvokeAnnouncement(operation, invocation) -> AnnouncementEstablished | InvocationRejected`
- `BeginInterrogation(operation, invocation) -> InterrogationEstablished | InvocationRejected`
- `CompleteInterrogation(invocation, termination) -> TerminationEstablished | TerminationRejected`

These operations describe contractual computational behavior.

They do not prescribe RPC, HTTP, JSON, transport or serialization mechanisms.

## Computational Objects

### COMP-OBJ-COM3-01 — OperationInteractionService

Processes declared Operation interactions while preserving their declared
Operation form and invocation/termination semantics.

### COMP-OBJ-COM3-02 — ServiceConsumer

Initiates an Operation Invocation.

### COMP-OBJ-COM3-03 — ServiceProvider

Participates in the declared Operation interaction and, for an Interrogation
represented as completed, establishes its contractual termination.

## Computational Obligations

### COMP-OBL-COM3-01 — Declared Operation Resolution

An Operation Invocation shall be processed only with respect to one
DeclaredOperation.

A computationally established invocation shall preserve the identity of that
DeclaredOperation.

### COMP-OBL-COM3-02 — Invocation Conformance

An Operation Invocation shall not be established as conforming unless its
invocation parameters conform to the InvocationSignature of its
DeclaredOperation.

### COMP-OBL-COM3-03 — Operation Form Preservation

The computational behavior shall preserve the declared Operation form.

An Announcement shall execute Announcement semantics.

An Interrogation shall execute Interrogation semantics.

### COMP-OBL-COM3-04 — Announcement Termination Independence

Successful establishment of an Announcement shall not require creation of a
contractual OperationTermination.

Any lower-level acknowledgement or technical response is outside the
contractual Operation semantics defined here.

### COMP-OBL-COM3-05 — Declared Interrogation Termination

A termination shall not be established as a valid contractual termination
unless its selected TerminationType belongs to the declaredTerminationTypes of
the DeclaredOperation concerned by the originating Interrogation.

### COMP-OBL-COM3-06 — Termination Conformance

A contractual OperationTermination shall not be established unless its
termination parameters conform to the signature of its selected
TerminationType.

### COMP-OBL-COM3-07 — Invocation-Termination Association

Every established contractual OperationTermination shall identify the
OperationInvocation to which it belongs.

### COMP-OBL-COM3-08 — Single Contractual Termination

Once an Interrogation is represented as completed, no second contractual
OperationTermination shall be established for the same OperationInvocation.

This obligation does not require every started Interrogation eventually to
complete.

## Computational Outcomes

### Announcement

A conforming Announcement may establish:

- `AnnouncementEstablished`; or
- `InvocationRejected`.

`AnnouncementEstablished` is not a contractual termination of the Operation.

### Interrogation Invocation

A conforming Interrogation invocation may establish:

- `InterrogationEstablished`; or
- `InvocationRejected`.

`InterrogationEstablished` does not itself assert completion.

### Interrogation Completion

Completion of an established Interrogation may establish:

- `TerminationEstablished`; or
- `TerminationRejected`.

A `TerminationEstablished` outcome denotes one contractual
OperationTermination satisfying the applicable termination obligations.

## Failure Isolation

A computational rejection shall not be represented as a valid Operation
Invocation or valid Operation Termination.

The precise representation of rejection is not defined by this viewpoint.

## LCS Boundary

This document establishes the Computational Viewpoint Specification required by
LCS-05.

It does not define Engineering mechanisms, Technology bindings or executable
realization.
