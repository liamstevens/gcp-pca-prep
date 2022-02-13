resource "google_container_cluster" "shared_vpc_cluster" {
  name                      = var.gke_cluster_name
  location                  = var.cluster_location
  provider                  = google-beta.compute
  network                   = google_compute_network.shared_network.id
  subnetwork                = google_compute_subnetwork.shared_subnetwork.id
  enable_shielded_nodes     = var.shielded_config
  remove_default_node_pool  = true
  initial_node_count        = var.initial_node_count
  default_max_pods_per_node = var.maximum_pods_per_node

  node_config {
    service_account = "${var.gke_sa_id}@${google_project.compute_project}.iam.gserviceaccount.com"
  }

  lifecycle {
    ignore_changes = ["node_config"]
  }

  dynamic "private_cluster_config" {
    for_each = var.master_cidr_block != "" ? [1] : []
    content {
      enable_private_endpoint = true
      enable_private_nodes    = true
      master_ipv4_cidr_block  = var.master_cidr_block
    }
  }

  dynamic "private_cluster_config" {
    for_each = var.master_cidr_block == "" ? [1] : []
    content {
      enable_private_endpoint = false
      enable_private_nodes    = false
    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = length(var.master_authorized_cidr_blocks) != 0 ? [1] : []

    content {
      dynamic "cidr_blocks" {
        for_each = var.master_authorized_cidr_blocks

        content {
          cidr_block   = cidr_blocks.value.cidr_block
          display_name = cidr_blocks.value.display_name
        }
      }
    }
  }

   authenticator_groups_config {
     security_group          = var.gke_security_groups_email
   }

  ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_network.shared_subnetwork.secondary_ip_range.0.range_name
    services_secondary_range_name = google_compute_network.shared_subnetwork.secondary_ip_range.1.range_name
  }

  vertical_pod_autoscaling {
    enabled = true
  }
  release_channel {
    channel = var.release_channel
  }
}

resource "google_container_node_pool" "default_node_pool" {
  name               = var.node_pool_name
  location           = var.cluster_location
  provider           = google
  cluster            = google_container_cluster.shared_vpc_cluster.name
  initial_node_count = var.initial_node_count
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
  max_pods_per_node = var.maximum_pods_per_node
  node_config {
    machine_type    = "${var.node_type}-${var.node_size}"
    image_type      = var.node_image
    service_account = google_service_account.node
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }

  timeouts {
    create = "40m"
    update = "30m"
  }
  depends_on = [
    google_project_iam_member.node
  ]
}

resource "google_service_account" "node" {
  account_id   = var.gke_sa_id
  display_name = "GKE Service Account"
}


resource "google_project_iam_member" "node" {
  for_each = concat(local.base_gke,var.additional_roles)
  project = google_project.compute_project
  member = google_service_account.node
  role = each.value
}