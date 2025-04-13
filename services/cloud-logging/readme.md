# Google Cloud Logging
## What is it?
Google Cloud Logging is a fairly catch-all logging solution that comes with a number of expandable components to allow you to configure it for use in a near limitless number of ways. Different solutions and companies require different logic, thresholds, alerting mechanisms and so forth and so it is designed to be as flexible as possible.
## Why use it?
Simply put, the best argument for using Cloud Logging is the fact that it is natively integrated with so many GCP services and is so flexible. Implementing another logging solution would be much more effort than simply leveraging this service. Did I mention that much of the core functionality is free?
## Related/Requisite Services

### StackDriver Suite

### Native Integrations
Most, if not all GCP services generate logs that are able to be interrogated, routed, stored, and acted upon by the Cloud Logging service. For example, GKE natively ships logs to Cloud Logging, both at a GKE API as well as Kubernetes API level which gives you excellent visibility into the health of your cluster without having to `kubectl` anything whatsoever.

### Notification Channels
Notification Channels are the native way of interacting with external services and form a core for Google's monitoring framework. They can work with both metrics and custom log filters and can be easily integrated with things like Slack, or email (if you are so inclined).

### Cloud Log Router
Based on log sources, and even log entry contents, you can use Log Router to configure log flow. This can be set at a project, folder and even organisation level such that you can aggregate, distribute and sort your logs based on your needs. For example, you can send logs from a particular Kubernetes namespace hosted in GKE to a set Logging Bucket in order to allow the Operations team in charge of that application/namespace to access them without needing to provide them direct access to the cluster (or even the cluster project!) in order to view them. 

### Logging Buckets
Logging buckets are, put simply, storage for your log entries. They should not be confused with GCS buckets as these are also valid storage destinations for logs being routed using Cloud Log Router, but are instead part of the Cloud Logging stack and can be interacted with as part of the Logging Console or API to view and filter logs without treating the log files as part of the standard GCS object storage framework.

### Log Exfiltration/Shipping