resource "azurerm_key_vault" "poc_key_vault" {
  name                        = local.azure_key_vault_name
  location                    = var.azure_resource_group_location
  resource_group_name         = var.azure_resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.azure_key_vault_soft_delete_days
  purge_protection_enabled    = false
  sku_name                    = var.azure_key_vault_sku
}