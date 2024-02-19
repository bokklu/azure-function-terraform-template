resource "azurerm_application_insights" "poc_app_insights" {
  name                = local.azure_app_insights_name
  location            = var.azure_resource_group_location
  resource_group_name = var.azure_resource_group_name
  application_type    = var.azure_app_insights_application_type
}