variable "cluster_location" {
  type        = string
  description = "The location of the zonal cluster"
  default     = "australia-southeast1-a"
}

variable "shared_vpc_id" {
  type        = string
  description = "The ID of the Shared VPC to use in cluster creation."
}