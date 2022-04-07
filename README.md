# gcp-pca-prep - Preparation for the GCP Professional Cloud Architect exam.
Repository of exercises used during my preparation for the Google Professional Cloud Architect certification. Includes case studies as of time of writing.

## Summary
Prior to starting any work on GCP I was primarily an AWS guy. I barely touched Azure, and as of the time of writing still don't have a huge amount of interest in doing so. After starting at Contino I was strongly encouraged to get familiar with GCP in order to build out capability to deliver GCP projects. This repository is a collection of Terraform configurations and notes that I am using in my study in the leadup to the PCA exam (I am also planning to take the Associate Cloud Engineer exam at around the same time).

These have been created in conjunction with Qwiklabs content and exercises and shouldn't replace them by any means, but perhaps act as a supplement if you are interested in getting familiar with writing GCP Terraform at the same time.


## Usage
The Terraform states for all examples are stored in GCS buckets generated in the `gcs/terraform/tf_state_buckets` directory - after all, why not generate these backends in GCP? You will need to make sure you have created a project to host this and update the static string in the `gcs/terraform/tf_state_buckets/backend.tf` file that informs of the name of the bucket, as well as have run `gcloud login` with some valid credentials to access this bucket. The exercises use the GCP provider configured with a service account impersonation flag, so it would be wise to set up a Terraform specific service account with the permission levels required. `Editor` should suffice, but you may want to lock this down more, or elevate it if you choose to do some more admin-y custom examples on top of those provided.

This project and bucket will need to be created manually as they are the base of this set of examples and exercises.

Once you've done the initial setup, you can create resources using the examples by treating the subdirectories as their own Terraform workspaces. That is, run `terraform init`, and optionally `terraform plan` to see the changes before running a `terraform apply`. You will need to provide a tfvars file for Terraform to use for these values (or enter them on the command line for each run).

## Adding Examples
All services contained in subdirectories in this repository have examples in Terraform. If you should wish to add more, you can run the `create_backends.sh` script found at the base level of the repository after having created a workspace folder in the relevant service directory - for example, `gcs/terraform/new-example`. This will create the appropriate GCS bucket to use for your backend configuration in the central state storage project.
