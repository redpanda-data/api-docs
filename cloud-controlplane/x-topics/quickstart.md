The following steps describe how to authenticate with the Control Plane API and create a new Redpanda cluster.

> **Note:** Redpanda Cloud uses a control plane and data plane architecture. 
To view the available endpoints for managing resources within your clusters, such as topics, users, access control lists (ACLs), and connectors, see the [Data Plane API Reference](/api/doc/cloud-dataplane). For more information on the Control Plane API, see the [Cloud API Overview](#topic-cloud-api-overview).

## Requirements

To use the Control Plane API:

1. You must be a customer with an existing organization in Redpanda Cloud.
2. You can only use one organization for authentication.

**BYOC only**: BYOC clusters require running the `rpk cloud byoc` command to install and start the Redpanda Cloud agent service. See [Install or Update `rpk`](https://docs.redpanda.com/redpanda-cloud/manage/rpk/rpk-install).

### Authenticate to the API from API Explorer

The API Explorer lets you interact with the API directly from the documentation. You can quickly explore available endpoints and try requests without setting up your own test environment.

To make Cloud API requests in your browser, you must obtain an access token. You can do so by clicking **Get token** on the API endpoint you want to call.

If you successfully retrieve an access token, it is valid for one hour.

> **Warning:** API requests from the API Explorer are executed against your actual environment and data, not a sandbox.

## Create a new cluster

### BYOC or Dedicated

1. In the subheader of this page, open [**API Explorer**](/api/doc/cloud-controlplane/explorer).

1. In the **Choose an operation** dropdown, select **Create resource group**.

1. Click **Get token**. You may be prompted to log in to the Redpanda Cloud UI. After you log in, the browser automatically redirects you back to the Create resource group endpoint in the API Explorer.

1. Prepare your Create resource group request.

    1. Under **Body**, click **Add** and provide a name for your resource group. A resource group is a container to organize your Redpanda Cloud resources, such as clusters and networks.

    1. In the request panel, click **Send request**. If successful, the response returns a resource group ID. Copy the ID and use it later when you make a Create network request.

    ```json
    {
      "resource_group": {
        "id": "d61b4c7f-95da-4d62-a237-9fd9f20a0c19",
        "name": "test-resource-group",
        ...
      }
    }
    ```

1. In the operation dropdown, select **Create network**.

1. Prepare your Create network request.

    1. Include the ID of the resource group you created in the previous step. 
    
    1. Click **Send request**. Note that this endpoint returns a long-running operation. The response returns a network ID in `metadata.network_id`. Copy the ID and pass it later when you call the Create cluster endpoint. To check the operation state, make a [**Get operation**](/api/doc/cloud-controlplane/explorer/operation/operation-operationservice_getoperation) request with the `operation.id`.

    ```json
    {
        "operation": {
            "id": "d3505t2rmm68sqlgj4u0",
            "metadata": {
                "@type": "type.googleapis.com/redpanda.api.controlplane.v1.CreateNetworkMetadata",
                "network_id": "d3505ta2691o0l3484ng"
            },
            "state": "STATE_IN_PROGRESS",
            ...
        }
    }
    ```

1. When the Create network operation is complete, make a [Create cluster](/api/doc/cloud-controlplane/explorer/operation/operation-clusterservice_createcluster) request. Use the resource group and network IDs you just created. Note that this endpoint also returns a long-running operation.

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

1. In the subheader of this page, open [**API Explorer**](/api/doc/cloud-controlplane/explorer)

1. In the **Choose an operation** dropdown, select **Create resource group**.

1. Click **Get token**. You may be prompted to log in to the Redpanda Cloud UI. After you log in, the browser automatically redirects you back to the Create resource group endpoint in the API Explorer.

1. Prepare your Create resource group request.

    1. Under **Body**, click **Add** and provide a name for your resource group. A resource group is a container to organize your Redpanda Cloud resources, such as clusters and networks.
    
    1. In the request panel, click **Send request**. If successful, the response returns a resource group ID. Copy the ID and use it later when you make a Create Serverless cluster request.

    ```json
    {
      "resource_group": {
        "id": "d61b4c7f-95da-4d62-a237-9fd9f20a0c19",
        "name": "test-resource-group",
        ...
      }
    }
    ```

1. In the operation dropdown, scroll to **Serverless Clusters** and select [**Create Serverless cluster**](/api/doc/cloud-controlplane/explorer/operation/operation-serverlessclusterservice_createserverlesscluster).

1. Prepare your Create Serverless cluster request.
    
    1. In the request body, use the resource group ID. You can use `us-east-1` for the Serverless region if you don't require a specific region for your cluster.
    
    1. Click **Send request**. Note that this endpoint returns a long-running operation. The response returns a Serverless cluster ID in `metadata.cluster_id`. To check the operation state, make a [**Get operation**](/api/doc/cloud-controlplane/explorer/operation/operation-operationservice_getoperation) request with the `operation.id`.

## Next steps: try the Data Plane APIs

1. Retrieve your cluster's data plane API URL by making a **Get cluster** (BYOC, Dedicated) or **Get Serverless cluster** (Serverless) request in the API Explorer.
1. From the value of `dataplane_api.url` in the response body, save the subdomain (the part between ``https://` and `.cloud.redpanda.com`).
1. From the **Redpanda APIs** selector, go to **Cloud Data Plane API**.
1. Select an operation, for example **Create topic** or **List users**. 
1. In the URL field, add the data plane API URL. You can now make Data Plane API requests to your target cluster.

See also: [Data Plane API Quickstart](/api/doc/cloud-dataplane/topic/topic-quickstart)

## Suggested reading

- Learn about Redpanda Cloud [network security and connectivity](https://docs.redpanda.com/redpanda-cloud/networking/) for BYOC and Dedicated clusters.
- Manage [authentication and authorization](https://docs.redpanda.com/redpanda-cloud/security/authorization/) in Redpanda Cloud.
- [Create a Kafka client or generate a sample application](https://docs.redpanda.com/redpanda-cloud/get-started/cluster-types/serverless/#connect-with-your-cluster) to interact with your Serverless cluster.
