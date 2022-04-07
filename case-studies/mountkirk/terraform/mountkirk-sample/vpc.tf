resource "google_compute_network" "gke_vpc" {
    name = "gke_network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "regional_subnet" {
    for_each = toset(var.regions)
    name = each.value.name
    ip_cidr_range = each.value.cidr
    secondary_ip_range  {
        range_name = "pod_range"
        ip_cidr_range = each.value.secondary_ip_range.pod_range
    }
    secondary_ip_range  {
        range_name = "services_range"
        ip_cidr_range = each.value.secondary_ip_range.services_range
    }
}