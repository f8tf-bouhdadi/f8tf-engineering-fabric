# COM1 Runtime Delivery

## Purpose

COM1 Runtime Delivery provides an executable bounded framed-interaction runtime
for COM1-ES.

It provides:

- TCP framed-message interaction;
- 4-byte signed big-endian length prefix;
- bounded payload acceptance;
- complete-frame reconstruction;
- framed response production;
- client interaction failure isolation;
- an operator lifecycle for installation, operation, inspection and uninstallation.

## Requirements

- .NET 8 Runtime;
- Bash;
- Python 3;
- tar;
- sha256sum.

## Delivery Structure

F8TF_COM1_RUNTIME_DELIVERY/
- runtime/
- config/
- integration/
- state/
- logs/
- INSTALL_COM1.sh
- START_COM1.sh
- VERIFY_RUNTIME.sh
- INTERACT_COM1.sh
- STATUS_COM1.sh
- LOGS_COM1.sh
- STOP_COM1.sh
- UNINSTALL_COM1.sh
- README_OPERATOR.md
- VERSION.txt

## Default Endpoint

127.0.0.1:5002

## Install COM1

bash ./INSTALL_COM1.sh /absolute/path/com1-installation

## Start COM1

bash ./START_COM1.sh

## Verify COM1

bash ./VERIFY_RUNTIME.sh

Expected result:

COM1 Runtime Verification: PASS

## Interact with COM1

bash ./INTERACT_COM1.sh "example payload"

## Inspect Runtime Status

bash ./STATUS_COM1.sh

## Inspect Runtime Logs

bash ./LOGS_COM1.sh

or:

bash ./LOGS_COM1.sh 100

## Stop COM1

bash ./STOP_COM1.sh

## Uninstall COM1

COM1 must be stopped before uninstallation.

bash ./UNINSTALL_COM1.sh

## Integration Contract

The delivered integration kit is located under:

integration/

It contains the integration documentation and samples supplied with COM1.

## Runtime Contract

A COM1 frame has the form:

[4-byte signed big-endian payload length][payload bytes]

The supported V1 payload bound is:

0 <= payload length <= 65536

Negative and oversized declared lengths are rejected.

A truncated frame is not accepted as a complete interaction.

A failed client interaction does not terminate the service runtime.

## Runtime Delivery Contract

COM1 Runtime Delivery 1.0.0 provides:

- portable installation;
- persistent runtime configuration;
- runtime start, verification and stop;
- client interaction;
- runtime status and log inspection;
- integration documentation and samples;
- bounded framed-message interaction;
- complete-frame reconstruction;
- response production for admissible complete input;
- client interaction failure isolation;
- explicit uninstallation;
- package integrity verification.

The runtime delivery verification gate verifies:

- archive checksum;
- package manifest;
- external delivery structure;
- external runtime startup;
- runtime verification;
- client interaction;
- running status and health;
- runtime logs;
- runtime stop;
- stopped status;
- complete uninstallation.

## Current Boundary

This runtime delivery does not claim:

- transport confidentiality;
- client authentication;
- distributed replication;
- high availability;
- distributed consensus;
- production-scale performance;
- automated registration as an operating-system service.
