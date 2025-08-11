The Redpanda Cloud API uses OAuth 2.0 for authentication. The authentication method depends on whether you access the API in the browser using the API Explorer, or programmatically.

You only need to authenticate once to the Cloud API. That is, after you obtain an access token, you can use the same token in requests to both Control Plane and Data Plane API endpoints, for as long as the token is valid.

## Authenticate in API Explorer

When using the API Explorer in your browser, Redpanda Cloud uses the [OAuth 2.0 Implicit Flow](https://datatracker.ietf.org/doc/html/rfc6749#section-4.2):

1. Click **Get token** on any API endpoint.
2. Log in with your Redpanda Cloud credentials if prompted. After you log in, you are redirected back to the API Explorer.
3. The token is automatically applied to your API requests.

## Authenticate programmatic requests

For programmatic access (using a CLI, SDKs, and applications), the Cloud API uses the Client Credentials Flow as defined in [OAuth 2.0 RFC 6749, section 4.4](https://datatracker.ietf.org/doc/html/rfc6749#section-4.4).
 
You must first create a **service account** through which you can authenticate requests to the Cloud API. The service account is associated with your Redpanda Cloud organization. The service account acts as an OAuth 2.0 client that provides its credentials (client ID and client secret) to the API authentication server. The authentication server grants an access token in return. You can then include the access token in each request to the API.

The access token granted to you is associated with a specific Redpanda Cloud organization. If you want to use the API for a different organization, you must acquire a new token through a service account with that organization.

### Request an access token

Users with administrative privileges in a Redpanda Cloud organization can create a service account.

> **Note:** Service accounts have administrative privileges by default. Cloud user roles are not applied for the API.

1. On the [Service account](https://cloud.redpanda.com/organization-iam?tab=service-accounts) tab in the Organization IAM page of the Redpanda Cloud UI, click **Create service account**. Enter a name and description.

2. Copy and store the Client ID and Client Secret. These credentials cannot be viewed again after you close the dialog. 

3. Make a POST request to `https://auth.prd.cloud.redpanda.com/oauth/token` with the ID and secret in the request body. 

    ```bash
    curl -X POST "https://auth.prd.cloud.redpanda.com/oauth/token" \
      -H "content-type: application/x-www-form-urlencoded" \
      -d "grant_type=client_credentials" \
      -d "client_id=<client-id>" \
      -d "client_secret=<client-secret>"
    ```

    The request response provides an access token that remains valid for one hour.

### Use the access token in API requests

You must pass the access token in the authorization header of each API request: 

```bash
curl -H "Authorization: Bearer $YOUR_TOKEN"
```

> **Tip:** When using a shell substitution variable for the token, use double quotes to wrap the header value.