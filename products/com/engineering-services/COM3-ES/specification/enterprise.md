# COM3 — Assured Operation Interaction Engineering Service
## LCS-02 — Enterprise Viewpoint Specification

## Enterprise Objective

Enable an organization to conduct declared Operation interactions across a
defined service boundary while preserving their contractual operation
semantics, including Announcement and Interrogation forms and their applicable
invocation and termination obligations.

## Enterprise Roles

### ENT-ROLE-COM3-01 — Service Consumer

The Service Consumer initiates a declared Operation interaction.

### ENT-ROLE-COM3-02 — Service Provider

The Service Provider participates in the declared Operation interaction and
fulfils the obligations associated with the declared Operation form.

## Enterprise Objects

### ENT-OBJ-COM3-01 — Declared Operation

A contractual Operation made available between a Service Consumer and a Service
Provider.

A Declared Operation identifies one Operation form:

- Announcement; or
- Interrogation.

### ENT-OBJ-COM3-02 — Operation Invocation

The contractual occurrence by which a Service Consumer invokes one Declared
Operation.

### ENT-OBJ-COM3-03 — Operation Termination

A contractual termination associated with an Interrogation.

An Operation Termination belongs to the termination types declared for the
concerned Operation.

An Announcement does not require an Operation Termination.

## Enterprise Obligations

### ENT-OBL-COM3-01 — Declared Operation

Every Operation Invocation shall concern one Declared Operation.

### ENT-OBL-COM3-02 — Operation Form Preservation

The declared Operation form shall be preserved throughout the interaction.

An Announcement shall remain an Announcement.

An Interrogation shall remain an Interrogation.

### ENT-OBL-COM3-03 — Invocation Conformance

Every Operation Invocation shall conform to the invocation obligations of its
Declared Operation.

### ENT-OBL-COM3-04 — Announcement Semantics

An Announcement shall not require a contractual Operation Termination in order
to satisfy its declared Operation semantics.

### ENT-OBL-COM3-05 — Interrogation Termination

A completed Interrogation shall establish one Operation Termination belonging
to the termination types declared for the concerned Operation.

### ENT-OBL-COM3-06 — Invocation-Termination Association

Every Operation Termination shall be associated with the Operation Invocation
from which it results.

## Enterprise Exclusions

This Enterprise Viewpoint does not define:

- interaction admission;
- routing or dispatch;
- protocol bindings;
- serialization formats;
- retry or retransmission;
- timeout or deadline guarantees;
- event notification;
- stream interaction semantics;
- authentication or authorization; or
- persistence.

These concerns may participate in composed systems but do not define the
Enterprise semantics of this Engineering Service.

## LCS Boundary

This document establishes the Enterprise Viewpoint Specification required by
LCS-02.

It does not establish the Service Guarantees of LCS-03 or any Information,
Computational, Engineering or Technology realization.
