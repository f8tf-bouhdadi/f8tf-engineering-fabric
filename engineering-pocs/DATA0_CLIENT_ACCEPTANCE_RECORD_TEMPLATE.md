# DATA0 Client Acceptance Record Template

Use this template after receiving and verifying an identified DATA0 delivery.

The record must remain aligned with the agreed scope, acceptance criteria,
delivery identifier, verification results and declared DATA0 limitations.

## 1. Request and Delivery Reference

- GitHub issue:
- Client request title:
- Service ID: DATA0-ES
- Delivery identifier:
- Delivery version:
- Release tag or controlled delivery reference:
- Source qualification commit:
- Review date:

## 2. Delivery Receipt

### Client confirmation

- [ ] The intended DATA0 delivery was received.
- [ ] The delivery identifier and version are visible.
- [ ] The applicable scope and limitations are included.
- [ ] The verification instructions are available.

### Receipt notes

- none / describe:

## 3. Archive Integrity Verification

- Archive filename:
- Published checksum:
- Observed checksum result:

### Decision

- [ ] PASS — archive matches the published checksum
- [ ] FAIL — archive does not match the published checksum
- [ ] NOT APPLICABLE — controlled delivery used another approved integrity mechanism

### Evidence reference

- command output, screenshot or issue comment:

## 4. Internal Package Integrity Verification

- Manifest used:
- Verification command:
- Observed result:

### Decision

- [ ] PASS — internal package contents match the manifest
- [ ] FAIL — one or more package contents do not match
- [ ] NOT EXECUTED

### Deviations

- none / describe:

## 5. Offline Client Verification

- Verification procedure:
- Execution environment:
- Execution date:
- Observed result:

### Decision

- [ ] PASS
- [ ] FAIL
- [ ] PARTIAL
- [ ] NOT EXECUTED

### Verification output reference

- log, attachment or issue comment:

## 6. Acceptance Criteria Results

| Acceptance criterion | Expected result | Observed result | Status | Evidence reference |
|---|---|---|---|---|
| Delivery identified and versioned | | | PASS / FAIL | |
| Package integrity verified | | | PASS / FAIL | |
| Service starts successfully | | | PASS / FAIL | |
| Health interaction succeeds | | | PASS / FAIL | |
| First valid append returns offset `0` | | | PASS / FAIL | |
| Second valid append returns offset `1` | | | PASS / FAIL | |
| Blank payload is rejected | | | PASS / FAIL | |
| Previously accepted records remain present | | | PASS / FAIL | |
| Stored records contain offset, timestamp and payload | | | PASS / FAIL | |
| Offline verification returns the expected result | | | PASS / FAIL | |
| Evidence remains consistent with the declared DATA0 scope | | | PASS / FAIL | |

## 7. Guarantee Assessment

For each applicable DATA0 guarantee, record the client conclusion.

| DATA0 guarantee | Verified | Not verified | Failed | Evidence / notes |
|---|---|---|---|---|
| Required payload validation | | | | |
| Append-only preservation | | | | |
| No destructive mutation through append | | | | |
| Scoped monotonic offset assignment | | | | |
| Persistence following successful append | | | | |
| Append serialization within one service instance | | | | Current behavioural verification boundary applies |
| Minimal timestamp-based persistence trace information | | | | |
| Reproducible verification and packaging | | | | |

## 8. Limitation Acknowledgement

The client confirms that this acceptance record does not treat the delivery as
proof of:

- persistence recovery across process restart;
- multi-process or distributed write serialization;
- replication or sharding;
- high availability;
- production-scale performance;
- or formal proof at V1.

### Compatibility decision

- [ ] The declared limitations remain compatible with the evaluated need.
- [ ] Acceptance requires an explicitly documented condition.
- [ ] The limitations make the delivery unsuitable for the intended need.

### Notes

- none / describe:

## 9. Observed Deviations

For each deviation, identify:

- affected criterion or guarantee;
- expected result;
- observed result;
- evidence reference;
- severity;
- and requested action.

### Deviations

1.
2.
3.

## 10. Client Decision

Select exactly one decision.

- [ ] Accepted
- [ ] Accepted with conditions
- [ ] Revision required
- [ ] Rejected

## 11. Conditions or Required Revisions

Complete this section when the decision is not unconditional acceptance.

| Condition or revision | Responsible party | Expected evidence | Status |
|---|---|---|---|
| | | | |

## 12. Requested Supplier Action

- [ ] Record acceptance and close the evaluation
- [ ] Clarify supplied evidence
- [ ] Correct a delivery defect
- [ ] Issue a replacement identified delivery
- [ ] Revise the agreed scope
- [ ] Propose adaptation
- [ ] Propose composition with another Engineering Service
- [ ] Discuss integration
- [ ] Prepare a commercial proposal
- [ ] Other:

## 13. Client Conclusion

Provide a concise conclusion describing:

- whether the delivery satisfied the agreed bounded need;
- which guarantees were verified;
- which deviations remain;
- the final acceptance decision;
- and the next requested action.

## 14. Traceability Statement

This acceptance record refers only to the identified DATA0 delivery and the
verification actions recorded above.

It must not be reused as evidence for another delivery version, environment,
scope or guarantee set without a new verification and acceptance decision.
