# Redpanda Cloud Data Plane API Quickstart

The following steps describe how to authenticate with the Data Plane API. For more information on the Data Plane API, see the Redpanda Cloud API Overview.

> **Note:** Redpanda Cloud uses a control plane and data plane architecture. To see the available endpoints for managing your clusters, networks, and resource groups, see the Control Plane API Reference.

## Requirements

To use the Data Plane API:

1. You must be a customer with an existing organization in Redpanda Cloud.
2. You can only use one organization for authentication.
3. You must have a running cluster in Redpanda Cloud.

### Authenticate to the API from API Explorer

You can issue requests against the Data Plane API from your browser when viewing the API Explorer:

1. In the Redpanda Cloud UI, create a [service account (client)](https://cloud.redpanda.com/organization-iam?tab=service-accounts). Save the client ID and secret.
1. Go to the "Get access token" endpoint and click **Run in API Explorer**.
1. In the request body:
  1. For `grant_type`, select `client_credentials`.
  1. Enter the `client_id` and `client_secret` values you generated using the service account.
  1. For `audience`, select `cloudv2-production.redpanda.cloud`. 
1. Click **Send Request** on the code example to the right.

The Response block should populate with an `access_token` value. Copy the string value without the quotes. To you make your next request on a different endpoint in the API Explorer, add the access token in the Authentication field.

> **Warning:** API requests from this page are executed against your actual environment and data, not a sandbox.

## Create a topic

1. If you don't already have the data plane API URL for your target cluster, make a Get Cluster (BYOC, Dedicated) or Get Serverless Cluster (Serverless) request against the Control Plane API. The response contains the Data Plane API URL. Copy the value of `dataplane_api.url` from the response body. 
1. Go to **API Servers** in the sidebar and select “\{dataplane_api_url} - Data Plane API”. Paste the URL into the `dataplane_api_url` field.
1. To create a new Redpanda topic, make a Create Topic request.



