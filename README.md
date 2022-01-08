# gcp-pca-prep
Repository of exercises used during my preparation for the Google Professional Cloud Architect certification.


## Usage
The Terraform states for all examples are stored in GCS buckets generated in the `gcs/terraform/tf_state_buckets` directory - after all, why not generate these backends in GCP? You will need to make sure you have created a project to host this and update the static string in the `gcs/terraform/tf_state_buckets/backend.tf` file that informs of the name of the bucket, as well as have run `gcloud login` with some valid credentials to access this bucket.

The project and bucket will need to be created manually as they are the base of this set of examples and exercises.

## Adding Examples
All services contained in subdirectories in this repository have examples in Terraform. If you should wish to add more, you can run the `create_backends.sh` script found at the base level of the repository after having created a workspace folder in the relevant service directory - for example, `gcs/terraform/new-example`.