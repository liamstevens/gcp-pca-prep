terraform {
  backend "gcs" {
    bucket = "ehr-sample-solution-gcp-pca-prep"
    prefix = "terraform/state"
  }
}

provider "google" {
  alias   = "network"
  project = google_project.network_project.id
  region  = var.cluster_location
}

provider "google" {
  alias   = "compute"
  project = google_project.compute_project.id
  region  = var.cluster_location
}

provider "google-beta" {
  alias   = "network"
  project = google_project.network_project.id
  region  = var.cluster_location
}

provider "google-beta" {
  alias   = "compute"
  project = google_project.compute_project.id
  region  = var.cluster_location
}

provider "google" {
  alias   = "analytics"
  project = google_project.analytics_project.id
  region  = var.cluster_location
}


provider "google-beta" {
  alias   = "analytics"
  project = google_project.analytics_project.id
  region  = var.cluster_location
}

provider "google" {
  alias   = "database"
  project = google_project.database_project.id
  region  = var.cluster_location
}


provider "google-beta" {
  alias   = "database"
  project = google_project.database_project.id
  region  = var.cluster_location
}

provider "google" {
  alias   = "identity"
  project = google_project.identity_project.id
  region  = var.cluster_location
}


provider "google-beta" {
  alias   = "identity"
  project = google_project.identity_project.id
  region  = var.cluster_location
}