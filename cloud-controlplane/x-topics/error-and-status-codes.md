# Control Plane API Error and Status Codes

The Redpanda Cloud API uses HTTP codes to indicate the status of a request. The response payload also includes [additional error codes and descriptions](#error-codes-and-details) that provide more detail about why an operation failed.

Example request:

```bash
curl https://api.redpanda.com/v1/clusters | jq
```

Example response:

```json
{
  "code": "UNAUTHENTICATED",
  "message": "Bearer token is not present",
  "details": [
    {
      "@type": "google.rpc.ErrorInfo",
      "reason": "REASON_NO_TOKEN",
      "domain": "redpanda.com/controlplane",
      "metadata": {}
    },
    {
      "@type": "google.rpc.Help",
      "links": [
        {
          "description": "Please ensure you have a valid token to authenticate against the API. If you don't have a token, create a client and follow the instructions to request a token.",
          "url": "https://cloud.redpanda.com/clients"
        }
      ]
    }
  ]
}
```

## HTTP response codes

A `2xx` HTTP status code indicates that a request is successful:

- `200` OK. Request was successful.
- `201` Created. The requested resource was successfully created.
- `202` Accepted. The request is accepted and is processing, for example for a long-running operation.
- `204` No content. Usually returned by a successful delete request.

The following HTTP status codes indicate errors:

- `400` Bad request. There is an error that must be fixed in the request, such as an invalid parameter value. Attempt the request again after it is fixed.
- `401` Unauthenticated. The authentication credentials are missing or invalid.
- `404` Not found. The specified resource was not found.
- `409` Conflict. Usually returned when the resource to be created by the request already exists.
- `500` Internal server error. Reach out to Redpanda support.

## Error codes and details

The response payload contains additional error details: a [gRPC status code](https://grpc.io/docs/guides/status-codes/), and an error message that contains further details. 

The Control Plane API returns a set of possible error codes that are mostly distinct from the possible Data Plane API error codes.

### Control Plane API error codes

| Reason | Description |
|--------|-------------|
| REASON_ZONE_NOT_SUPPORTED_BY_NETWORK | Cluster zones must be a subset of network zones. |
| REASON_INSUFFICIENT_QUOTA | Insufficient quota to create requested resource. |
| REASON_DISABLING_MTLS_NOT_SUPPORTED | Disabling mTLS is not supported. |
| REASON_UNSUPPORTED_VERSION | The requested Redpanda version is not supported. |
| REASON_NETWORK_ALREADY_EXISTS | Network name is already in use by another network within the organization. |
| REASON_REGION_NOT_FOUND | Region with given name not found. |
| REASON_NO_TOKEN | No token provided. |
| REASON_TOKEN_EXPIRED | Provided API token has expired. |
| REASON_TOKEN_INVALID | Provided API token is invalid. |
| REASON_CLUSTER_TYPE_MISMATCH | Cluster type and specified network do not match. |
| REASON_ONLY_ONE_CLUSTER_PER_NETWORK_ALLOWED | Only one cluster per network is allowed. Placing additional clusters is not yet supported. This restriction will be lifted in the future. |
| REASON_INVALID_INPUT | Generic input validation error. Refer to `BadRequest` error details. |
| REASON_NETWORK_NOT_READY | Network is not in `READY` state, which is required to create a cluster. |
| REASON_CLUSTER_NETWORK_REGION_MISMATCH | Cluster and specified network region do not match. |
| REASON_THROUGHPUT_TIER_NOT_FOUND | Requested throughput tier does not exist. |
| REASON_RESOURCE_GROUP_NOT_EMPTY | Namespace already contains resources. |
| REASON_CLUSTER_NETWORK_CLOUD_PROVIDER_MISMATCH | Cluster and specified network have different cloud providers. |
| REASON_THROUGHPUT_TIER_NOT_AVAILABLE_IN_REGION | Requested throughput tier not available in specified region or cluster type. |
| REASON_CLOUD_PROVIDER_STOCKOUT | Cloud provider lacks capacity for the requested machine type. |
| REASON_CLOUD_PROVIDER_MACHINE_TYPE_UNSUPPORTED_IN_ZONE | Cloud provider does not support the machine type in specified zone. |
| REASON_CLOUD_PROVIDER_QUOTA_EXCEEDED | Cloud provider quota has been exceeded. |
| REASON_NETWORK_CONTAINS_CLUSTERS | Network still contains clusters. Only empty networks can be deleted. |
| REASON_RATE_LIMIT_EXCEEDED | Rate limit exceeded. Reduce request rate. |
| REASON_INVALID_PAGE_TOKEN | Provided page token is invalid. |
| REASON_PAGE_TOKEN_FILTER_MISMATCH | Page token filter does not match. |
| REASON_PRODUCT_NOT_SUPPORTED_BY_SUBSCRIPTION | Current subscription does not support the requested product. |
| REASON_NOT_AVAILABLE_CAPACITY_FOR_CLOUD_PROVIDER | Not enough capacity for the requested cloud provider. |
| REASON_RESOURCE_GROUP_NOT_FOUND | Namespace not found. |
| REASON_RESOURCE_GROUP_ALREADY_EXISTS | Namespace already exists. |
| REASON_REMOTE_REPLICA_NOT_FOUND | Target cluster not found. |
| REASON_REMOTE_REPLICA_INVALID_ORGANIZATION | Remote read replica cluster does not match a valid organization. |
| REASON_REMOTE_REPLICA_INVALID_STATE | Remote read replica cluster is in invalid state. |
| REASON_REMOTE_REPLICA_INVALID_CLOUD_PROVIDER | Remote read replica cluster has invalid cloud provider. |
| REASON_REMOTE_REPLICA_INVALID_CLOUD_ACCOUNT | Remote read replica cluster has invalid cloud account. |
| REASON_REMOTE_REPLICA_INVALID_REGION | Remote read replica cluster has invalid region. |
| REASON_REMOTE_REPLICA_INVALID_VERSION | Remote read replicas cluster has invalid version. |
| REASON_REMOTE_REPLICA_INVALID_TYPE | Remote read replicas cluster has invalid type. |
| REASON_REMOTE_REPLICA_SAME_AS_SOURCE | Remote read replica cannot be the same as the source cluster. |
| REASON_REMOTE_REPLICA_CYCLE | Remote read replica may not list the source cluster as a replica of itself. |
| REASON_REMOTE_REPLICA_INVALID_DELETION | Source cluster cannot be deleted if it has read replicas. |