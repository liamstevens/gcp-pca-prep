variable "organisation_id" {
    description = "The ID of the parent organisation for folders and projects."
    type = string
}

variable "billing_id" {
    description = "The ID of the billing account to attach to child projects."
    type = string
}

###GKE Vars
variable "gke_cluster_name" {
  description = "Name of the GKE cluster for Green deployment"
  type        = string
}


variable "cluster_location" {
  description = "Region to run cluster in."
  type        = string
}

variable "gke_sa_id" {
  description = "The ID of the Service Account used by GKE."
  type        = string
}

variable "shared_vpc_project_id" {
  description = "The ID of the project where the shared VPC is deployed."
  type        = string
}

variable "shared_vpc_network_id" {
  description = "The ID of the network within shared VPC that will be used."
  type        = string
}

variable "shared_vpc_subnetwork_id" {
  description = "The ID of the subnetwork within shared VPC that will be used for Green deployment."
  type        = string
}


variable "shared_vpc_subnetwork_services_secondary_range_name" {
  description = "The secondary IP range name of subnet for services for Green deployment."
  type        = string
}



variable "shared_vpc_subnetwork_cluster_secondary_range_name" {
  description = "The secondary IP range name of subnet for cluster for Green deployment."
  type        = string
}


variable "node_type" {
  description = "The type of node to use in the shared GKE cluster. Includes family as well as type."
  type        = string
}

variable "node_size" {
  description = "The sizing of node to use in the shared GKE cluster."
  type        = string
}

variable "initial_node_count" {
  description = "The initial number of nodes for each zone."
  type        = number
}

variable "min_node_count" {
  description = "The minimum number of nodes for each zone. Must be >= 0 and <= max_node_count."
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "The maximum number of nodes for each zone. Must be >= min_node_count"
  type        = number
  default     = 1
}

variable "pool_size" {
  description = "The number of nodes in the shared cluster node pool. This defaults to 3 in order to have 1 per zone."
  type        = number
  default     = 3
}

variable "node_image" {
  description = "Image to run on cluster node pool."
  type        = string
  default     = "COS_CONTAINERD"
}

variable "shielded_config" {
  description = "The shielded node configuration for the node pool."
  type        = bool
  default     = true
}

variable "sandbox_config" {
  description = "Whether or not to enable GKE sandboxing. Set to true for untrusted code or in perimiter clusters."
  type        = bool
  default     = false
}

variable "node_pool_name" {
  description = "Name to be assigned to GKE Node Pool for Green deployment."
  type        = string
}


variable "maximum_pods_per_node" {
  description = "Maximum number of pods per node to be running."
  type        = number
}

variable "master_cidr_block" {
  description = "CIDR block reserved for GKE master plane in a private cluster"
  type        = string
  default     = ""
}

variable "master_authorized_cidr_blocks" {
  type = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []
}

variable "service_account_bindings" {
  type = list(object({
    sa_email = string
    roles    = list(string)
  }))
}

variable "provider_location" {
  description = "Location of the provider"
  type        = string
}

variable "release_channel" {
  description = "Release channel to use for GKE version upgrades. Use REGULAR for non production and STABLE for production clusters."
  default = "STABLE"
}
