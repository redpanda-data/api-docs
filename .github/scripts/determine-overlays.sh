#!/bin/bash
set -euo pipefail

# Script to determine overlay files for a given doc_id
# Usage: determine-overlays.sh <doc_id> [admin-version]
#   doc_id: The document identifier (e.g., "admin", "cloud-api", etc.)
#   admin-version: Optional. For admin docs, specify version (e.g., "v1", "v2")

DOC_ID="${1:-}"
ADMIN_VERSION="${2:-}"

if [ -z "$DOC_ID" ]; then
  echo "Error: doc_id is required" >&2
  exit 1
fi

OVERLAYS=""

# For admin docs with a specific version
if [ "$DOC_ID" = "admin" ] && [ -n "$ADMIN_VERSION" ]; then
  # Admin version-specific overlays (e.g., admin/v1-overlays, admin/v2-overlays)
  OVERLAY_DIR="admin/${ADMIN_VERSION}-overlays"
  if [ -d "$OVERLAY_DIR" ]; then
    shopt -s nullglob
    for overlay_file in "$OVERLAY_DIR"/*.yaml; do
      [ -f "$overlay_file" ] && OVERLAYS="${OVERLAYS:+$OVERLAYS,}$overlay_file"
    done
    shopt -u nullglob
  fi

  # Shared overlays for self-managed (admin is sm)
  if [ -d "shared/overlays" ]; then
    shopt -s nullglob
    for overlay_file in shared/overlays/sm-*.yaml; do
      [ -f "$overlay_file" ] && OVERLAYS="${OVERLAYS:+$OVERLAYS,}$overlay_file"
    done
    shopt -u nullglob
  fi

# For non-admin docs
elif [ "$DOC_ID" != "admin" ]; then
  # Doc-specific overlays
  if [ -d "${DOC_ID}/overlays" ]; then
    shopt -s nullglob
    for overlay_file in "${DOC_ID}/overlays"/*.yaml; do
      [ -f "$overlay_file" ] && OVERLAYS="${OVERLAYS:+$OVERLAYS,}$overlay_file"
    done
    shopt -u nullglob
  fi

  # Shared overlays based on prefix
  if [[ "$DOC_ID" == cloud-* ]]; then
    PREFIX="cloud-"
  else
    PREFIX="sm-"
  fi

  if [ -d "shared/overlays" ]; then
    shopt -s nullglob
    for overlay_file in shared/overlays/${PREFIX}*.yaml; do
      [ -f "$overlay_file" ] && OVERLAYS="${OVERLAYS:+$OVERLAYS,}$overlay_file"
    done
    shopt -u nullglob
  fi
fi

echo "$OVERLAYS"
