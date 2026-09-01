# COM3 — Assured Operation Interaction Engineering Service
## LCS-04 — Information Viewpoint Specification

## Purpose

This Information Viewpoint defines the information structures and invariants
required to preserve the Service Guarantees of the Assured Operation
Interaction Engineering Service.

## Information Objects

### INF-OBJ-COM3-01 — DeclaredOperation

Represents one declared Operation.

A DeclaredOperation contains:

- `operationIdentity`;
- `operationForm`;
- `invocationSignature`;
- `declaredTerminationTypes`.

`operationForm` is exactly one of:

- `Announcement`;
- `Interrogation`.

For an Announcement, `declaredTerminationTypes` is empty.

For an Interrogation, `declaredTerminationTypes` is finite and non-empty.

### INF-OBJ-COM3-02 — InvocationSignature

Defines the declared parameters of an Operation Invocation.

### INF-OBJ-COM3-03 — TerminationType

Defines one declared termination type of an Interrogation.

A TerminationType contains:

- `terminationIdentity`;
- `terminationSignature`.

### INF-OBJ-COM3-04 — OperationInvocation

Represents one invocation occurrence.

An OperationInvocation contains:

- `invocationIdentity`;
- `concernedOperation`;
- `invocationParameters`.

### INF-OBJ-COM3-05 — OperationTermination

Represents one contractual termination occurrence of an Interrogation.

An OperationTermination contains:

- `concernedInvocation`;
- `selectedTerminationType`;
- `terminationParameters`.

## Information Invariants

### INF-INV-COM3-01 — Declared Operation Reference

Every OperationInvocation references exactly one DeclaredOperation.

### INF-INV-COM3-02 — Invocation Signature Conformance

The parameters of every OperationInvocation conform to the InvocationSignature
of its concerned DeclaredOperation.

### INF-INV-COM3-03 — Announcement Termination Set

If a DeclaredOperation has form `Announcement`, its
`declaredTerminationTypes` set is empty.

### INF-INV-COM3-04 — Interrogation Termination Set

If a DeclaredOperation has form `Interrogation`, its
`declaredTerminationTypes` set is finite and non-empty.

### INF-INV-COM3-05 — Declared Termination Membership

Every OperationTermination selects a TerminationType belonging to the
`declaredTerminationTypes` of the DeclaredOperation concerned by its
OperationInvocation.

### INF-INV-COM3-06 — Termination Signature Conformance

The parameters of every OperationTermination conform to the termination
signature of its selected TerminationType.

### INF-INV-COM3-07 — Invocation-Termination Association

Every OperationTermination references exactly one OperationInvocation.

### INF-INV-COM3-08 — Single Contractual Termination

For an Interrogation represented as completed, exactly one contractual
OperationTermination is associated with its OperationInvocation.

This invariant does not require every started Interrogation eventually to
complete.

## LCS Boundary

This document establishes the Information Viewpoint Specification required by
LCS-04.

It does not define Computational operations, Engineering mechanisms,
Technology bindings or executable realization.
