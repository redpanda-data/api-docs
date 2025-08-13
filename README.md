# Data Plane API Overlays

This directory contains OpenAPI overlays that modify the data plane specification for documentation purposes. These overlays address discrepancies between the source console spec and the API Explorer requirements.

## Available Overlays

### Core Overlays

1. **`update-server-config.yaml`** - Updates server URL format and variable naming
   - Changes server URL from `{dataplane_api_url}` to `https://{dataplane_api_subdomain}.cloud.redpanda.com`
   - Renames variable from `dataplane_api_url` to `dataplane_api_subdomain`
   - Provides clear instructions for extracting subdomain from full URL

2. **`update-securityschemes-for-authentication.yaml`** - Enhances authentication documentation
   - Adds clear distinction between API Explorer and programmatic access
   - Provides step-by-step guidance for both use cases
   - Replaces minimal "RedpandaCloud" description with comprehensive instructions

3. **`add-x-topics.yaml`** - Adds documentation topics (existing)
   - Includes quickstart, authentication, error codes, and deprecation policy topics

### Testing Overlays

4. **`test-combined-updates.yaml`** - Combines server and security updates for testing
5. **`environment-config-template.yaml`** - Template for environment-specific configurations

## Usage

### Prerequisites

Install the bump CLI tool:
```bash
npm install -g @apidevtools/bump
```

### Applying Individual Overlays

```bash
# Apply server configuration overlay
bump overlay apply ../cloud-dataplane.yaml update-server-config.yaml -o output/dataplane-with-server-config.yaml

# Apply authentication overlay  
bump overlay apply ../cloud-dataplane.yaml update-securityschemes-for-authentication.yaml -o output/dataplane-with-auth-updates.yaml

# Apply x-topics overlay
bump overlay apply ../cloud-dataplane.yaml add-x-topics.yaml -o output/dataplane-with-topics.yaml
```

### Applying Multiple Overlays

```bash
# Apply overlays in sequence
bump overlay apply ../cloud-dataplane.yaml update-server-config.yaml | \
bump overlay apply - update-securityschemes-for-authentication.yaml | \
bump overlay apply - add-x-topics.yaml -o output/dataplane-final.yaml
```

### Testing Overlays

Use the test script to validate all overlays:
```bash
./test-overlays.sh
```

### Validating Results

```bash
# Validate the generated specification
bump validate output/dataplane-final.yaml

# Preview the changes
bump diff ../cloud-dataplane.yaml output/dataplane-final.yaml
```

## Integration with Build Process

To integrate these overlays into the cloudv2 build process:

1. **Update `main.go`** to remove hardcoded server and security scheme replacement
2. **Add overlay application** after downloading the console spec
3. **Use environment-specific overlays** for different deployment targets

### Proposed cloudv2 Integration

```go
// Replace the current replaceServers and replaceAuth0Security functions with:
func applyOverlays(doc3 *openapi3.T, overlayPaths []string) error {
    // Apply each overlay in sequence
    for _, overlayPath := range overlayPaths {
        // Use bump CLI or overlay library to apply overlay
        // This preserves source content while making necessary documentation changes
    }
    return nil
}
```

## Benefits of This Approach

1. **Separation of Concerns**: Source specs focus on API definition, overlays handle documentation
2. **Environment Flexibility**: Different overlays for staging/prod without changing source
3. **Version Control**: Documentation changes are tracked separately from API changes
4. **Maintainability**: Easier to update documentation without rebuilding entire specs
5. **Testing**: Individual overlays can be tested independently

## Recommended Implementation Order

1. Start with `update-server-config.yaml` - fixes immediate API Explorer compatibility
2. Add `update-securityschemes-for-authentication.yaml` - improves user guidance  
3. Integrate with cloudv2 build process by replacing hardcoded transformations
4. Create environment-specific overlays as needed
