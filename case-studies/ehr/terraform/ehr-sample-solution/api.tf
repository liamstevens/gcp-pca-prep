resource "google_project_service" "gke_compute" {
  project = google_project.compute_project.id
  service = "compute.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_identity" {
  project = google_project.compute_project.id
  service = "iam.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_monitoring" {
  project = google_project.compute_project.id
  service = "monitoring.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_gcs" {
  project = google_project.compute_project.id
  service = "storage-component.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

#### Analytics Project ####
resource "google_project_service" "gke_gcs" {
  project = google_project.analytics_project.id
  service = "storage-component.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}