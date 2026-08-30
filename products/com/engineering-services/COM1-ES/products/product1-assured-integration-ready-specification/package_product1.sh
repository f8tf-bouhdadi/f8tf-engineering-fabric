#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
COM1_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd -P)"

PKG="F8TF_COM1_ASSURED_INTEGRATION_READY_SPECIFICATION_1.0.0"
EXPECTED_ARCHIVE_SHA256="cdade764733d68fa6fcd13e150574d0cd4a96b56ff24e92802a6b0d16815325b"

OUT_ROOT="${1:-/tmp/f8tf-com1-product1-release}"
BUILD_ROOT="$OUT_ROOT/build"
DST="$BUILD_ROOT/$PKG"

ARCHIVE="$OUT_ROOT/$PKG.tar.gz"
ARCHIVE_SHA="$ARCHIVE.sha256"

BOM=(
  "SERVICE_CONTRACT.md"
  "specification/enterprise.md"
  "specification/information.md"
  "specification/computational.md"
  "specification/engineering.md"
  "specification/technology.md"
  "specification/COM1_ODP_CORRESPONDENCE_SPECIFICATIONS.md"
  "specification/ODP_UML_Index.md"
  "uml/enterprise.puml"
  "uml/information.puml"
  "uml/computational.puml"
  "uml/engineering.puml"
  "uml/technology.puml"
  "uml/correspondences.puml"
  "assurance/SPECIFICATION_PROOF_OBLIGATIONS.md"
  "integration/INTEGRATOR_TRACEABILITY_MAP.md"
  "realization/PRODUCT1_REALIZATION_MAPPING.md"
)

echo "=== COM1 PRODUCT1 — DETERMINISTIC PACKAGING ==="

test "${#BOM[@]}" = "17" || {
  echo "FAIL: internal Product1 BOM does not contain 17 entries" >&2
  exit 21
}

rm -rf "$OUT_ROOT"
mkdir -p "$DST"

echo
echo "=== COPY CANONICAL PRODUCT1 BOM ==="

for rel in "${BOM[@]}"; do

  src="$COM1_ROOT/$rel"
  dst="$DST/$rel"

  test -f "$src" || {
    echo "FAIL: canonical Product1 source missing: $rel" >&2
    exit 22
  }

  mkdir -p "$(dirname "$dst")"
  cp "$src" "$dst"

done

for envelope in README.md PRODUCT.toml VERIFY_CLIENT.sh; do

  test -f "$SCRIPT_DIR/$envelope" || {
    echo "FAIL: Product1 envelope source missing: $envelope" >&2
    exit 23
  }

  cp "$SCRIPT_DIR/$envelope" "$DST/$envelope"

done

chmod +x "$DST/VERIFY_CLIENT.sh"

PRE_MANIFEST_COUNT="$(
  find "$DST" -type f | wc -l | tr -d ' '
)"

printf 'PRE_MANIFEST_FILE_COUNT=%s\n' "$PRE_MANIFEST_COUNT"

test "$PRE_MANIFEST_COUNT" = "20" || {
  echo "FAIL: expected 20 files before manifest generation" >&2
  exit 24
}

echo
echo "=== BUILD MANIFEST ==="

(
  cd "$DST"

  find . -type f \
    ! -name 'MANIFEST.sha256' \
    -print |
  LC_ALL=C sort |
  xargs sha256sum > MANIFEST.sha256
)

MANIFEST_COUNT="$(
  wc -l < "$DST/MANIFEST.sha256" | tr -d ' '
)"

printf 'MANIFEST_ENTRY_COUNT=%s\n' "$MANIFEST_COUNT"

test "$MANIFEST_COUNT" = "20" || {
  echo "FAIL: expected 20 manifest entries" >&2
  exit 25
}

TOTAL_COUNT="$(
  find "$DST" -type f | wc -l | tr -d ' '
)"

printf 'PACKAGE_FILE_COUNT=%s\n' "$TOTAL_COUNT"

test "$TOTAL_COUNT" = "21" || {
  echo "FAIL: expected 21 Product1 package files" >&2
  exit 26
}

echo
echo "=== VERIFY PRODUCT BEFORE PACKAGING ==="

(
  cd "$DST"
  bash ./VERIFY_CLIENT.sh
)

echo
echo "=== NORMALIZE PACKAGE METADATA ==="

find "$DST" -type d -exec touch -t 202601010000.00 {} +
find "$DST" -type f -exec touch -t 202601010000.00 {} +

echo
echo "=== BUILD DETERMINISTIC ARCHIVE ==="

rm -f "$ARCHIVE" "$ARCHIVE_SHA"

(
  cd "$BUILD_ROOT"

  tar \
    --sort=name \
    --mtime='UTC 2026-01-01' \
    --owner=0 \
    --group=0 \
    --numeric-owner \
    -cf - \
    "$PKG" |
  gzip -n > "$ARCHIVE"
)

(
  cd "$OUT_ROOT"
  sha256sum "$PKG.tar.gz" > "$PKG.tar.gz.sha256"
)

ARCHIVE_SHA256="$(
  sha256sum "$ARCHIVE" | awk '{print $1}'
)"

printf 'ARCHIVE_SHA256=%s\n' "$ARCHIVE_SHA256"

test "$ARCHIVE_SHA256" = "$EXPECTED_ARCHIVE_SHA256" || {
  echo "FAIL: Product1 archive identity differs from validated 1.0.0 release candidate" >&2
  exit 27
}

echo
echo "=== FRESH CLIENT EXTRACTION ==="

CLIENT="$OUT_ROOT/client"
mkdir -p "$CLIENT"

tar -xzf "$ARCHIVE" -C "$CLIENT"

TOP_COUNT="$(
  find "$CLIENT" -mindepth 1 -maxdepth 1 | wc -l | tr -d ' '
)"

test "$TOP_COUNT" = "1" || {
  echo "FAIL: archive extraction produced an unexpected root shape" >&2
  exit 28
}

(
  cd "$CLIENT/$PKG"
  bash ./VERIFY_CLIENT.sh
)

echo
echo "PASS: COM1 Product1 1.0.0 deterministic package"
printf 'ARCHIVE=%s\n' "$ARCHIVE"
printf 'CHECKSUM=%s\n' "$ARCHIVE_SHA"
