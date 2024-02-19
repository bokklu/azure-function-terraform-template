variable "application_name" {}
variable "azure_resource_group_name" {}
variable "azure_resource_group_location" {}

variable "azure_key_vault_sku" {
  type = string
  default = "standard"
}

variable "azure_key_vault_soft_delete_days" {
  type = number
  default = 7
}

locals {
  azure_key_vault_name = "kv-${var.application_name}"
}