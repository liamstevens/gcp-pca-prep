# IAM

## What is it?
Identity and Access Management (IAM) is the service to solve the problem of the same name within GCP. IAM is intended to allow you to provision and restrict access to services, resources, and in the case of GKE, even Kubernetes API level objects. You have full ability to control the WHO (the user), WHAT (the service), WHICH (the resource within the service), and even with advanced configuration, the HOW (where the requests originate from, what auth methods are allowed, etc.). 

You cannot grant permissions to identity principals in GCP IAM, rather this must be done via role. Google provide a (number of basic roles)[https://cloud.google.com/iam/docs/understanding-roles] that are useful for most purposes. If you require additional restrictions, such as to specific resources, you can create custom roles to be used for this purpose. 

## Why use it?
You can't avoid it. IAM is crucial to the management and access control components to GCP. What you can do is decide in what way to use it. This could be through manually created users, management through a Google Organisation, service accounts and more. See below for some examples.

## Requisite/Related Services

### User Accounts
User accounts are the most basic form of access that you can provision. These are, in their most basic form, a Google account with roles within your project (or organisation) applied to it. Users log in using their same Google account credentials and can use these to interact with GCP resources as defined by the roles they have.

### Service Accounts

### Identity Federation

### Workload Identity
Workload Identity is a GKE specific identity concept that allows you to create a mapping between a Kubernetes service account and a Google service account, which allows your pods to run as if they are being run by the GCP service account identity. This means that they can access GCP services and APIs without the need for credentials coded into the application (or fetched from another service such as a credential vault). Simply configure the mapping and the pods are able to make an identity claim natively.

### Security Perimeters