The Redpanda Cloud API uses HTTP codes to indicate the status of a request. The response payload also includes [additional error codes and descriptions](#error-codes-and-details) that provide more detail about why an operation failed.

Example request:

```bash
curl https://<dataplane_api_url>/topics | jq

Example response:

```json
{
  "code": "UNAUTHENTICATED",
  "message": "Bearer token is not present",
  "details": [
    {
      "@type": "google.rpc.ErrorInfo",
      "reason": "REASON_NO_TOKEN",
      "domain": "redpanda.com/dataplane",
      "metadata": {}
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

The Data Plane API returns a set of possible error codes that are mostly distinct from the possible Control Plane API error codes.

### Data Plane API error codes

| Reason | Description |
|--------|-------------|
| REASON_FEATURE_NOT_CONFIGURED | The feature is not configured. |
| REASON_CONSOLE_ERROR | Internal Redpanda Console or data plane error. |
| REASON_REDPANDA_ADMIN_API_ERROR | Redpanda Admin API returned an error. |
| REASON_KAFKA_API_ERROR | Redpanda or Kafka protocol error. |
| REASON_KAFKA_CONNECT_API_ERROR | Kafka Connect API error. |
| REASON_TYPE_MAPPING_ERROR | Type mapping error translating internal or external types to API types. |
| REASON_SECRET_STORE_ERROR | Cloud provider's secret store manager error. |