# Cloud BigTable

## What is it?
Cloud BigTable is a fully managed, higly scalable NoSQL database. It is used internally a lot at Google for their products. It builds on the HBase API and has native support for it.
## Why use it?
Cloud BigTable is great for applications that need access to data that suits a classic NoSQL database structure - single key lookups. It is often used as a hash store. You should use it when you need high performance data read/writes and cannot guarantee that the data will comply with a given schema (otherwise you'd be looking at a relational database!)
## Related/Requisite Services

### BigQuery
BigQuery has native integrations that you can use to connect it to BigTable in order to perform analytics on your BigTable entries as part of your data warehouse.

### Compute Engine/GKE/Cloud Functions
GCE, GKE and Cloud Functions are all good candidates for compute to attach to your Cloud BigTable instances in order to use the data being stored there.