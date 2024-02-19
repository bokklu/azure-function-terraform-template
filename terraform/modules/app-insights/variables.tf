variable "application_name" {}
variable "azure_resource_group_name" {}
variable "azure_resource_group_location" {}

variable "azure_app_insights_application_type" {
  type    = string
  default = "web"
}

locals {
  azure_app_insights_name = "ai-${var.application_name}"
}