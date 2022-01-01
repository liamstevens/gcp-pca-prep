terraform {
  backend "gcs" {
    bucket  = "tf-state-gcp-pca-prep"
    prefix  = "terraform/state"
  }
}

provider "google" {
    project = var.state_storage_project
    #impersonate_service_account = var.sa_email
    credentials = file(var.sa_creds)
}

# resource "google_project_service" "iam_credentials" {
#     project = var.state_storage_project
#     service = "iamcredentials.googleapis.com"
# }

# resource "time_sleep" "wait_30_seconds" {
#   depends_on = [google_project_service.iam_credentials]

#   create_duration = "30s"
# }
