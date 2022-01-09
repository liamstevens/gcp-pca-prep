variable "google_project" {
    type = string
    description = "GCP Project to provision resources into."
}

variable "tf_service_account_email" {
    type = string
    description = "Email of Terraform service account to use for resource provisioning."
}