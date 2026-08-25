# COM1 Runtime Integration Kit

## Purpose

This kit defines the client-facing framed TCP integration contract of
COM1 Runtime Delivery.

COM1 provides bounded framed interaction over a TCP connection.

## Service Endpoint

Default endpoint:

    127.0.0.1:5002

Persistent configuration:

    config/F8TF.Com1.env

Environment overrides:

    COM1_HOST
    COM1_PORT

## Framing Contract

Each interaction uses the following wire representation:

    [4-byte signed big-endian payload length][payload bytes]

The declared payload length determines the number of payload bytes
belonging to the frame.

## Supported Payload Bound

The V1 runtime accepts payload lengths satisfying:

    0 <= payload length <= 65536

Negative or oversized declared lengths are rejected.

A truncated frame is not accepted as a complete interaction.

## Client Interaction

A client shall:

1. establish a TCP connection to the configured COM1 endpoint;
2. encode the payload length as a 4-byte signed big-endian integer;
3. send the length prefix followed by exactly that number of payload bytes;
4. receive a framed response using the same framing representation;
5. treat framing or connection failure as an unsuccessful interaction.

The delivered command:

    INTERACT_COM1.sh

provides an executable example of this interaction contract.

Example:

    bash ./INTERACT_COM1.sh "example payload"

## Response

For the current delivered runtime, a successful interaction produces
a framed textual response corresponding to the submitted payload.

Clients shall parse the response as a framed message rather than rely
on TCP read boundaries.

## Integration Samples

See:

    samples/README.md

for language-independent framing examples.

## Current Boundary

This contract provides bounded framed TCP interaction only.

It does not define HTTP semantics, RPC semantics, routing,
authentication, persistence, replication or high availability.
