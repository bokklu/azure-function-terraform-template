output "resource_group_name" {
  value = module.resource_group.azure_resource_group_generated_name
}

output "function_name" {
  value = module.function_app.function_name
}