resource "google_container_cluster" "shared_vpc_cluster_blue" {
  name                      = var.gke_cluster_name
  location                  = var.cluster_location
  provider                  = google-beta.compute
  network                   = google_compute_network.shared_network.id
  subnetwork                = google_compute_subnetwork.shared_subnetwork_blue.id
  enable_shielded_nodes     = var.shielded_config
  remove_default_node_pool  = true
  initial_node_count        = var.initial_node_count
  default_max_pods_per_node = var.maximum_pods_per_node

  node_config {
    service_account = "${var.gke_sa_id}@${var.google_project_id}.iam.gserviceaccount.com"
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

  /******************************************
  The security account is not ready yet
  as of 11/10/2021
 *****************************************/

  # authenticator_groups_config {
  #   security_group          = var.gke_security_groups_email
  # }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.shared_vpc_subnetwork_cluster_secondary_range_name_blue
    services_secondary_range_name = var.shared_vpc_subnetwork_services_secondary_range_name_blue
  }

  vertical_pod_autoscaling {
    enabled = true
  }
  release_channel {
    channel = var.release_channel
  }
}

resource "google_container_node_pool" "default_node_pool_blue" {
  name               = var.node_pool_name_blue
  location           = var.cluster_location
  provider           = google
  cluster            = google_container_cluster.shared_vpc_cluster_blue.name
  initial_node_count = var.initial_node_count
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
  max_pods_per_node = var.maximum_pods_per_node
  node_config {
    /* Disabled temporarily as sandboxing is not currently advised
    sandbox_config {
      sandbox_type = var.sandbox_config == true ? "gvisor" : null
    }*/
    machine_type    = "${var.node_type}-${var.node_size}"
    image_type      = var.node_image
    service_account = "${var.gke_sa_id}@${var.google_project_id}.iam.gserviceaccount.com"
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
    google_project_iam_member.default
  ]
}