##### GKE Service Project #####
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

resource "google_project_service" "gke_logging" {
  project = google_project.compute_project.id
  service = "logging.googleapis.com"
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

resource "google_project_service" "gke_service_networking" {
  project = google_project.compute_project.id
  service = "servicenetworking.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_containers" {
  project = google_project.compute_project.id
  service = "container.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_container_scanning" {
  project = google_project.compute_project.id
  service = "containerscanning.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_container_analysis" {
  project = google_project.compute_project.id
  service = "containeranalysis.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

#### Analytics Project ####
resource "google_project_service" "analytics_gcs" {
  project = google_project.analytics_project.id
  service = "storage-component.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "analytics_bigquery" {
  project = google_project.analytics_project.id
  service = "bigquery.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "analytics_logging" {
  project = google_project.analytics_project.id
  service = "logging.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

##### Identity Sync Project #####

resource "google_project_service" "identity_compute" {
  project = google_project.identity_project.id
  service = "compute.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "identity_iam" {
  project = google_project.identity_project.id
  service = "iam.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "identity_service_networking" {
  project = google_project.identity_project.id
  service = "servicenetworking.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "identity_cloud_identity" {
  project = google_project.identity_project.id
  service = "cloudidentity.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

##### VPC Host Project #####
resource "google_project_service" "vpc_service_networking" {
  project = google_project.network_project.id
  service = "servicenetworking.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "vpc_network_management" {
  project = google_project.network_project.id
  service = "networkmanagement.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "vpc_dns" {
  project = google_project.network_project.id
  service = "dns.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

