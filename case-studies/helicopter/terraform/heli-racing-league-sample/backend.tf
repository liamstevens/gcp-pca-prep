terraform {
  backend "gcs" {
    bucket = "heli-racing-league-sample-gcp-pca-prep"
    prefix = "terraform/state"
  }
}

provider "google" {
  alias = "presentation"
  project = google_project.presentation.id
}