resource "azurerm_resource_group" "poc_resource_group" {
  name     = local.azure_resource_group_name
  location = var.azure_resource_group_location
}