# Simulated DATA0 Supplier Response

This simulated response exercises the F8TF supplier-side handling of the
public simulated DATA0 Engineering Evaluation request.

The response must remain aligned with the published DATA0 Service Contract,
current qualification, guarantees, limitations and execution process.

## 1. Request Reference

- GitHub issue: not submitted — public process simulation
- Request title: Simulated DATA0 Engineering Evaluation Request
- Requester role: Systems integrator
- Requested engagement: Controlled evaluation delivery
- Review date: 2026-08-03

## 2. Request Completeness

### Information received

- client need: preserve engineering records without overwriting previously
  accepted data;
- evaluation scenario: local DATA0 startup, health check, two valid appends,
  blank payload rejection, persistence inspection and offline verification;
- target environment: Windows 10, Git Bash, supported .NET runtime or SDK,
  `curl`, `sha256sum`, localhost and configurable local persistence;
- guarantees selected: payload validation, append-only preservation,
  non-destructive append, scoped monotonic offsets, persistence after append,
  minimal timestamp traceability and reproducible verification;
- acceptance criteria: identified delivery, successful integrity verification,
  service startup, offsets `0` and `1`, blank payload rejection, preserved
  records, trace information and offline verification `PASS`;
- expected decision: determine whether DATA0-ES fits the bounded persistence
  need and whether controlled evaluation delivery should proceed;
- requested timeframe: public process simulation only;
- evaluation data confirmation: fictitious and non-sensitive data only.

### Completeness decision

- [x] Sufficient information
- [ ] Clarification required
- [ ] Request outside the declared DATA0 scope

### Missing or unclear information

- none

## 3. DATA0 Service Reference

- Service ID: DATA0-ES
- Service name: Foundational Immutable Data Persistence Engineering Service
- Qualification baseline:
  - V0 — Runnable and behaviourally verified
  - V1 — Audit-ready and client-verifiable
- Applicable public reference:
  - `products/data/README.md`

## 4. Fit Assessment

### Assessment result

- [x] DATA0-ES fits the bounded need
- [ ] DATA0-ES requires client-specific adaptation
- [ ] DATA0-ES must be composed with another Engineering Service
- [ ] The request is outside the currently qualified DATA0 scope

### Assessment rationale

The request is aligned with DATA0-ES because it targets bounded local
append-only persistence using non-sensitive evaluation data.

The requested scenario matches the currently qualified DATA0 behaviour:

- valid payload acceptance;
- blank payload rejection;
- preservation of previously accepted records;
- scoped monotonic offsets;
- minimal file persistence;
- minimal timestamp trace information;
- and reproducible client verification.

The client explicitly excludes restart recovery, distributed serialization,
replication, sharding, high availability, production-scale performance and
formal proof at V1.

## 5. Applicable Guarantees

For each requested guarantee, record its current status.

| Requested guarantee | Applicable | Currently qualified | Notes |
|---|---|---|---|
| Required payload validation | Yes / No | Yes / No | |
| Append-only preservation | Yes / No | Yes / No | |
| No destructive mutation through append | Yes / No | Yes / No | |
| Scoped monotonic offset assignment | Yes / No | Yes / No | |
| Persistence following successful append | Yes / No | Yes / No | |
| Append serialization within one service instance | Yes / No | Not behaviourally covered | |
| Minimal timestamp-based trace information | Yes / No | Yes / No | |
| Reproducible verification and packaging | Yes / No | Yes / No | |

## 6. Limitation Compatibility

Confirm whether the request remains compatible with the current absence of
claims for:

- restart recovery;
- multi-process or distributed write serialization;
- replication or sharding;
- high availability;
- production-scale performance;
- formal proof at V1.

### Limitation decision

- [x] Compatible with the requested evaluation
- [ ] Scope reduction required
- [ ] Adaptation required
- [ ] Composition required
- [ ] No-fit

### Notes

- The declared DATA0 limitations are compatible with this bounded local
  evaluation.

## 7. Proposed Engagement

- [ ] Initial technical clarification
- [x] Controlled evaluation delivery
- [ ] Scoped Engineering PoC
- [ ] Client-specific adaptation
- [ ] Integration discussion
- [ ] Commercial proposal
- [ ] No engagement

### Proposed scope

The proposed controlled evaluation uses a clean local Windows 10 and Git Bash
environment with a supported .NET runtime or SDK.

The evaluation covers:

- service startup and health verification;
- two valid append interactions;
- one invalid blank payload interaction;
- preservation of both accepted records;
- scoped offsets `0` and `1`;
- persistence record inspection;
- timestamp trace inspection;
- package integrity verification;
- and offline client verification.

The evaluation excludes restart recovery, distributed execution, replication,
sharding, high availability, production-scale performance and formal proof.

## 8. Proposed Acceptance Criteria

1. The delivery is identified and versioned.
2. Package integrity verification succeeds.
3. The service starts and the health interaction succeeds.
4. Two valid appends return offsets `0` and `1`.
5. A blank payload is rejected.
6. Both accepted records remain present.
7. Stored records contain offset, timestamp and payload information.
8. The offline verification procedure returns `PASS`.
9. Supplied evidence remains consistent with the declared DATA0 scope.

## 9. Proposed Deliverables

Select the deliverables applicable to the proposed engagement.

- [ ] DATA0 Service Reference Baseline
- [ ] Confirmed Input Set
- [ ] Preconditions Checklist
- [ ] Applicable Guarantee Set
- [ ] Limitation Acknowledgement
- [ ] Agreed Acceptance Criteria
- [ ] DATA0 Verification Plan
- [ ] Execution Results
- [ ] Execution Trace
- [ ] Outcome Classification Record
- [ ] DATA0 Evidence Set
- [ ] Evidence Index
- [ ] DATA0 Qualified Delivery Package
- [ ] Client Verification Result
- [ ] DATA0 Client Acceptance Record
- [ ] Evaluation Conclusion
- [ ] Recommended Next Action

## 10. Client Actions Required

The client must:

1. confirm the proposed scope and acceptance criteria;
2. confirm the use of fictitious or non-sensitive evaluation data;
3. execute or observe the documented verification activities;
4. record the final acceptance decision.

## 11. F8TF Actions Required

F8TF must:

1. establish the DATA0 service and qualification baseline;
2. prepare the identified controlled evaluation delivery;
3. provide verification instructions and evidence;
4. answer clarification requests;
5. record the evaluation conclusion.

## 12. Delivery Decision

- [x] Delivery may proceed after scope agreement
- [ ] Clarification required before delivery decision
- [ ] Delivery requires adaptation or composition
- [ ] Delivery not supported for this request

### Delivery conditions

- client confirmation of the proposed bounded scope;
- client confirmation of the acceptance criteria;
- use of non-sensitive evaluation data;
- and continued compatibility with the published DATA0 limitations.

## 13. Commercial Continuation

- [x] No commercial continuation proposed
- [ ] Scoped PoC proposed
- [ ] Adaptation engagement proposed
- [ ] Integration engagement proposed
- [ ] Commercial proposal requested
- [ ] Support or extension discussion proposed

Submission of the request and publication of this response do not create a
commercial contract. Any commercial scope and terms must be explicitly agreed.

## 14. Supplier Conclusion

### Current request status

- [ ] Awaiting client clarification
- [x] Fit confirmed
- [x] Scope proposal issued
- [ ] Evaluation approved
- [ ] No-fit concluded
- [ ] Closed

### Supplier summary

The simulated request is sufficiently complete and fits the currently qualified
bounded DATA0 scope.

F8TF may proceed toward a controlled evaluation delivery after the client
confirms the proposed scope, acceptance criteria and delivery conditions.
