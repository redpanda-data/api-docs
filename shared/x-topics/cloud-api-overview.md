# Redpanda Cloud API Overview

The Redpanda Cloud API is a collection of REST APIs that allow you to interact with different parts of Redpanda Cloud. You can call the API endpoints directly, or use tools like Terraform or Python scripts to automate cluster management and manage Redpanda Cloud resources.

## Requirements

To use the Cloud API:

- You must have a Redpanda Cloud account.
- You can only use one organization for authentication. See Authentication for steps to authenticate API requests.
- Serverless: To try the Cloud API with Serverless, [sign up for a free Standard trial](https://redpanda.com/cloud/serverless).

## Cloud API architecture

Redpanda Cloud uses a control plane and data plane architecture. The **control plane** is where most cluster management, operations, and maintenance takes place. The control plane enforces rules in the data plane. The **data plane** is where your cluster lives. The term _data plane_ is used interchangeably with _cluster_. For BYOC customers, the data plane is in your VPC. To learn more about the Redpanda Cloud platform, see the [Cloud Overview](https://docs.redpanda.com/docs/cloud/cloud-overview/).

The **Control Plane API** allows you to interact with the control plane. You use the Control Plane API to manage cloud resources for your organization, like clusters, resource groups, and networks. The Control Plane API does not interact directly with Redpanda clusters, although some of the actions performed through the API can eventually make their way to a cluster. See [Use the Control Plane API](https://docs.redpanda.com/docs/manage/api/controlplane/) for steps to create and delete clusters.

The **Data Plane APIs** are a collection of APIs through which you can perform actions directly against a Redpanda cluster. These APIs expose more high-level operations on the data plane by acting as a wrapper around the other APIs supported by Redpanda (Kafka API, Admin API, or Schema Registry API). See [Use the Data Plane APIs](https://docs.redpanda.com/docs/manage/api/cloud-dataplane-api/) for steps to create an access-control list (ACL), topic, or connector.

See also:

- [Redpanda API and SDK Reference documentation](https://docs.redpanda.com/reference/api-reference/)

## Base URLs

The Control Plane and Data Plane APIs are independent of each other. The Cloud API URL is distinct from the Data Plane API URLs.

### Control Plane API URL

The Control Plane API has a base URL that is the same for any organization:

```
https://api.redpanda.com
```

When making requests to the Control Plane API endpoints, the request URL is the base URL, plus the API version, plus the resource path. For example:

```bash
https://api.redpanda.com/v1/clusters
```

The current Control Plane API version is **v1**.

> **Important:** The Control Plane API versions v1beta1 and v1beta2 are deprecated. v1beta1 and v1beta2 are still available, but they will be removed in a future release and are not recommended for use.
>
> The deprecation timeline is:
>
> - Announcement date: May 27, 2025
> - End-of-support date: November 28, 2025
> - Retirement date: May 28, 2026
>
> See Deprecation Policy for more information.

### Data Plane APIs URL

The Data Plane API base URL is unique to the individual target cluster. It is different for each cluster. When making requests to the Data Plane API endpoints, the request URL is the base URL, plus the API version, plus the resource path. For example:

```bash
https://api-aeb32d9b.cn20bu40d061nvem7sv0.fmc.prd.cloud.redpanda.com/v1/users
```

The current Data Plane API version is **v1**.

> **Important:** The Data Plane API versions v1alpha1 and v1alpha2 are deprecated. v1alpha1 and v1alpha2 are still available, but they will be removed in a future release and are not recommended for use.
>
> The deprecation timeline is:
>
> - Announcement date: May 27, 2025
> - End-of-support date: November 28, 2025
> - Retirement date: May 28, 2026
>
> See Deprecation Policy for more information.

## Pagination

When an endpoint returns a list containing more items than can be returned in a single response, the response object includes a `next_page_token`. You can pass the token value as a parameter in the next request. When the full list has been returned, `next_page_token` is an empty string.

## Versioning and deprecation

The Cloud API Deprecation Policy outlines the process for phasing out an API version or specific features within an API. See Deprecation Policy for details.
