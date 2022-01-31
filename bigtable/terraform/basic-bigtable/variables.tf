variable "bigtable_table_name" {
    type = string
    description = "Name of Bigtable instance."
}

variable "google_project_id" {
    type = string
    description = "Google project to deploy to."
}

variable "google_region" {
    type = string
    description = "Google region to deploy into."
}