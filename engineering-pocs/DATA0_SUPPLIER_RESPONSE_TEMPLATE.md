# DATA0 Supplier Response Template

Use this template to structure the F8TF response to a submitted DATA0
Engineering Evaluation request.

The response must remain aligned with the published DATA0 Service Contract,
current qualification, guarantees, limitations and execution process.

## 1. Request Reference

- GitHub issue:
- Request title:
- Requester role:
- Requested engagement:
- Review date:

## 2. Request Completeness

### Information received

- client need:
- evaluation scenario:
- target environment:
- guarantees selected:
- acceptance criteria:
- expected decision:
- requested timeframe:
- evaluation data confirmation:

### Completeness decision

- [ ] Sufficient information
- [ ] Clarification required
- [ ] Request outside the declared DATA0 scope

### Missing or unclear information

- none / describe:

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

- [ ] DATA0-ES fits the bounded need
- [ ] DATA0-ES requires client-specific adaptation
- [ ] DATA0-ES must be composed with another Engineering Service
- [ ] The request is outside the currently qualified DATA0 scope

### Assessment rationale

Describe how the submitted need compares with:

- DATA0 inputs;
- preconditions;
- successful outcomes;
- failure conditions;
- guarantees;
- limitations;
- verification evidence;
- and current qualification.

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

- [ ] Compatible with the requested evaluation
- [ ] Scope reduction required
- [ ] Adaptation required
- [ ] Composition required
- [ ] No-fit

### Notes

- none / describe:

## 7. Proposed Engagement

- [ ] Initial technical clarification
- [ ] Controlled evaluation delivery
- [ ] Scoped Engineering PoC
- [ ] Client-specific adaptation
- [ ] Integration discussion
- [ ] Commercial proposal
- [ ] No engagement

### Proposed scope

Describe:

- target scenario;
- applicable guarantees;
- exclusions;
- client responsibilities;
- F8TF responsibilities;
- verification actions;
- evidence to produce;
- and expected conclusion.

## 8. Proposed Acceptance Criteria

List only observable criteria aligned with the declared DATA0 scope.

1.
2.
3.
4.

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

1.
2.
3.

## 11. F8TF Actions Required

F8TF must:

1.
2.
3.

## 12. Delivery Decision

- [ ] Delivery may proceed after scope agreement
- [ ] Clarification required before delivery decision
- [ ] Delivery requires adaptation or composition
- [ ] Delivery not supported for this request

### Delivery conditions

- none / describe:

## 13. Commercial Continuation

- [ ] No commercial continuation proposed
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
- [ ] Fit confirmed
- [ ] Scope proposal issued
- [ ] Evaluation approved
- [ ] No-fit concluded
- [ ] Closed

### Supplier summary

Provide a concise conclusion and the next required action.
