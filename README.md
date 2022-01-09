# gcp-pca-prep
Repository of exercises used during my preparation for the Google Professional Cloud Architect certification.


## Usage
The Terraform states for all examples are stored in GCS buckets generated in the `gcs/terraform/tf_state_buckets` directory - after all, why not generate these backends in GCP? You will need to make sure you have created a project to host this and update the static string in the `gcs/terraform/tf_state_buckets/backend.tf` file that informs of the name of the bucket, as well as have run `gcloud login` with some valid credentials to access this bucket. The exercises use the GCP provider configured with a service account impersonation flag, so it would be wise to set up a Terraform specific service account with the permission levels required. `Editor` should suffice, but you may want to lock this down more, or elevate it if you choose to do some more admin-y custom examples on top of those provided.

This project and bucket will need to be created manually as they are the base of this set of examples and exercises.

Once you've done the initial setup, you can create resources using the examples by treating the subdirectories as their own Terraform workspaces. That is, run `terraform init`, and optionally `terraform plan` to see the changes before running a `terraform apply`. You will need to provide a tfvars file for Terraform to use for these values (or enter them on the command line for each run).

## Adding Examples
All services contained in subdirectories in this repository have examples in Terraform. If you should wish to add more, you can run the `create_backends.sh` script found at the base level of the repository after having created a workspace folder in the relevant service directory - for example, `gcs/terraform/new-example`.