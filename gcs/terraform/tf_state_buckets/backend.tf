terraform {
  backend "gcs" {
    bucket  = "tf-state-gcp-pca-prep"
    prefix  = "terraform/state"
  }
}

provider "google" {
    project = var.state_storage_project
    credentials = file(var.sa_creds)
}
