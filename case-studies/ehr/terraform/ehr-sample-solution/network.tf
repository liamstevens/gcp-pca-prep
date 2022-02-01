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

resource "google_compute_interconnect_attachment" "on_prem" {
  name                     = "on-prem-attachment"
  edge_availability_domain = "AVAILABILITY_DOMAIN_1"
  type                     = "PARTNER"
  router                   = google_compute_router.central_router.id
  mtu                      = 1500
}

resource "google_compute_router" "central_router" {
  name    = "router"
  network = google_compute_network.foobar.name
  bgp {
    asn = 16550
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "egress-nat"
  router                             = google_compute_router.central_router
  region                             = google_compute_router.central_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}