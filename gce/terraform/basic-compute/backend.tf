terraform {
  backend "gcs" {
    bucket  = "basic-compute--gcp-pca-prep"
    prefix  = "terraform/state"
  }
}

provider "google" {
    project = var.google_project
    impersonate_service_account = var.tf_service_account_email
}