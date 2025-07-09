# Long-running Operations in Redpanda Cloud

Some Cloud API endpoints do not directly return the resource itself, but instead return an operation. These operations may be long-running, meaning they may not complete immediately and can take several seconds or minutes to finish. Examples include creating or deleting clusters and networks, and updating cluster properties. Long-running operations are asynchronous and return a response indicating that the request has been accepted and is being processed.

When you initiate a long-running operation, the API responds with a status code such as `202 Accepted` and includes an operation ID. The following is an example response of Create Cluster:

```json
{
    "operation": {
        "id": "cqfc6vdmvio001r4vu4",
        "metadata": {
            "@type": "type.googleapis.com/redpanda.api.controlplane.v1.CreateClusterMetadata",
            "cluster_id": "cqg168balf4e4pm8ptu"
        },
        "state": "STATE_IN_PROGRESS",
        "started_at": "2024-07-23T20:31:29.948Z",
        "type": "TYPE_CREATE_CLUSTER",
        "resource_id": "cqg168balf4e4pm8ptu"
    }
}
```

You can use the operation ID to poll the status of the operation or check for completion.

## Work with long-running operations

1. Send the request to start a long-running operation (for example, create a network).
2. Receive a response with an operation ID.
3. Poll the Get Operation endpoint using the provided ID.
4. Check for completion. When the operation is complete, the status will indicate success or failure, and any resulting resources will be available for next steps in your workflow (for example, using a newly-created network to create a cluster).

## Best practices

- Always check the operation status before assuming completion.
- Handle possible statuses `STATE_IN_PROGRESS`, `STATE_COMPLETED`, and `STATE_FAILED`.
- Review API documentation for specific endpoints that support long-running operations and their status-checking mechanisms.

For more details, refer to the Get Operation endpoint reference or the relevant endpoint reference.
