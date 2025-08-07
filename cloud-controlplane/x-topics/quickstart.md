# Redpanda Cloud Control Plane API Quickstart

The following steps describe how to authenticate with the Control API and create a new Redpanda cluster. For more information on the Control Plane API, see the Redpanda Cloud API Overview.

> **Note:** Redpanda Cloud uses a control plane and data plane architecture. 
To see the available endpoints for managing resources within your clusters, such as topics, users, access control lists (ACLs), and connectors, see the Data Plane API Reference.

## Requirements

To use the Control Plane API:

1. You must be a customer with an existing organization in Redpanda Cloud.
2. You can only use one organization for authentication.

**BYOC only**: To create a BYOC cluster, [install or update `rpk`](https://docs.redpanda.com/redpanda-cloud/manage/rpk/rpk-install).

## Create a new cluster

> **Warning:** API requests from this page are executed against your actual environment and data, not a sandbox.

### Authenticate to the API from API Explorer

To make API requests in your browser, you must obtain an access token. You can do so by clicking **Get token** on the first API request you intend to make. Before you can create a new cluster, your first step is to create a new resource group, and then create a network, if you don't already have a resource group or network you want to use.

If you successfully retrieve an access token, it is valid for one hour. You can use the same token in requests to both Control Plane and Data Plane API endpoints, for as long as the token is valid.

### BYOC or Dedicated

1. In the page header, click **API Explorer**.
1. On the **Choose an operation** dropdown, select **Create resource group**.
1. Click **Get token**. You may be prompted to log in to the Redpanda Cloud UI. After you log in, the browser automatically redirects you back to the Create resource group endpoint in the API Explorer.
1. Prepare your Create resource group request.
  1. Under **Body**, click **+ Add** and provide a name for your resource group. A resource group is a container to organize your Redpanda Cloud resources, such as clusters and networks.
  1. Click **Send Request**. If successful, the response returns a resource group ID. Pass this ID when you make a Create network request. 
1. On the dropdown, select **Create network**.
1. Prepare your Create network request.
  1. Include the ID of the resource group you created in the previous step. 
  1. Click **Send Request**. Note that this endpoint returns a long-running operation. The response returns a network ID in `metadata.network_id`. Pass this ID when you call the Create Cluster endpoint.To check the operation state, make a **Get operation** request with the `operation.id`.  
1. When the Create network operation is complete, make a Create cluster request. Use the resource group and network IDs you just created. Note that this endpoint also returns a long-running operation.
1. For BYOC, run `rpk cloud byoc` in the shell, passing the `metadata.cluster_id` from the Create cluster response as a flag:

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

1. In the page header, click **API Explorer**.
1. On the **Choose an operation** dropdown, select **Create resource group**.
1. Click **Get token**. You may be prompted to log in to the Redpanda Cloud UI. After you log in, the browser automatically redirects you back to the Create resource group endpoint in the API Explorer.
1. Prepare your Create resource group request.
  1. Under **Body**, click **+ Add** and provide a name for your resource group. A resource group is a container to organize your Redpanda Cloud resources, such as clusters and networks.
  1. Click **Send Request**. If successful, the response returns a resource group ID. Pass this ID later when you make a Create Serverless cluster request. 
1. On the dropdown, select **Create Serverless cluster**. 
1. Prepare your Create Serverless cluster request.
  1. Make a Get Serverless Regions request to see available regions.
  1. In the request body, use the resource group ID and desired cloud region.

## Next steps: try the Data Plane APIs

1. Retrieve your cluster's Data Plane API URL by making a **Get cluster** (BYOC, Dedicated) or **Get Serverless cluster** (Serverless) request in the API Explorer.
1. Save the value of `dataplane_api.url` from the response body.
1. From the **Redpanda APIs** selector, go to **Cloud Data Plane API**.
1. Select an operation, for example **Create topic** or **List users**. 
1. In the URL field, add the Data Plane API URL. You can now make Data Plane API requests to your target cluster.

