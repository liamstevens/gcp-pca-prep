terraform {
  backend "gcs" {
    bucket  = "tf-state"
    prefix  = "terraform/state"
  }
}

provider "google" {
    project = var.state_storage_project
    impersonate_service_account = var.sa_email
    credentials = var.sa_creds
}