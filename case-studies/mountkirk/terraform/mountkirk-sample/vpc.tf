resource "google_compute_network" "gke_vpc" {
    name = "gke_network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "regional_subnet" {
    
}