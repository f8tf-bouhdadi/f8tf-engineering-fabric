# COM3 — Assured Operation Interaction Engineering Service
## LCS-06 — Engineering Viewpoint Specification

## Purpose

This Engineering Viewpoint defines the technology-independent engineering
mechanisms required to preserve the Computational obligations of the Assured
Operation Interaction Engineering Service.

The mechanisms defined here realize Computational semantics without prescribing
a concrete protocol, serialization format, runtime framework or deployment
technology.

## Engineering Components

### ENG-COMP-COM3-01 — Operation Declaration Binding

Maintains the engineering association between an Operation Invocation and the
DeclaredOperation whose semantics govern that invocation.

The binding preserves:

- Operation identity;
- Operation form;
- invocation signature reference; and
- for Interrogation, declared termination-type information.

### ENG-COMP-COM3-02 — Invocation Conformance Guard

Evaluates whether an Operation Invocation conforms to the invocation signature
of its bound DeclaredOperation before the invocation is established as
conforming.

A non-conforming invocation shall not be exposed as a valid established
Operation Invocation.

### ENG-COMP-COM3-03 — Operation Form Guard

Preserves the distinction between Announcement and Interrogation throughout
engineering processing.

The guard prevents engineering processing from changing the contractual
Operation form.

### ENG-COMP-COM3-04 — Announcement Completion Boundary

Ensures that successful establishment of an Announcement does not depend on
creation of a contractual OperationTermination.

Engineering acknowledgements or other technical signals, if present, remain
outside the contractual Announcement semantics.

### ENG-COMP-COM3-05 — Interrogation State Binding

Maintains the engineering state required to associate an established
Interrogation invocation with its possible contractual completion.

The binding preserves sufficient identity to determine the originating
OperationInvocation of a later OperationTermination.

### ENG-COMP-COM3-06 — Termination Conformance Guard

Before an OperationTermination is established as contractual, verifies that:

- the concerned Operation is an Interrogation;
- the selected TerminationType belongs to the declared termination types of
  that Operation; and
- the termination parameters conform to the signature of the selected
  TerminationType.

### ENG-COMP-COM3-07 — Invocation-Termination Binding

Preserves the association between an OperationTermination and exactly one
originating OperationInvocation.

The mechanism does not prescribe a particular correlation representation.

### ENG-COMP-COM3-08 — Single Termination Guard

Prevents establishment of a second contractual OperationTermination once an
Interrogation has already been represented as completed.

This mechanism concerns contractual completion state only.

It does not imply exactly-once network delivery or exactly-once execution.

## Engineering State

For each established Operation Invocation, the Engineering Viewpoint preserves
the minimum state necessary to establish:

- the concerned DeclaredOperation;
- the declared Operation form;
- invocation conformance;
- whether an Interrogation is still incomplete or already completed; and
- for a completed Interrogation, its single contractual
  OperationTermination.

No specific storage, memory model or persistence mechanism is prescribed.

## Engineering Failure Isolation

A failure of an engineering conformance guard shall not result in an invalid
Invocation or Termination being exposed as contractually valid.

Engineering-level technical failures shall not silently alter the declared
Operation form or termination semantics.

## Engineering Independence

This viewpoint does not prescribe:

- HTTP;
- gRPC;
- JSON;
- a correlationId field;
- sockets;
- message brokers;
- retry algorithms;
- timeout mechanisms;
- routing;
- persistence;
- authentication; or
- deployment topology.

Such choices belong to later Technology bindings or composed Engineering
Services.

## LCS Boundary

This document establishes the Engineering Viewpoint Specification required by
LCS-06.

It does not define a Technology binding or executable realization.
