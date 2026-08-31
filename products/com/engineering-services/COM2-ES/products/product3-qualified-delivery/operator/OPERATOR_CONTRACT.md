# COM2-ES Product 3 — Operator Contract

## Lifecycle Position

`LCS-11 — Operator Contract`

This contract applies to the COM2 Qualified Runtime established by Product 2.

## Operator Role

The Operator deploys and operates the delivered COM2 runtime using only the
documented Product 3 operational surface.

## Operational Responsibilities

### OC-COM2-01 — Installation

The delivery shall provide a mechanism to install the qualified COM2 runtime
into an operator-selected installation location.

### OC-COM2-02 — Configuration

The delivery shall provide an explicit configuration mechanism.

Operator configuration shall not modify the qualified runtime components.

### OC-COM2-03 — Start

The delivery shall provide a mechanism to start the qualified COM2 runtime.

### OC-COM2-04 — Operational Status

The delivery shall provide a mechanism to determine whether COM2 is running and
whether its health verification succeeds.

### OC-COM2-05 — Operational Logs

The delivery shall provide access to operational output required to inspect
startup, execution and termination conditions.

### OC-COM2-06 — Stop

The delivery shall provide a mechanism to terminate the running COM2 service.

### OC-COM2-07 — Uninstallation

The delivery shall provide a mechanism to remove the installed COM2 runtime.

## Delivered Operational Surface

The qualified delivery realizes these responsibilities through documented
operator mechanisms for:

- installation;
- configuration;
- start;
- status and health;
- log inspection;
- stop;
- uninstallation.

## Responsibility Boundary

The Operator Contract defines the required operational responsibilities.

The concrete operational mechanisms belong to the Runtime Delivery established
at LCS-12.
