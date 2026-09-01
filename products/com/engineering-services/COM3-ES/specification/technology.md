# COM3 — Technology Viewpoint Specification

## 1. Purpose

This Technology Viewpoint defines the reference technology realization
requirements of the Assured Operation Interaction Engineering Service.

Technology choices shall realize, and shall not redefine, the authoritative:

- Enterprise specification;
- Information specification;
- Computational specification;
- Engineering specification;
- Service Contract and Service Guarantees.

The Technology Viewpoint establishes a reference .NET technology architecture
from which an executable realization can subsequently be derived.

This specification does not by itself establish executable realization or
executable qualification.

## 2. Technology Profile

### TECH-PROF-COM3-01 — .NET 8 Operation Interaction Profile

The reference technology profile uses:

- .NET 8;
- structured Domain, Application, Platform and API projects;
- explicit Application-defined technology ports;
- technology adapters isolated in the Platform project;
- an executable boundary isolated in the API project.

A JSON/RPC representation may be realized as a Platform binding where it
preserves the authoritative COM3 Operation semantics.

JSON, RPC, HTTP, correlation identifiers and concrete transports are not
intrinsic to the COM3 Service Contract.

Alternative technology profiles remain admissible when they preserve the
upstream COM3 specifications and Service Guarantees.

## 3. Technology Architecture

### TECH-ARCH-COM3-01 — Domain Information Layer

The Domain layer shall realize the Information Viewpoint representations.

Principal responsibilities:

- represent `DeclaredOperation`;
- represent `InvocationSignature`;
- represent `TerminationType`;
- represent `OperationInvocation`;
- represent `OperationTermination`;
- preserve the Information invariants;
- remain independent of concrete serialization, protocol and transport
  technologies.

### TECH-ARCH-COM3-02 — Application Interaction Layer

The Application layer shall realize the Computational Viewpoint contract.

Principal responsibilities:

- realize Announcement invocation processing;
- realize Interrogation invocation establishment;
- realize Interrogation termination establishment;
- preserve declared Operation identity and form;
- enforce invocation conformance;
- enforce declared termination conformance;
- preserve invocation–termination association;
- preserve single contractual termination selection;
- define technology-facing ports required by the processing;
- remain independent of concrete serialization, protocol and transport
  mechanisms.

### TECH-ARCH-COM3-03 — Platform Binding Layer

The Platform layer shall implement the concrete technology mechanisms required
through Application-defined ports.

Principal responsibilities:

- bind declared Operation representations to the selected technology profile;
- bind invocation representations to the selected technology profile;
- bind termination representations to the selected technology profile;
- provide a concrete invocation–termination association mechanism when
  required by the selected profile;
- preserve the distinction between Announcement and Interrogation;
- preserve all upstream COM3 constraints.

A JSON/RPC adapter is an admissible reference Platform binding.

It shall not redefine the generic COM3 Operation semantics as generic
`request/result/error` semantics.

### TECH-ARCH-COM3-04 — API Boundary Layer

The API layer shall expose the selected executable technology boundary.

Principal responsibilities:

- compose Application and Platform responsibilities;
- receive technology-specific representations;
- establish the corresponding COM3 Domain information;
- invoke the appropriate COM3 Application operation;
- expose technology-specific outcomes without redefining contractual
  Announcement or Interrogation semantics.

No specific transport protocol or endpoint is prescribed by Product 1.

### TECH-ARCH-COM3-05 — Dependency Direction

The reference dependency direction shall be:

`Com3.Domain <- Com3.Application <- Com3.Platform`

with:

`Com3.Api`

acting as the composition and executable technology boundary.

The Domain layer shall not depend on Application, Platform or API concerns.

Application processing shall not depend on concrete JSON, RPC, HTTP or other
transport implementations.

## 4. Technology Components

### TECH-COMP-COM3-01 — COM3 Domain Component

Target realization component:

`F8TF.COM3.Domain`

It shall realize the technology-independent information structures and
invariants defined by the COM3 Information Viewpoint.

### TECH-COMP-COM3-02 — COM3 Application Component

Target realization component:

`F8TF.COM3.Application`

It shall realize the COM3 Computational operations and obligations.

### TECH-COMP-COM3-03 — COM3 Platform Component

Target realization component:

`F8TF.COM3.Platform`

It shall realize selected concrete technology bindings through explicit
Application-defined ports.

### TECH-COMP-COM3-04 — COM3 API Component

Target realization component:

`F8TF.COM3.Api`

It shall compose the executable technology boundary without introducing new
COM3 service semantics.

## 5. Technology Realization of Engineering Components

### TECH-BIND-COM3-01 — Declared Operation Binding

Realizes `ENG-COMP-COM3-01`.

The selected technology representation shall preserve:

- Operation identity;
- Operation form;
- invocation signature;
- declared termination types.

### TECH-GUARD-COM3-01 — Invocation Conformance Realization

Realizes `ENG-COMP-COM3-02`.

The Application realization shall establish invocation conformance before an
invocation is represented as contractually established.

### TECH-GUARD-COM3-02 — Operation Form Realization

Realizes `ENG-COMP-COM3-03`.

The selected realization shall preserve whether the declared Operation is an
Announcement or an Interrogation.

### TECH-BOUND-COM3-01 — Announcement Completion Boundary

Realizes `ENG-COMP-COM3-04`.

An Announcement realization shall not require or establish an Operation
Termination as part of its COM3 contractual semantics.

Lower-level transport or protocol responses, when present, are outside this
Operation semantic contract.

### TECH-STATE-COM3-01 — Interrogation State Realization

Realizes `ENG-COMP-COM3-05`.

The Application realization shall preserve sufficient state to distinguish an
established but incomplete Interrogation from a completed Interrogation.

### TECH-GUARD-COM3-03 — Termination Conformance Realization

Realizes `ENG-COMP-COM3-06`.

A contractual termination shall be established only when its selected
termination type belongs to the originating Operation's declared termination
set and its parameters conform to that termination type.

### TECH-COR-COM3-01 — Invocation–Termination Association

Realizes `ENG-COMP-COM3-07`.

The selected technology profile shall provide a concrete means of associating
an Operation Termination with its originating Operation Invocation.

A correlation identifier is one admissible realization mechanism.

It is not part of the generic COM3 Service Contract.

### TECH-GUARD-COM3-04 — Single Termination Realization

Realizes `ENG-COMP-COM3-08`.

Once a contractual termination has been established for an Interrogation, the
COM3 realization shall not establish a second contractual termination for that
same invocation.

This is a semantic exclusivity constraint.

It does not imply exactly-once network delivery or processing.

## 6. Technology Constraints

### TECH-CON-COM3-01 — Declared Operation Preservation

Technology representation shall preserve the identity and declaration of the
Operation concerned by an interaction.

### TECH-CON-COM3-02 — Operation Form Preservation

Technology realization shall not reinterpret Announcement as Interrogation or
Interrogation as Announcement.

### TECH-CON-COM3-03 — Invocation Conformance

A contractually established invocation shall conform to its declared
Invocation Signature.

### TECH-CON-COM3-04 — Announcement Termination Independence

Announcement realization shall not introduce an Operation Termination into the
COM3 contractual interaction.

### TECH-CON-COM3-05 — Declared Termination Conformance

A contractually established Interrogation termination shall belong to the
declared termination set and conform to its declared signature.

### TECH-CON-COM3-06 — Invocation–Termination Association

Every established Operation Termination shall remain associated with exactly
one originating Operation Invocation.

### TECH-CON-COM3-07 — Single Termination Selection

A completed Interrogation shall expose exactly one selected contractual
Operation Termination.

## 7. Reference JSON/RPC Binding Boundary

A JSON/RPC representation is treated as a candidate technology profile, not
as the generic COM3 semantic model.

Within such a profile:

- `method` may represent a declared Operation identity;
- request parameters may represent invocation parameters;
- a correlation identifier may realize invocation–termination association;
- profile-specific result or error representations may encode declared
  termination types.

The generic COM3 contract shall not be reduced to:

- Request/Response;
- Success/Error;
- JSON;
- RPC;
- correlation identifiers.

This Technology Specification does not by itself establish that any executable
runtime satisfies the complete Product 1 responsibilities.

## 8. Technology Dependency Rules

### TECH-RULE-COM3-01 — Domain Independence

`Com3.Domain` shall remain independent of:

- Application orchestration;
- Platform adapters;
- API boundaries;
- JSON;
- RPC;
- HTTP;
- qualification infrastructure.

### TECH-RULE-COM3-02 — Application Depends on Domain

`Com3.Application` may depend on `Com3.Domain`.

It shall remain independent of concrete serialization and transport
technologies.

### TECH-RULE-COM3-03 — Technology Through Explicit Ports

Technology-specific bindings required by Application processing shall be
accessed through explicit Application-defined abstractions.

### TECH-RULE-COM3-04 — Platform Implements Application Requirements

`Com3.Platform` may implement Application-defined technology abstractions.

### TECH-RULE-COM3-05 — API Is the Composition Boundary

`Com3.Api` may compose Domain, Application and Platform responsibilities and
expose the selected executable boundary.

It shall not redefine the COM3 Computational interface or Service Guarantees.

## 9. Product 1 Boundary

This Technology Viewpoint specifies the technology responsibilities from which
the executable realization shall subsequently be derived.

It does not:

- create the structured runtime;
- claim executable realization;
- claim executable qualification;
- claim qualified runtime identity;
- prescribe LCS-08 implementation artifacts beyond their required
  responsibilities.

LCS-07 is complete only together with the explicit Engineering-to-Technology
correspondence.
