# COM1-ES — Bounded Framed Message Interaction Engineering Service

## Engineering Promise

Establish bounded message interactions over a byte-stream transport through
explicit frame boundaries, complete payload reconstruction and controlled
handling of malformed or incomplete framed interactions.

## Customer Need

A consumer of a stream-oriented transport needs to distinguish complete
messages from an undelimited byte stream and prevent malformed, oversized or
incomplete framed interactions from being processed as valid messages.

TCP provides a byte stream and does not itself preserve application-level
message boundaries.

COM1-ES addresses this need through an explicit bounded framing contract.

## Engineering Capability

COM1-ES provides a bounded framed-message interaction capability in which:

1. a declared frame length is interpreted explicitly;
2. only supported frame lengths are admitted;
3. a frame becomes complete only after its declared payload has been fully
   received;
4. a response is produced only after reception of a complete admissible input;
5. failure of one client interaction does not prevent subsequent interactions.

COM1-ES is an autonomous Engineering Service.

## Service Contract

The qualified V1 Service Contract covers:

- TCP byte-stream transport;
- a 4-byte signed big-endian frame-length field;
- bounded payload reception;
- complete frame reconstruction;
- rejection of invalid or incomplete framed inputs;
- framed response emission;
- isolation of a failing client interaction from subsequent interactions.

The current supported framing bound is:

    0 <= declared_length <= 65536

The Service Contract requires satisfaction of four authoritative Service
Guarantees.

## Qualified Service Guarantees

### G-COM1-BOUNDED — Bounded Frame Acceptance

A frame is accepted for processing only when its declared payload length is
within the supported bounds.

### G-COM1-COMPLETE — Complete Frame Reception

An accepted frame contains the complete payload declared by its framing length.

A prematurely terminated payload does not constitute a complete accepted frame.

### G-COM1-RESPONSE — Response After Complete Admissible Input

A response is produced only after successful reception of a complete admissible
input frame.

### G-COM1-ISOLATION — Client Interaction Failure Isolation

Failure of one client interaction does not terminate the service's ability to
process subsequent interactions.

## Qualification

COM1-ES is currently qualified at:

- **V1 — Runtime-qualified within the declared Service Contract scope**.

The qualification executes scenarios against the real structured COM1 runtime
and evaluates all four required Service Guarantees.

The qualification covers observations including:

- rejection of negative frame lengths;
- rejection of oversized frame lengths;
- reconstruction of deliberately fragmented valid frames;
- rejection of truncated frames;
- absence of response before complete admissible input reception;
- continued service operation following a failing client interaction.

The V1 Service Contract is accepted only when every required Service Guarantee
has exactly one qualification result and every required result is satisfied.

## Explicit Limitations

The current qualified V1 scope does not claim:

- distributed routing;
- request correlation;
- durable audit logging;
- transport confidentiality;
- client authentication;
- high availability;
- production-scale performance;
- formal proof.

Formal verification is outside the current V1 qualification claim.

## Runtime Realization

COM1-ES is realized by a qualified executable bounded framed-message runtime.

The runtime is an Engineering Asset realizing COM1-ES; it is not the
Engineering Service itself.

The current qualified executable realization uses:

- .NET 8;
- TCP transport;
- a 4-byte signed big-endian length prefix;
- a maximum supported payload length of 65536 bytes;
- per-client interaction processing.

## Commercial Qualified Runtime Delivery

The qualified executable realization is packaged as:

`F8TF_COM1_QUALIFIED_RUNTIME_DELIVERY_1.0.0`

The COM1 Qualified Runtime Delivery is a controlled delivery for authorized
customers, engineering evaluations and commercial engagements.

It is not publicly distributed.

An authorized recipient can independently verify:

- the received archive integrity;
- the complete qualified Runtime Delivery identity;
- the qualified COM1 runtime identity;
- the qualification binding;
- runtime startup and verification;
- framed client interaction;
- running status and health;
- runtime logs;
- controlled stop and restart;
- complete uninstallation.

The commercial Runtime Delivery contains the executable runtime and operator
tooling required to perform those checks independently.

Implementation source, development worktrees and historical engineering assets
are not included in the commercial Runtime Delivery.

## Standard Client Journey

A prospective COM1 customer can follow this path:

1. **Discover** — identify the bounded framed-message interaction need.
2. **Review** — examine the public COM1-ES Service Contract, qualified scope,
   guarantees and limitations.
3. **Assess suitability** — determine whether COM1-ES addresses the intended
   communication requirement.
4. **Request evaluation or acquisition** — contact F8TF for controlled access to
   the qualified executable Runtime Delivery.
5. **Receive the authorized delivery** — obtain the identified sealed Runtime
   Delivery and its integrity information.
6. **Verify independently** — verify archive integrity, delivery identity,
   runtime identity and qualification binding.
7. **Operate** — install, start, verify and execute framed interactions.
8. **Inspect** — examine runtime status, health and logs.
9. **Control lifecycle** — stop, restart and uninstall the delivered runtime.

## Evaluation and Acquisition

Organizations interested in evaluating or acquiring COM1-ES may contact F8TF:

`m.bouhdadi@um5r.ac.ma`

The qualified Runtime Delivery is supplied through a controlled customer
delivery channel after authorization.
