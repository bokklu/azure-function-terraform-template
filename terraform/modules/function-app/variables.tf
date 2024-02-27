variable "application_name" {}
variable "azure_resource_group_name" {}
variable "azure_resource_group_location" {}
variable "azure_app_insights_instrumentation_key" {}
variable "azure_app_insights_connection_string" {}

variable "azure_function_storage_account_name" {
  type = string
  default = "sadbucping"
}

variable "azure_function_service_plan_sku" {
  type = string
  default = "Y1"
}

variable "azure_function_service_plan_os" {
  type = string
  default = "Linux"
}

variable "azure_function_storage_account_sku" {
  type = string
  default = "Standard"
}

variable "azure_function_storage_account_replication_type" {
  type = string
  default = "LRS"
}

locals {
  azure_function_service_plan_name = "sp-${var.application_name}"
  azure_function_app_name = "fa-${var.application_name}"
}