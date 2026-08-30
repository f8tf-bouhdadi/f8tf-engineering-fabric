#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$ROOT"

echo "=== COM1 PRODUCT1 — CLIENT VERIFICATION ==="

test -f PRODUCT.toml || {
  echo "FAIL: PRODUCT.toml missing" >&2
  exit 2
}

test -f MANIFEST.sha256 || {
  echo "FAIL: MANIFEST.sha256 missing" >&2
  exit 3
}

grep -Fq 'service_id = "COM1-ES"' PRODUCT.toml || {
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
test -f specification/COM1_ODP_CORRESPONDENCE_SPECIFICATIONS.md
test -f specification/ODP_UML_Index.md
test -f uml/enterprise.puml
test -f uml/information.puml
test -f uml/computational.puml
test -f uml/engineering.puml
test -f uml/technology.puml
test -f uml/correspondences.puml
test -f assurance/SPECIFICATION_PROOF_OBLIGATIONS.md
test -f integration/INTEGRATOR_TRACEABILITY_MAP.md
test -f realization/PRODUCT1_REALIZATION_MAPPING.md

echo "PASS: Product1 canonical structure"

echo
echo "=== EXACT PRODUCT FILE SET ==="

EXPECTED_FILE_COUNT=21

ACTUAL_FILE_COUNT="$(
  find . -type f | wc -l | tr -d ' '
)"

printf 'EXPECTED_FILE_COUNT=%s\n' "$EXPECTED_FILE_COUNT"
printf 'ACTUAL_FILE_COUNT=%s\n' "$ACTUAL_FILE_COUNT"

test "$ACTUAL_FILE_COUNT" = "$EXPECTED_FILE_COUNT" || {
  echo "FAIL: unexpected Product1 file set" >&2
  exit 7
}

EXPECTED_LIST="$(mktemp)"
ACTUAL_LIST="$(mktemp)"

trap 'rm -f "$EXPECTED_LIST" "$ACTUAL_LIST"' EXIT

{
  printf './MANIFEST.sha256\n'
  awk '{print $2}' MANIFEST.sha256 | sed 's/^\*//'
} | LC_ALL=C sort > "$EXPECTED_LIST"

find . -type f -print | LC_ALL=C sort > "$ACTUAL_LIST"

cmp -s "$EXPECTED_LIST" "$ACTUAL_LIST" || {
  echo "FAIL: Product1 contains missing or unexpected files" >&2
  diff -u "$EXPECTED_LIST" "$ACTUAL_LIST" || true
  exit 8
}

grep -Fq 'canonical_content_files = 17' PRODUCT.toml || {
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

CORR="specification/COM1_ODP_CORRESPONDENCE_SPECIFICATIONS.md"
SPO="assurance/SPECIFICATION_PROOF_OBLIGATIONS.md"

CS_COUNT="$(grep -c '^# CS-COM1-' "$CORR")"
CR_COUNT="$(grep -c '^## CR-COM1-' "$CORR")"
CL_COUNT="$(grep -c '^### CL-COM1-' "$CORR")"

SPO_COUNT="$(grep -c '^## SPO-COM1-' "$SPO")"
SAT_COUNT="$(grep -c '^`SATISFIED`$' "$SPO")"

printf 'CS=%s\n' "$CS_COUNT"
printf 'CR=%s\n' "$CR_COUNT"
printf 'CL=%s\n' "$CL_COUNT"
printf 'SPO=%s\n' "$SPO_COUNT"
printf 'SPO_SATISFIED=%s\n' "$SAT_COUNT"

test "$CS_COUNT" = "6"
test "$CR_COUNT" = "6"
test "$CL_COUNT" = "85"
test "$SPO_COUNT" = "4"
test "$SAT_COUNT" = "4"

echo
echo "PASS: COM1 Product1 1.0.0 complete and intact"
