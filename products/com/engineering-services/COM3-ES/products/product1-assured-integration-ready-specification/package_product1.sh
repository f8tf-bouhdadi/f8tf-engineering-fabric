#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
COM3_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd -P)"

PKG="F8TF_COM3_ASSURED_INTEGRATION_READY_SPECIFICATION_1.0.0"

EXPECTED_ARCHIVE_SHA256="45165e8946f782a8417ff69c7ad0522b2630a5bb1329a856ed2503aa4888b8ca"

OUT_ROOT="${1:-$HOME/f8tf-com3-product1-release}"

BUILD_ROOT="$OUT_ROOT/build"
DST="$BUILD_ROOT/$PKG"

ARCHIVE="$OUT_ROOT/$PKG.tar.gz"
ARCHIVE_SHA="$ARCHIVE.sha256"

BOM=(
  "SERVICE_CONTRACT.md"
  "assurance/SPECIFICATION_PROOF_OBLIGATIONS.md"
  "integration/INTEGRATOR_TRACEABILITY_MAP.md"
  "realization/PRODUCT1_REALIZATION_MAPPING.md"
  "specification/COM3_ODP_CORRESPONDENCE_SPECIFICATIONS.md"
  "specification/ODP_UML_Index.md"
  "specification/computational.md"
  "specification/engineering.md"
  "specification/enterprise.md"
  "specification/information.md"
  "specification/technology.md"
  "uml/computational-classes.puml"
  "uml/computational-sequences.puml"
  "uml/correspondences.puml"
  "uml/engineering-classes.puml"
  "uml/engineering-sequences.puml"
  "uml/enterprise-classes.puml"
  "uml/enterprise-usecases.puml"
  "uml/information-classes.puml"
  "uml/technology-classes.puml"
  "uml/technology-sequences.puml"
)

echo "=== COM3 PRODUCT1 — DETERMINISTIC PACKAGING ==="

test "${#BOM[@]}" = "21"

rm -rf "$OUT_ROOT"
mkdir -p "$DST"

echo
echo "=== COPY CANONICAL PRODUCT1 BOM ==="

for rel in "${BOM[@]}"; do
  src="$COM3_ROOT/$rel"
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
  find "$DST" -type f |
  wc -l |
  tr -d ' '
)"

printf 'PRE_MANIFEST_FILE_COUNT=%s\n' "$PRE_MANIFEST_COUNT"

test "$PRE_MANIFEST_COUNT" = "24"

echo
echo "=== BUILD MANIFEST ==="

(
  cd "$DST"

  find . -type f \
    ! -name MANIFEST.sha256 \
    -print |
  LC_ALL=C sort |
  xargs sha256sum > MANIFEST.sha256
)

MANIFEST_COUNT="$(
  wc -l < "$DST/MANIFEST.sha256" |
  tr -d ' '
)"

TOTAL_COUNT="$(
  find "$DST" -type f |
  wc -l |
  tr -d ' '
)"

printf 'MANIFEST_ENTRY_COUNT=%s\n' "$MANIFEST_COUNT"
printf 'PACKAGE_FILE_COUNT=%s\n' "$TOTAL_COUNT"

test "$MANIFEST_COUNT" = "24"
test "$TOTAL_COUNT" = "25"

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
  sha256sum "$ARCHIVE" |
  awk '{print $1}'
)"

printf 'ARCHIVE_SHA256=%s\n' "$ARCHIVE_SHA256"

if [ "$EXPECTED_ARCHIVE_SHA256" != "__UNFROZEN__" ]; then
  test "$ARCHIVE_SHA256" = "$EXPECTED_ARCHIVE_SHA256" || {
    echo "FAIL: Product1 archive identity differs from frozen identity" >&2
    exit 27
  }
fi

echo
echo "=== FRESH CLIENT EXTRACTION ==="

CLIENT="$OUT_ROOT/client"

mkdir -p "$CLIENT"

tar -xzf "$ARCHIVE" \
  -C "$CLIENT"

TOP_COUNT="$(
  find "$CLIENT" \
    -mindepth 1 \
    -maxdepth 1 |
  wc -l |
  tr -d ' '
)"

test "$TOP_COUNT" = "1"

(
  cd "$CLIENT/$PKG"
  bash ./VERIFY_CLIENT.sh
)

echo
echo "PASS: COM3 Product1 1.0.0 deterministic package"
