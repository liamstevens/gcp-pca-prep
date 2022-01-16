variable "google_project" {
    type = string
    description = "GCP Project to provision resources into."
}

variable "tf_service_account_email" {
    type = string
    description = "Email of Terraform service account to use for resource provisioning."
}

variable "google_zone" {
    type = string
    description = "Zone to deploy resources in"
    default = "australia-southeast1-a"
}