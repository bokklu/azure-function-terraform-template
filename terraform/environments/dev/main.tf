module "shared" {
  source = "../../modules/shared"
}

module "resource_group" {
  source = "../../modules/resource-group"
  application_name = module.shared.var.application_name
}

module "app_insights" {
  source = "../../modules/app-insights"
  application_name = module.shared.var.application_name
  azure_resource_group_name = module.resource_group.azure_resource_group_name
  azure_resource_group_location = module.resource_group.azure_resource_group_location
}

module "function_app" {
  source = "../../modules/function-app"
  application_name = module.shared.var.application_name
  azure_resource_group_name = module.resource_group.azure_resource_group_name
  azure_resource_group_location = module.resource_group.azure_resource_group_location
  azure_app_insights_instrumentation_key = module.app_insights.azure_app_insights_instrumentation_key
}

module "key_vault" {
  source = "../../modules/key-vault"
  application_name = module.shared.var.application_name
  azure_resource_group_name = module.resource_group.azure_resource_group_name
  azure_resource_group_location = module.resource_group.azure_resource_group_location
}