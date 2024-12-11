# Naming Convention
module "naming_convention" {
  source = "../naming-convention"
  application_identification = var.application_identification
  application_subgroup       = var.application_subgroup
  business_unit              = var.business_unit
  environment                = var.environment
  location_short             = var.location_short
}

# App Service Plan
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${module.naming_convention.workloads.app_service_plan}-${var.environment}"
  location            = var.location_short
  resource_group_name = var.rg_name

  sku {
    tier = var.app_service_plan_sku.tier
    size = var.app_service_plan_sku.size
  }
}

# Create App Services
resource "azurerm_app_service" "app_service" {
  for_each            = toset(var.app_names)
  name                = "${module.naming_convention.workloads.app_service}-${each.value}-${var.environment}"
  location            = var.location_short
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id


  identity {
    type = "SystemAssigned"
  }


#   # Default settings
#   app_settings = {
#     "WEBSITE_RUN_FROM_PACKAGE" = "1"
#   }
}

# Role Assignment: Grant MySQL Reader to the App Services' Managed Identity
resource "azurerm_role_assignment" "mysql_reader" {
  for_each             = azurerm_app_service.app_service
  principal_id         = each.value.identity[0].principal_id # Managed Identity of the App Service
  role_definition_name = "MySQL Reader"
  scope                = var.mysql_server_id                # Scope is the MySQL Server ID
}
