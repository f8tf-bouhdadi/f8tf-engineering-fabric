# RM-ODP — Technology Viewpoint (COM2-ES)

## 1. Purpose

The COM2 Technology Viewpoint defines the reference technology realization
of the COM2 Engineering Viewpoint.

Technology choices shall realize, and shall not redefine, the authoritative:

- Enterprise specification;
- Information specification;
- Computational specification;
- Engineering specification;
- Service Guarantees.

The reference realization is structured so that technology responsibilities
remain explicitly separated from service semantics and qualification.

## 2. Technology Profile

### TECH-PROF-COM2-01 — .NET 8 HTTP/JSON Interaction Admission Profile

The current reference technology profile uses:

- .NET 8;
- ASP.NET Core Web;
- HTTP request/response interaction;
- HTTP POST binding;
- JSON interaction representation;
- `System.Text.Json`;
- structured Domain, Application, Platform and API projects.

Alternative technology profiles remain admissible when they preserve the
upstream COM2 specifications and Service Guarantees.

## 3. Technology Architecture

### TECH-ARCH-COM2-01 — Domain Information Layer

The Domain layer realizes the information representations required by COM2.

Current project:

`Com2.Domain`

Principal responsibilities:

- represent `InteractionSubmission`;
- represent `Envelope`;
- represent `AdmissionOutcome`;
- represent `AcceptanceOutcome`;
- represent `InvalidRequest`;
- remain independent of HTTP, JSON and ASP.NET Core.

### TECH-ARCH-COM2-02 — Application Processing Layer

The Application layer realizes the COM2 computational processing contract.

Current project:

`Com2.Application`

Principal responsibilities:

- realize `COMP-OP-COM2-01 — submit`;
- realize the internal computational decomposition:
  - `COMP-ACT-COM2-01 — Interpret Submission`;
  - `COMP-ACT-COM2-02 — Evaluate Admission`;
  - `COMP-ACT-COM2-03 — Produce Outcome`;
- define required technology-facing abstractions;
- remain independent of concrete HTTP and JSON mechanisms.

### TECH-ARCH-COM2-03 — Platform Adapter Layer

The Platform layer realizes technology mechanisms required by the Application
processing contract.

Current project:

`Com2.Platform`

Principal responsibilities:

- implement interaction interpretation;
- bind the abstract interpretation requirement to JSON;
- provide the current clock mechanism;
- remain independent of the HTTP service boundary.

### TECH-ARCH-COM2-04 — API Boundary Layer

The API layer exposes COM2 through the selected technology boundary.

Current project:

`Com2.Api`

Principal responsibilities:

- expose the HTTP service boundary;
- expose `POST /send`;
- obtain the interaction submission;
- invoke the COM2 Application processing;
- map `AdmissionOutcome` to the concrete HTTP response;
- compose Application and Platform responsibilities.

### TECH-ARCH-COM2-05 — Dependency Direction

The reference dependency direction is:

`Com2.Domain <- Com2.Application <- Com2.Platform`

with:

`Com2.Api`

acting as the composition and HTTP boundary layer.

The Domain layer shall not depend on Application, Platform or API concerns.

Application processing shall not depend on concrete JSON or HTTP
implementations.

## 4. Technology Components

### TECH-COMP-COM2-01 — COM2 Domain Component

Current realization:

`F8TF.COM2.Domain`

Principal elements:

- `InteractionSubmission`;
- `Envelope`;
- `AdmissionOutcome`;
- `AcceptanceOutcome`;
- `InvalidRequest`.

### TECH-COMP-COM2-02 — COM2 Application Component

Current realization:

`F8TF.COM2.Application`

Principal elements:

- `AdmissionProcessor`;
- `IInteractionInterpreter`;
- `InterpretationResult`;
- `IClock`.

`AdmissionProcessor` realizes the single offered Computational operation:

`COMP-OP-COM2-01 — submit`

The application abstractions do not redefine the technology-independent
Computational interface.

### TECH-COMP-COM2-03 — COM2 JSON Platform Component

Current realization:

`F8TF.COM2.Platform`

Principal elements:

- `JsonInteractionInterpreter`;
- `SystemClock`.

The JSON interpreter realizes the selected technology representation binding.

### TECH-COMP-COM2-04 — COM2 HTTP Boundary Component

Current realization:

`F8TF.COM2.Api`

Principal responsibilities:

- expose the selected HTTP boundary;
- map HTTP request content to `InteractionSubmission`;
- invoke `AdmissionProcessor`;
- map `AdmissionOutcome` to the selected HTTP response representation.

## 5. Technology Interaction Binding

### TECH-BIND-COM2-01 — HTTP Request/Response Binding

`ENG-CH-COM2-01` is realized using HTTP request/response interaction.

HTTP is a Technology choice.

It is not intrinsic to the COM2 Computational contract.

## 6. Submission Transfer Binding

### TECH-END-COM2-01 — POST /send

`ENG-MECH-COM2-01` is realized through:

`POST /send`

The endpoint carries one interaction submission toward the COM2 Application
processing boundary.

## 7. Submission Representation Binding

### TECH-REP-COM2-01 — JSON Interaction Representation

`ENG-MECH-COM2-02` is realized using JSON.

The current representation supports:

- `id`;
- `kind`;
- `payload`;
- optional `meta`.

### TECH-CODEC-COM2-01 — System.Text.Json Binding

The current reference profile uses `System.Text.Json`.

The Platform component interprets submitted JSON information and establishes
an `Envelope` when representation interpretation succeeds.

### TECH-COR-COM2-01 — Submission–Envelope Identity Correspondence

For an interaction representation that successfully establishes an `Envelope`,
the submitted JSON `id` is preserved as `Envelope.Id`.

This realizes `INF-COR-COM2-01` through the selected JSON representation and
`ENG-MECH-COM2-02`.

The reference implementation realizes this correspondence by transferring
`EnvelopeDto.Id` directly to `Envelope.Id`.

Representation failure produces an explicit rejected admission outcome.

## 8. Admission Outcome Binding

### TECH-OUT-COM2-01 — HTTP Admission Outcome Mapping

`ENG-MECH-COM2-03` is realized through HTTP responses.

Successful admission is represented by HTTP `200` carrying:

- `accepted = true`;
- accepted interaction `id`;
- `receivedAt`.

Rejected admission is represented by HTTP `400` carrying:

- `error`;
- `message`.

## 9. Technology Constraints

### TECH-CON-COM2-01 — Admission Evaluation Before Success

A successful technology response shall not be produced before the required
admission conditions have been evaluated.

### TECH-CON-COM2-02 — Explicit Outcome

A controlled evaluation shall produce an explicit accepted or rejected
outcome.

### TECH-CON-COM2-03 — Identity Preservation

A successful outcome shall preserve the submitted interaction identity.

### TECH-CON-COM2-04 — Optional Meta

The reference technology representation shall not require `meta`.

Absence of `meta` alone shall not cause rejection.

## 10. Engineering–Technology Mapping

| Engineering element | Technology realization |
|---|---|
| `ENG-CH-COM2-01` | `TECH-BIND-COM2-01`, `TECH-COMP-COM2-04` |
| `ENG-MECH-COM2-01` | `TECH-END-COM2-01`, `TECH-COMP-COM2-04` |
| `ENG-MECH-COM2-02` | `TECH-REP-COM2-01`, `TECH-CODEC-COM2-01`, `TECH-COMP-COM2-03` |
| `ENG-MECH-COM2-03` | `TECH-OUT-COM2-01`, `TECH-COMP-COM2-04` |
| `ENG-CON-COM2-01` | `TECH-CON-COM2-01`, `TECH-COMP-COM2-02` |
| `ENG-CON-COM2-02` | `TECH-CON-COM2-02`, `TECH-COMP-COM2-02`, `TECH-COMP-COM2-04` |
| `ENG-CON-COM2-03` | `TECH-CON-COM2-03`, `TECH-COMP-COM2-02` |
| `ENG-CON-COM2-04` | `TECH-CON-COM2-04`, `TECH-COMP-COM2-03` |

## 11. Technology Dependency Rules

### TECH-RULE-COM2-01 — Domain Independence

`Com2.Domain` shall remain independent of:

- Application processing;
- Platform adapters;
- HTTP;
- JSON codecs;
- qualification infrastructure.

### TECH-RULE-COM2-02 — Application Depends on Domain

`Com2.Application` may depend on `Com2.Domain`.

It shall remain independent of concrete HTTP and JSON realization mechanisms.

### TECH-RULE-COM2-03 — Technology Through Explicit Ports

Technology-specific interpretation shall be accessed through the explicit
Application abstraction:

`IInteractionInterpreter`

### TECH-RULE-COM2-04 — Platform Implements Application Requirements

`Com2.Platform` may implement Application-defined abstractions.

The current JSON interpreter implements `IInteractionInterpreter`.

### TECH-RULE-COM2-05 — API Composition Boundary

`Com2.Api` composes the concrete Platform implementation with Application
processing.

It shall not redefine COM2 admission semantics.

### TECH-RULE-COM2-06 — Technology Substitutability

A different technology profile may replace HTTP, JSON, ASP.NET Core or the
current adapter implementation when it preserves the upstream contracts and
Service Guarantees.

### TECH-RULE-COM2-07 — No Implicit Additional Guarantees

The current reference technology profile shall not imply guarantees that are
not declared by the COM2 Service Contract.

## 12. Realization Boundary

Technology specifies the selected realization architecture and mechanisms.

Concrete source files belong to the realization.

A concrete Technology-to-Code mapping belongs to executable realization
artifacts and is not part of this public Product 1 specification.

The implementation responsibilities available to an independent integrator
are defined separately in:

`../realization/PRODUCT1_REALIZATION_MAPPING.md`

## 13. Qualification Boundary

The Technology Viewpoint does not establish that the resulting executable is
qualified.

Qualification must verify the actual executable realization against the
design and Service Guarantees.

## 14. Authority

The Enterprise, Information, Computational and Engineering specifications
remain authoritative.

Technology shall realize those specifications without silently redefining
their semantics.
