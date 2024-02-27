output "azure_resource_group_location" {
    value = var.azure_resource_group_location
}

output "azure_resource_group_name" {
    value = local.azure_resource_group_name
}

output "azure_resource_group_generated_name" {
    value = azurerm_resource_group.poc_resource_group.name
}