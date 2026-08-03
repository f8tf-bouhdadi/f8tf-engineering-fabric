# Simulated DATA0 Engineering Evaluation Request

This request is a public, non-confidential simulation used to exercise the
DATA0 client-supplier interaction process.

It does not represent a real client, contract or delivery commitment.

## Requested Engagement

Controlled evaluation delivery

## Client Role

Systems integrator

## Client Need

The client needs to preserve engineering records without overwriting previously
accepted data.

The client must be able to verify independently that valid records are
accepted, invalid blank records are rejected and previously recorded entries
remain available after subsequent append operations.

The evaluation is intended to determine whether DATA0-ES is suitable as a
bounded persistence component for a future integration scenario.

## Evaluation Scenario

The client evaluates DATA0-ES in a clean local environment.

The scenario includes:

1. starting the service;
2. checking service health;
3. submitting a first valid payload;
4. verifying that offset `0` is returned;
5. submitting a second valid payload;
6. verifying that offset `1` is returned;
7. submitting a blank payload;
8. verifying that the blank payload is rejected;
9. inspecting the persistence file;
10. verifying that both accepted records remain present;
11. inspecting offset, timestamp and payload information;
12. executing the offline client verification procedure;
13. inspecting the supplied evidence and integrity information.

## Target Environment

- Operating system: Windows 10
- Shell: Git Bash
- Runtime: supported .NET runtime or SDK
- HTTP client: `curl`
- Integrity tool: `sha256sum`
- Network exposure: localhost
- Persistence path: configurable local file
- Deployment type: bounded local evaluation

The evaluation does not require distributed deployment, replication,
container orchestration or production-scale operation.

## Guarantees Selected

- required payload validation;
- append-only preservation;
- no destructive mutation through append;
- scoped monotonic offset assignment;
- persistence following successful append;
- minimal timestamp-based persistence trace information;
- reproducible verification and packaging.

Append serialization within one service instance is relevant to the client,
but the client acknowledges that it is not covered by the current behavioural
verification.

## Acceptance Criteria

The evaluation is accepted when:

1. the delivery is identified and versioned;
2. package integrity verification succeeds;
3. the documented service starts successfully;
4. the health interaction succeeds;
5. the first valid append returns offset `0`;
6. the second valid append returns offset `1`;
7. the blank payload is rejected;
8. both accepted records remain present;
9. the persisted records expose offset, timestamp and payload information;
10. the offline client verification procedure returns `PASS`;
11. the supplied evidence is consistent with the declared DATA0 guarantees;
12. the conclusion does not claim restart recovery, distributed serialization,
    replication, sharding, high availability, production-scale performance or
    formal proof at V1.

## Scope Acknowledgement

The client acknowledges that the current DATA0 qualification does not claim:

- recovery across process restart;
- multi-process or distributed write serialization;
- replication or sharding;
- high availability;
- production-scale performance;
- formal proof at V1.

## Expected Decision

Determine whether DATA0-ES fits the bounded persistence need and whether a
controlled evaluation delivery should proceed.

## Requested Timeframe

Public process simulation only. No real delivery date is requested.

## Evaluation Data

Only fictitious and non-sensitive records will be used.

No credentials, secrets, personal data or production data are involved.

## Additional Information

The client expects one of the following conclusions:

- DATA0-ES fits the bounded need;
- a DATA0-specific adaptation is required;
- DATA0 must be composed with another Engineering Service;
- or the need is outside the currently qualified DATA0 scope.
