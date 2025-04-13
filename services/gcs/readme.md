# Google Cloud Storage (GCS)

## What is it?
GCS is quite similar to the widely used and loved S3 service from AWS - it is an object-based storage service, billed by the GB, has the concept of buckets, the ability to configure lifecycle management, access control configurations - the comparisons could last all day. The key takeaway from and AWS background is that they are very similar. However GCS does offer some "premium" S3 configurations as standard.
## Why use it?
GCS offers a simple, flexible solution that can act as a no-frills storage and backup solution or a full data life cycle management system in addition to pretty much everything inbetween. All of Google's serverless offerings work excellently with GCS. You can use it to store code pipeline artifacts, and it even works exceptionally well as a remote state store for Terraform due to its native, default object locking.