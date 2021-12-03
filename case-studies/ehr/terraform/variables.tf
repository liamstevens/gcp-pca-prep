variable "organisation_id" {
    description = "The ID of the parent organisation for folders and projects."
    type = string
}

variable "billing_id" {
    description = "The ID of the billing account to attach to child projects."
    type = string
}