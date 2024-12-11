module "naming_convention" {
  source                     = "../naming_convention"
  application_identification = var.application_identification
  application_subgroup       = var.application_subgroup
  business_unit              = var.business_unit
  environment                = var.environment
}

module "mysql" {
  source = "../modules/mysql"
  rg_name = azurerm_resource_group.rg.name
  administrator_login = var.administrator_login
  administrator_pw = var.administrator_pw
  environment = var.environment
  location = var.location
  business_unit              = var.business_unit
  application_subgroup       = var.application_subgroup
  application_identification = var.application_identification
}

module "appservice" {
  source = "../modules/app"

  # Naming convention variables
  application_identification = var.application_identification
  application_subgroup       = var.application_subgroup
  business_unit              = var.business_unit
  environment                = var.environment
  location_short             = var.location_short

  # Resource group and App Service specifics
  rg_name = azurerm_resource_group.rg.name

  # SKU for the App Service Plan
  app_service_plan_sku = {
    tier = "Standard"
    size = "S1"
  }

  # List of App Services to create
  app_names = ["service1", "service2"]

  # MySQL Server ID
  mysql_server_id = module.mysql.server_id
}

resource "azurerm_resource_group" "rg" {
  name     = module.naming_convention.workloads.rg
  location = var.location
}




