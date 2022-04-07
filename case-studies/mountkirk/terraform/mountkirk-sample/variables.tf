variable "regions" {
    type = list(object({
        name = string
        cidr = string
        secondary_ip_range = object({
            pod_range = string
            services_range = string
        })
    }))
    description = "List of regions to deploy subnetworks and GKE node pools into."
}

variable "base_node_count" {
  type = number
  default = 1
  description = "Minimum node count for node pools."
}

variable "env" {
  type = string
  description = "Environment to be creating resources to - for example, dev, uat, or prod."
}