# Redpanda Cloud Control Plane API Quickstart

The following steps describe how to authenticate with the Control API and create a new Redpanda cluster. For more information on the Control Plane API, see the Redpanda Cloud API Overview.

> **Note:** Redpanda Cloud uses a control plane and data plane architecture. 
To see the available endpoints for managing resources within your clusters, such as topics, users, access control lists (ACLs), and connectors, see the Data Plane API Reference.

## Requirements

To use the Control Plane API:

1. You must be a customer with an existing organization in Redpanda Cloud.
2. You can only use one organization for authentication.

### Authenticate to the API from API Explorer

You can issue requests against the Control Plane API from your browser when viewing the API Explorer:

1. In the Redpanda Cloud UI, create a [service account (client)](https://cloud.redpanda.com/organization-iam?tab=service-accounts). Save the client ID and secret.
1. Go to the "Get access token" endpoint and click **Run in API Explorer**.
1. In the request body:
  1. For `grant_type`, select `client_credentials`.
  1. Enter the `client_id` and `client_secret` values you generated using the service account.
  1. For `audience`, select `cloudv2-production.redpanda.cloud`. 
1. Click **Send Request** on the code example to the right.

The Response block should populate with an `access_token` value. Copy the string value without the quotes. To you make your next request on a different endpoint in the API Explorer, add the access token in the Authentication field.

> **Warning:** API requests from this page are executed against your actual environment and data, not a sandbox.

## Create a new cluster

### BYOC or Dedicated

1. Create a resource group by making a Create Resource Group request. The response returns a resource group ID. Pass this ID later when you call the Create Cluster endpoint.
1. Create a network by making a Create Network request. Note that this endpoint returns a long-running operation. The response returns a network ID in `resource_id`. Pass this ID when you call the Create Cluster endpoint.  
1. When the Create Network operation is complete, create a cluster by making a Create Cluster request. Note that this endpoint returns a long-running operation.
1. For BYOC, run `rpk cloud byoc` in the shell, passing the `metadata.cluster_id` from the Create Cluster response as a flag:

   **AWS:**
   ```bash
   rpk cloud byoc aws apply --redpanda-id=<metadata.cluster_id>
   ```
   **Azure:**
   ```bash
   rpk cloud byoc azure apply --redpanda-id=<metadata.cluster_id> --subscription-id=<redpanda-cluster-azure-subscription-id>
   ```
   **GCP:**
   ```bash
   rpk cloud byoc gcp apply --redpanda-id=<metadata.cluster_id> --project-id=<gcp-project-id>
   ```

### Serverless

1. Make a Get Resource Group request to retrieve the default resource group ID. Pass this ID later when you call the Create Serverless Cluster endpoint.
1. Make a Get Serverless Regions request to see available regions.
1. Create a cluster by making a Create Serverless Cluster request, passing in the default resource group ID and desired cloud region in the request.

