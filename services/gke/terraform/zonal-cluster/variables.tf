variable "cluster_location" {
  type        = string
  description = "The location of the zonal cluster"
  default     = "australia-southeast1-a"
}

variable "shared_vpc_id" {
  type        = string
  description = "The ID of the Shared VPC to use in cluster creation."
}

variable "master_cidr_block" {
    type = string
    description = "A CIDR block to be used for the control plane (it must be a /28 subnet)"
}