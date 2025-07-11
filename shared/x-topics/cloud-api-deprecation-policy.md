# Cloud API Deprecation Policy

This document outlines the Cloud API deprecation and versioning policy. As Redpanda introduces improvements, addresses security concerns, and updates the technology stack, it is sometimes necessary to deprecate older versions or features of the Redpanda Cloud API. Redpanda adheres to this policy to maintain a balance between innovation and stability, ensuring the best possible experience for customers and partners. 

For questions and concerns regarding this policy, contact your Customer Success Manager. You can also post questions in [Redpanda Community Slack](https://redpanda.com/slack).

## Definitions

Deprecation is the process of phasing out an API version or specific features within an API. At the end of the deprecation period, these versions or features no longer receive updates, support, or guarantees of availability, and they are no longer usable.

The Cloud API availability phases are defined as follows: 

* Generally available (GA): The API version is stable and does not include breaking changes. Recommended for production usage. 
* Deprecated: The API version or method is no longer under active development. Existing workflows and integrations using the API continue to function, but new use cases should be built against the new version. The deprecated API version or method is retired on the retirement date. 
* Retired: The API version or method is no longer supported nor available.

## Deprecation notice and timelines

Redpanda provides a formal deprecation notice to users when an API version or API method is scheduled for deprecation. This notice includes:

* The specific API version or method to be deprecated.
* The reason for deprecation.
* The deprecation timeline, including key dates:
  * Announcement date: The date when the deprecation is officially announced. The API version or method remains available through the end-of-support date, until the retirement date.
  * End-of-Support date: The last date the deprecated API version or call is supported. The API is available, but is not under active development and no longer receives support. This date is six months after the announcement date. Users have a transition period between the announcement date and the retirement date to migrate to new API versions or methods.
  * Retirement date: The date when the deprecated API or feature is removed and no longer available. This date is 12 months after the announcement date.

Starting from the retirement date, calls to the deprecated API version or method may:

* Be rejected with appropriate error codes.
* Result in degraded performance.
* Result in unexpected behavior.

> **Tip:** To avoid disruption, you are encouraged to monitor usage of deprecated methods and update integrations promptly.

### Exceptions to standard timeline

In rare cases, the deprecation process may need to be accelerated. For example:

* Critical security vulnerabilities
* Compliance requirements
* External infrastructure changes beyond Redpanda Data's control

## Notification channels

Redpanda communicates deprecation notices through the following:

* A `Sunset` HTTP header in the response 
* A `deprecated: true` field in the operation or parameter in the API specification
* Updates to Cloud API documentation
* [What's New in Redpanda Cloud](https://docs.redpanda.com/redpanda-cloud/get-started/whats-new-cloud)
* Announcements in the #cloudapi [Community Slack](https://redpandacommunity.slack.com/) channel and in individual customer channels
* Emails to "Sign up for updates" recipients (sign up on the [Control Plane API](/api/ROOT/cloud-controlplane-api) and [Data Plane APIs](/api/ROOT/cloud-dataplane-api) reference documentation)

## Versioning policy

Redpanda Cloud API versions are denoted in the API URL with the following format: `vX`. For example: `v1`. The version number is incremented when there are breaking changes to the API.

The Control Plane API and Data Plane API may be versioned independently of each other, and individual components may have a different version number than the base API, such as RBAC (IAM).

### Breaking changes

* Renaming a field
* Changing a field data type
* Renaming a method or service 
* Removing a method or service