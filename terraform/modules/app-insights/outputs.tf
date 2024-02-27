output "azure_app_insights_instrumentation_key" {
    value = azurerm_application_insights.poc_app_insights.instrumentation_key
}

output "azure_app_insights_connection_string" {
    value = azurerm_application_insights.poc_app_insights.connection_string
}