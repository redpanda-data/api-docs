#!/bin/bash
set -euo pipefail

# Script to detect all admin API versions
# Looks for files matching admin/admin-v*.yaml or admin/admin.yaml (v1)
# Outputs JSON array of version objects with file and version info

VERSIONS=()

# Check for v1 (admin.yaml)
if [ -f "admin/admin.yaml" ]; then
  VERSIONS+=('{"version":"v1","file":"admin/admin.yaml","branch":"v1"}')
fi

# Check for versioned files (admin-v2.yaml, admin-v3.yaml, etc.)
shopt -s nullglob
for file in admin/admin-v*.yaml; do
  if [ -f "$file" ]; then
    # Extract version from filename (e.g., "admin-v2.yaml" -> "v2")
    version=$(basename "$file" .yaml | sed 's/admin-//')
    VERSIONS+=("{\"version\":\"$version\",\"file\":\"$file\",\"branch\":\"$version\"}")
  fi
done
shopt -u nullglob

# Output JSON array
if [ ${#VERSIONS[@]} -eq 0 ]; then
  echo "[]"
else
  printf '%s\n' "${VERSIONS[@]}" | jq -s '.'
fi
