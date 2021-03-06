 variable "tf_buckets" {
    description = "Names of all TF state buckets to be created."
    type = list(string)
}

variable "state_storage_project" {
  description = "Project ID for buckets to be created in."
  type = string
}

variable "sa_email" {
  description = "Email of Terraform service account"
  type = string
}

variable "sa_creds" {
  description = "Location of literal contents of SA credentials file for use."
  type = string
}

variable "suffix" {
  description = "Suffix to append to state buckets for global uniqueness."
  type = string
}