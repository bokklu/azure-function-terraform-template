resource "azurerm_storage_account" "poc_storage_account" {
  name                       = local.azure_function_storage_account_name
  resource_group_name        = var.azure_resource_group_name
  location                   = var.azure_resource_group_location
  account_tier               = var.azure_function_storage_account_sku
  account_replication_type   = var.azure_function_storage_account_replication_type
}

resource "azurerm_service_plan" "poc_service_plan" {
  name                       = local.azure_function_service_plan_name
  resource_group_name        = var.azure_resource_group_name
  location                   = var.azure_resource_group_location
  os_type                    = var.azure_function_service_plan_os
  sku_name                   = var.azure_function_service_plan_sku
}

resource "azurerm_linux_function_app" "poc_function_app" {
  name                       = local.azure_function_app_name
  resource_group_name        = var.azure_resource_group_name
  location                   = var.azure_resource_group_location

  storage_account_name       = azurerm_storage_account.poc_storage_account.name
  storage_account_access_key = azurerm_storage_account.poc_storage_account.primary_access_key
  service_plan_id            = azurerm_service_plan.poc_service_plan.id

  site_config {
    application_stack {
      dotnet_version = "6.0"
    } 

    cors {
        allowed_origins       = ["https://portal.azure.com"]
        support_credentials = true
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 1
    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.azure_app_insights_instrumentation_key
  }

  identity {
    type = "SystemAssigned"
  }
}