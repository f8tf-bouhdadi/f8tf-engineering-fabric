#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$ROOT"

echo "=== COM3 PRODUCT1 — CLIENT VERIFICATION ==="

test -f PRODUCT.toml || {
  echo "FAIL: PRODUCT.toml missing" >&2
  exit 2
}

test -f MANIFEST.sha256 || {
  echo "FAIL: MANIFEST.sha256 missing" >&2
  exit 3
}

grep -Fq 'service_id = "COM3-ES"' PRODUCT.toml || {
  echo "FAIL: unexpected service identity" >&2
  exit 4
}

grep -Fq 'product = "Product1"' PRODUCT.toml || {
  echo "FAIL: unexpected product identity" >&2
  exit 5
}

grep -Fq 'version = "1.0.0"' PRODUCT.toml || {
  echo "FAIL: unexpected Product1 version" >&2
  exit 6
}

echo
echo "=== PACKAGE INTEGRITY ==="

sha256sum -c MANIFEST.sha256

echo
echo "=== PRODUCT1 STRUCTURE ==="

test -f SERVICE_CONTRACT.md

test -f specification/enterprise.md
test -f specification/information.md
test -f specification/computational.md
test -f specification/engineering.md
test -f specification/technology.md

test -f specification/COM3_ODP_CORRESPONDENCE_SPECIFICATIONS.md
test -f specification/ODP_UML_Index.md

test -f assurance/SPECIFICATION_PROOF_OBLIGATIONS.md
test -f integration/INTEGRATOR_TRACEABILITY_MAP.md
test -f realization/PRODUCT1_REALIZATION_MAPPING.md

test -f uml/enterprise-classes.puml
test -f uml/enterprise-usecases.puml
test -f uml/information-classes.puml
test -f uml/computational-classes.puml
test -f uml/computational-sequences.puml
test -f uml/engineering-classes.puml
test -f uml/engineering-sequences.puml
test -f uml/technology-classes.puml
test -f uml/technology-sequences.puml
test -f uml/correspondences.puml

echo "PASS: Product1 canonical structure"

echo
echo "=== EXACT PRODUCT FILE SET ==="

EXPECTED_FILE_COUNT=25

ACTUAL_FILE_COUNT="$(
  find . -type f |
  wc -l |
  tr -d ' '
)"

printf 'EXPECTED_FILE_COUNT=%s\n' "$EXPECTED_FILE_COUNT"
printf 'ACTUAL_FILE_COUNT=%s\n' "$ACTUAL_FILE_COUNT"

test "$ACTUAL_FILE_COUNT" = "$EXPECTED_FILE_COUNT" || {
  echo "FAIL: unexpected Product1 file set" >&2
  exit 7
}

EXPECTED_LIST="$(mktemp)"
ACTUAL_LIST="$(mktemp)"

cleanup_lists() {
  rm -f "$EXPECTED_LIST" "$ACTUAL_LIST"
}

trap cleanup_lists EXIT

{
  printf './MANIFEST.sha256\n'

  awk '{print $2}' MANIFEST.sha256 |
  sed 's/^\*//'
} |
LC_ALL=C sort > "$EXPECTED_LIST"

find . -type f -print |
LC_ALL=C sort > "$ACTUAL_LIST"

cmp -s "$EXPECTED_LIST" "$ACTUAL_LIST" || {
  echo "FAIL: Product1 contains missing or unexpected files" >&2
  diff -u "$EXPECTED_LIST" "$ACTUAL_LIST" || true
  exit 8
}

grep -Fq 'canonical_content_files = 21' PRODUCT.toml || {
  echo "FAIL: unexpected Product1 BOM declaration" >&2
  exit 9
}

grep -Fq 'lifecycle_start = "LCS-01"' PRODUCT.toml || {
  echo "FAIL: unexpected Product1 lifecycle start" >&2
  exit 10
}

grep -Fq 'lifecycle_end = "LCS-07"' PRODUCT.toml || {
  echo "FAIL: unexpected Product1 lifecycle end" >&2
  exit 11
}

echo "PASS: exact Product1 file set"

echo
echo "=== PRODUCT1 ASSURANCE INVARIANTS ==="

CORR="specification/COM3_ODP_CORRESPONDENCE_SPECIFICATIONS.md"
SPO="assurance/SPECIFICATION_PROOF_OBLIGATIONS.md"

CS_COUNT="$(
  grep -Ec '^# CS-COM3-' "$CORR" || true
)"

CR_COUNT="$(
  grep -Ec '^## CR-COM3-' "$CORR" || true
)"

CL_COUNT="$(
  grep -Ec '^### CL-COM3-' "$CORR" || true
)"

SPO_COUNT="$(
  grep -Ec '^### SPO-COM3-' "$SPO" || true
)"

SAT_COUNT="$(
  grep -Ec '^`SATISFIED`$' "$SPO" || true
)"

printf 'CS=%s\n' "$CS_COUNT"
printf 'CR=%s\n' "$CR_COUNT"
printf 'CL=%s\n' "$CL_COUNT"
printf 'SPO=%s\n' "$SPO_COUNT"
printf 'SPO_SATISFIED=%s\n' "$SAT_COUNT"

test "$CS_COUNT" = "6" || {
  echo "FAIL: expected 6 Correspondence Specifications" >&2
  exit 12
}

test "$CR_COUNT" = "6" || {
  echo "FAIL: expected 6 Correspondence Rules" >&2
  exit 13
}

test "$CL_COUNT" = "43" || {
  echo "FAIL: expected 43 Correspondence Links" >&2
  exit 14
}

test "$SPO_COUNT" = "7" || {
  echo "FAIL: expected 7 Specification Proof Obligations" >&2
  exit 15
}

test "$SAT_COUNT" = "7" || {
  echo "FAIL: expected 7 SATISFIED SPO dispositions" >&2
  exit 16
}

echo
echo "PASS: COM3 Product1 assurance invariants = 6 CS / 6 CR / 43 CL / 7 SPO SATISFIED"

echo
echo "PASS: COM3 Product1 1.0.0 complete and intact"
