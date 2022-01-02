resource "google_compute_network" "shared_network" {
  provider                = google.network
  name                    = "Shared VPC"
  description             = "Shared network for use in EHR solution."
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "shared_subnetwork" {
  provider      = google.network
  description   = "Shared subnetwork for use by GKE cluster."
  name          = "gke-shared-subnetwork"
  network       = google_compute_network.shared_network
  ip_cidr_range = "10.0.0.0/16"

  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = "192.168.0.0/21"
  }

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.8.0/21"
  }
}