#!/bin/bash
set -euo pipefail

echo "========================================="
echo "Validating GitHub Actions Workflow"
echo "========================================="

WORKFLOW=".github/workflows/bump.yml"
ERRORS=0

# Test 1: YAML syntax
echo -e "\n[TEST 1] YAML syntax validation"
if python3 -c "import yaml; yaml.safe_load(open('$WORKFLOW'))" 2>/dev/null; then
  echo "  ✓ YAML syntax is valid"
else
  echo "  ✗ YAML syntax error"
  ERRORS=$((ERRORS + 1))
fi

# Test 2: Required scripts exist
echo -e "\n[TEST 2] Required scripts exist"
for script in determine-overlays.sh detect-admin-versions.sh; do
  if [ -f ".github/scripts/$script" ] && [ -x ".github/scripts/$script" ]; then
    echo "  ✓ .github/scripts/$script (executable)"
  else
    echo "  ✗ .github/scripts/$script missing or not executable"
    ERRORS=$((ERRORS + 1))
  fi
done

# Test 3: Script calls in workflow
echo -e "\n[TEST 3] Script calls in workflow"
if grep -q ".github/scripts/determine-overlays.sh" "$WORKFLOW"; then
  echo "  ✓ determine-overlays.sh is called"
else
  echo "  ✗ determine-overlays.sh not called"
  ERRORS=$((ERRORS + 1))
fi

# Note: detect-admin-versions.sh is kept for future use but not needed in workflow
# since we explicitly handle v1 and v2
echo "  ℹ detect-admin-versions.sh (available for future dynamic expansion)"

# Test 4: Step output references
echo -e "\n[TEST 4] Step output references"

# Check each step individually
if grep -q "id: admin-v1-overlays" "$WORKFLOW" && grep -q "steps.admin-v1-overlays.outputs.overlay_paths" "$WORKFLOW"; then
  echo "  ✓ admin-v1-overlays → steps.admin-v1-overlays.outputs.overlay_paths"
else
  echo "  ✗ admin-v1-overlays or reference missing"
  ERRORS=$((ERRORS + 1))
fi

if grep -q "id: admin-v2-overlays" "$WORKFLOW" && grep -q "steps.admin-v2-overlays.outputs.overlay_paths" "$WORKFLOW"; then
  echo "  ✓ admin-v2-overlays → steps.admin-v2-overlays.outputs.overlay_paths"
else
  echo "  ✗ admin-v2-overlays or reference missing"
  ERRORS=$((ERRORS + 1))
fi

if grep -q "id: overlays" "$WORKFLOW" && grep -q "steps.overlays.outputs.overlay_paths" "$WORKFLOW"; then
  echo "  ✓ overlays → steps.overlays.outputs.overlay_paths"
else
  echo "  ✗ overlays or reference missing"
  ERRORS=$((ERRORS + 1))
fi

if grep -q "id: format" "$WORKFLOW" && grep -q "steps.format.outputs.file_path" "$WORKFLOW"; then
  echo "  ✓ format → steps.format.outputs.file_path"
else
  echo "  ✗ format or reference missing"
  ERRORS=$((ERRORS + 1))
fi

# Test 5: Conditionals match step usage
echo -e "\n[TEST 5] Conditional logic"
# Admin v1 overlays step should only run for admin
if grep -A5 "id: admin-v1-overlays" "$WORKFLOW" | grep -q "if:.*admin"; then
  echo "  ✓ admin-v1-overlays has admin conditional"
else
  echo "  ✗ admin-v1-overlays missing conditional"
  ERRORS=$((ERRORS + 1))
fi

# Non-admin overlays should skip admin
if grep -A5 "id: overlays" "$WORKFLOW" | grep -q "if:.*!= 'admin'"; then
  echo "  ✓ overlays step skips admin"
else
  echo "  ✗ overlays step should skip admin"
  ERRORS=$((ERRORS + 1))
fi

# Test 6: AWS credentials in both deploy and diff jobs
echo -e "\n[TEST 6] AWS credentials in jobs"
DEPLOY_CREDS=$(grep -A30 "deploy-doc:" "$WORKFLOW" | grep -c "configure-aws-credentials" || true)
DIFF_CREDS=$(grep -A30 "api-diff:" "$WORKFLOW" | grep -c "configure-aws-credentials" || true)

if [ "$DEPLOY_CREDS" -ge 1 ]; then
  echo "  ✓ deploy-doc has AWS credentials"
else
  echo "  ✗ deploy-doc missing AWS credentials"
  ERRORS=$((ERRORS + 1))
fi

if [ "$DIFF_CREDS" -ge 1 ]; then
  echo "  ✓ api-diff has AWS credentials"
else
  echo "  ✗ api-diff missing AWS credentials"
  ERRORS=$((ERRORS + 1))
fi

# Test 7: No AWS credentials in determine-doc-ids
echo -e "\n[TEST 7] No AWS in determine-doc-ids"
MATRIX_CREDS=$(grep -A20 "determine-doc-ids:" "$WORKFLOW" | grep -c "configure-aws-credentials" || true)
if [ "$MATRIX_CREDS" -eq 0 ]; then
  echo "  ✓ determine-doc-ids has no AWS credentials (correct)"
else
  echo "  ✗ determine-doc-ids should not have AWS credentials"
  ERRORS=$((ERRORS + 1))
fi

# Summary
echo -e "\n========================================="
if [ $ERRORS -eq 0 ]; then
  echo "✓ All workflow validations passed!"
  echo "========================================="
  exit 0
else
  echo "✗ $ERRORS validation(s) failed"
  echo "========================================="
  exit 1
fi
