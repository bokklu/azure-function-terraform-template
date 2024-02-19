variable "application_name" {}

variable "azure_resource_group_location" {
  type = string
  default = "West Europe"
}

locals {
  azure_resource_group_name = "rg-${var.application_name}"
}