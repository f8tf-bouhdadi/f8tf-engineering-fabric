# COM2-ES Product 3 — Integration Contract

## Purpose

This public integration contract is derived from:

- the authoritative COM2-ES Product 1 Service Contract and viewpoint
  specifications; and
- the qualified COM2 Product 3 delivery integration surface.

It describes the integration boundary exposed to a recipient of the Qualified
Delivery.

## Service Endpoint

### POST /send

Purpose:

Submit a structured interaction for controlled admission.

The submitted JSON interaction contains:

- required interaction identity `id`;
- required interaction kind `kind`;
- required interaction payload `payload`;
- optional interaction information `meta`.

The operation realizes the Product 1 computational operation:

`COMP-OP-COM2-01 — submit`

## Admission Outcome

COM2 produces an explicit admission outcome.

For successful admission, the HTTP response is `200` and the successful outcome
preserves the submitted interaction identity.

For rejected admission, the selected Technology Profile maps the rejected
outcome to HTTP `400`.

These concrete HTTP mappings do not redefine the authoritative COM2-ES Service
Guarantees.

## Operational Endpoint

### GET /health

The Qualified Delivery exposes an operational health probe.

A healthy running delivery produces a successful health response containing:

`"ok": true`

The health endpoint belongs to the operational delivery surface and does not
introduce an additional COM2 Service Guarantee.

## Delivered Integration Material

The Qualified Delivery contains:

- an OpenAPI description;
- JSON schemas for contractual interaction information;
- representative integration samples.

These artifacts allow a recipient to construct and inspect interactions without
access to the development repository.

## Service Guarantees Preserved at the Integration Boundary

The integration surface is governed by the authoritative Product 1 guarantees:

- `G-COM2-01 — Controlled Interaction Admission`
- `G-COM2-02 — Explicit Admission Outcome`
- `G-COM2-03 — Interaction Identity Preservation`
- `G-COM2-04 — Optional Interaction Information`

## Integration Boundary

This contract documents the external Product 3 integration surface.

It does not expose internal executable qualification, construction or sealing
mechanisms.
