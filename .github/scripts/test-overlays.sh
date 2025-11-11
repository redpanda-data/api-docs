#!/bin/bash
set -euo pipefail

echo "==================================="
echo "Testing Overlay Detection Scripts"
echo "==================================="

# Test 1: Admin v1
echo -e "\n[TEST 1] Admin v1 overlays:"
RESULT=$(.github/scripts/determine-overlays.sh admin v1)
IFS=',' read -ra OVERLAYS <<< "$RESULT"
for overlay in "${OVERLAYS[@]}"; do
  if [ -f "$overlay" ]; then
    echo "  ✓ $overlay"
  else
    echo "  ✗ $overlay (MISSING)"
    exit 1
  fi
done

# Test 2: Admin v2
echo -e "\n[TEST 2] Admin v2 overlays:"
RESULT=$(.github/scripts/determine-overlays.sh admin v2)
IFS=',' read -ra OVERLAYS <<< "$RESULT"
for overlay in "${OVERLAYS[@]}"; do
  if [ -f "$overlay" ]; then
    echo "  ✓ $overlay"
  else
    echo "  ✗ $overlay (MISSING)"
    exit 1
  fi
done

# Test 3: Cloud doc
echo -e "\n[TEST 3] cloud-controlplane overlays:"
RESULT=$(.github/scripts/determine-overlays.sh cloud-controlplane)
if [ -n "$RESULT" ]; then
  IFS=',' read -ra OVERLAYS <<< "$RESULT"
  for overlay in "${OVERLAYS[@]}"; do
    if [ -f "$overlay" ]; then
      echo "  ✓ $overlay"
    else
      echo "  ✗ $overlay (MISSING)"
      exit 1
    fi
  done
else
  echo "  (no overlays)"
fi

# Test 4: SM doc (http-proxy)
echo -e "\n[TEST 4] http-proxy overlays:"
RESULT=$(.github/scripts/determine-overlays.sh http-proxy)
if [ -n "$RESULT" ]; then
  IFS=',' read -ra OVERLAYS <<< "$RESULT"
  for overlay in "${OVERLAYS[@]}"; do
    if [ -f "$overlay" ]; then
      echo "  ✓ $overlay"
    else
      echo "  ✗ $overlay (MISSING)"
      exit 1
    fi
  done
else
  echo "  (no overlays)"
fi

# Test 5: Admin version detection
echo -e "\n[TEST 5] Admin version detection:"
VERSIONS=$(.github/scripts/detect-admin-versions.sh)
echo "$VERSIONS" | jq -r '.[] | "  ✓ \(.version): \(.file) -> branch \(.branch)"'

# Test 6: Edge cases
echo -e "\n[TEST 6] Edge cases:"
echo -n "  Empty doc_id: "
if ! .github/scripts/determine-overlays.sh "" 2>/dev/null; then
  echo "✓ Error handled"
else
  echo "✗ Should error"
  exit 1
fi

echo -n "  Admin without version: "
RESULT=$(.github/scripts/determine-overlays.sh admin)
if [ -z "$RESULT" ]; then
  echo "✓ Returns empty (correct)"
else
  echo "✗ Should be empty, got: $RESULT"
  exit 1
fi

echo -e "\n==================================="
echo "✓ All tests passed!"
echo "==================================="
