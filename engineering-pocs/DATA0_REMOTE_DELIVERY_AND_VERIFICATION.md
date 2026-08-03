# DATA0 Remote Delivery and Client Verification

This process defines how an agreed DATA0 evaluation is remotely delivered,
verified and concluded.

## 1. Scope Confirmation

Before delivery, the GitHub issue must record:

- the DATA0 service identity;
- the bounded evaluation scope;
- the applicable guarantees;
- the declared exclusions;
- the acceptance criteria;
- the verification plan;
- and the delivery decision.

The client confirms the scope and acceptance criteria before F8TF prepares the
delivery.

## 2. Delivery Identity

Every DATA0 delivery must identify:

- Service ID;
- delivery version;
- source qualification commit;
- public release tag or controlled delivery identifier;
- applicable qualification level;
- package checksum;
- and declared limitations.

## 3. Delivery Production

F8TF executes the applicable qualification and packaging actions:

- behavioural V0 verification;
- strict V1 contract audit;
- evidence capture;
- package generation;
- internal manifest generation;
- checksum generation;
- and offline client-verification preparation.

A failed gate prevents delivery publication.

## 4. Delivery Modes

### Public Evaluation Delivery

A sanitized and non-confidential package may be published as a GitHub Release.

The release may contain:

- the DATA0 evaluation archive;
- archive checksum;
- delivery manifest;
- public evidence summary;
- and verification instructions.

### Controlled Delivery

A client-specific or commercial package is not published as an unrestricted
public download.

The public GitHub issue may record the non-confidential delivery identifier,
status and acceptance decision. The actual package is transferred through an
approved private or secure channel.

## 5. Client Download

For a public evaluation delivery, the client downloads:

- the identified DATA0 archive;
- and the published archive checksum.

## 6. Archive Integrity Verification

The client verifies the downloaded archive:

    sha256sum -c DATA0_EVAL_V1.tar.gz.sha256

Expected result:

    DATA0_EVAL_V1.tar.gz: OK

This verifies that the downloaded archive matches the archive published by
F8TF. It does not by itself prove DATA0 behaviour.

## 7. Package Extraction

The client extracts the delivery:

    tar -xzf DATA0_EVAL_V1.tar.gz
    cd DATA0_EVAL_V1

## 8. Internal Integrity Verification

The client verifies the delivery contents:

    sha256sum -c SHA256SUMS

This checks that the delivered documentation, schemas, samples, evidence and
verification tools match the packaged manifest.

## 9. Offline Client Verification

The client executes:

    bash ./VERIFY_CLIENT.sh

The expected result is:

    PASS: DATA0 V1 client verification

The verification procedure must report precisely which checks were executed,
which checks passed, which checks failed and which guarantees remain outside
its scope.

## 10. Promise-to-Evidence Assessment

The client compares each applicable public DATA0 guarantee with:

- the verification action;
- the expected result;
- the observed result;
- the evidence reference;
- and the declared limitation.

Integrity verification, behavioural verification, contract audit and formal
proof must remain explicitly distinguished.

## 11. Client Acceptance Record

The client should use:

[DATA0 Client Acceptance Record Template](DATA0_CLIENT_ACCEPTANCE_RECORD_TEMPLATE.md)

The client records in the GitHub issue:

- the evaluated delivery identifier;
- the archive checksum result;
- the offline verification result;
- the acceptance-criteria results;
- observed deviations;
- and one decision:
  - accepted;
  - accepted with conditions;
  - revision required;
  - or rejected.

## 12. Supplier Conclusion

F8TF records:

- acceptance acknowledgement;
- required corrective action;
- replacement delivery identifier when applicable;
- recommended next action;
- commercial continuation when explicitly requested;
- and issue closure status.

## 13. Proof Boundary

The delivery may evidence only the guarantees actually covered by the executed
verification.

The current DATA0 V1 delivery does not claim:

- persistence recovery across process restart;
- multi-process or distributed write serialization;
- replication or sharding;
- high availability;
- production-scale performance;
- or formal proof at V1.
