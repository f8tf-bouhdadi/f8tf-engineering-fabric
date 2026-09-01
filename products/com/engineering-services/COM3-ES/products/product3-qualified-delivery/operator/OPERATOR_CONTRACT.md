# COM3 Product 3 — Operator Contract

## Lifecycle Position

`LCS-11 — Operator Contract`

The Operator Contract defines the documented operational responsibilities
for the exact COM3 Qualified Runtime established by Product 2.

It does not modify the Qualified Runtime and does not introduce a new COM3
Service Guarantee.

## Operator Responsibilities

The Operator shall be able to:

- install the delivered COM3 Qualified Runtime;
- provide the documented runtime configuration;
- start the runtime;
- determine runtime status;
- access documented runtime logs;
- stop the runtime;
- uninstall the runtime.

These responsibilities define the operational surface required for Product 3.

## Runtime Preservation

The Operator Contract applies to the exact Product 2 Qualified Runtime.

Qualified Runtime Identity:

`ca46316d0ae42311bdafe67a315ff609a72ee7234d859631beef4400b4e53c79`

Operator mechanisms shall not rebuild, replace or modify that qualified
executable realization.

## Role Boundary

The Operator role is distinct from the COM3 Service Consumer role.

Operating the delivered runtime does not create a new COM3 Operation and does
not redefine the COM3 Service Contract.

## Product 3 Continuation

The Operator Contract establishes the operational responsibility boundary used
by the subsequent Product 3 lifecycle stages:

`LCS-12 Runtime Delivery → LCS-13 Delivery Verification → LCS-14 Qualified Delivery Identity → LCS-15 Sealed Delivery → LCS-16 Independent Client Verification and Operation`
