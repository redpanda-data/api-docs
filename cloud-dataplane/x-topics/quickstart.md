The following steps describe how to authenticate with the Data Plane APIs and create a new topic. For more information on the Data Plane APIs, see the [Cloud API Overview](#topic-cloud-api-overview).

> **Note:** Redpanda Cloud uses a control plane and data plane architecture. To view the available endpoints for managing your clusters, networks, and resource groups, see the [Control Plane API Reference](/api/doc/cloud-controlplane).

## Requirements

To use the Data Plane APIs:

1. You must be a customer with an existing organization in Redpanda Cloud.
2. You can only use one organization for authentication.
3. You must have a running cluster in Redpanda Cloud. If you don't have an existing cluster, follow the Control Plane API Quickstart to create one. 

### Authenticate to the API from API Explorer

The API Explorer lets you interact with the API directly from the documentation. You can quickly explore available endpoints and try requests without setting up your own test environment.

To make Cloud API requests in your browser, you must obtain an access token. You can do so by clicking **Get token** on the API endpoint you want to call.

If you successfully retrieve an access token, it is valid for one hour. You can use the same token in requests to both Control Plane and Data Plane API endpoints, for as long as the token is valid.

> **Warning:** API requests from the API Explorer are executed against your actual environment and data, not a sandbox.

## Create a topic

1. In the subheader, open **API Explorer**.

1. If you don't already have the data plane API URL for your target cluster, make a Get Cluster (BYOC, Dedicated) or Get Serverless Cluster (Serverless) request with the Control Plane API. The response contains the data plane API URL.

   From the `dataplane_api.url` value in the response, extract only the subdomain (the part between `https://` and `.cloud.redpanda.com`). Enter this value in the Data Plane API URL field.

1. In the **Choose an operation** dropdown, select **Create topic**.

1. If you need a valid access token, click **Get token**. You may be prompted to log in to the Redpanda Cloud UI. After you log in, the browser automatically redirects you back to the Create topic endpoint in the API Explorer.

1. Enter a name for your topic and click **Send request**.

1. Confirm that your topic is successfully created by making a List topics request.

## Next steps

The quickest ways to produce to and consume from the topic are to use [`rpk`](https://docs.redpanda.com/redpanda-cloud/manage/rpk/rpk-install/) or the [Redpanda HTTP Proxy](/api/doc/http-proxy) (BYOC and Dedicated clusters only).

For example, to use `rpk` to produce to a topic named `test-topic`, run:

```
echo "hello world" | rpk topic produce test-topic
```

## Suggested reading

- Use the Data Plane APIs to do [common tasks](https://docs.redpanda.com/redpanda-cloud/manage/api/cloud-dataplane-api) in your cluster such as create a user or use Redpanda Connect.
- See the [`rpk topic produce`](https://docs.redpanda.com/redpanda-cloud/reference/rpk/rpk-topic/rpk-topic-produce/) reference.
- See the [`rpk topic consume`](https://docs.redpanda.com/redpanda-cloud/reference/rpk/rpk-topic/rpk-topic-consume/) reference.

