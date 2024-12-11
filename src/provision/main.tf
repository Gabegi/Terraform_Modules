module "naming_convention" {
  source                     = "../naming-convention"
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
}

module "appservice" {
  source = "./modules/appservice"

  # Naming convention variables
  application_identification = var.application_identification
  application_subgroup       = var.application_subgroup
  business_unit              = var.business_unit
  environment                = var.environment
  location_short             = var.location_short

  # Resource group and App Service specifics
  rg_name = var.rg_name

  # SKU for the App Service Plan
  app_service_plan_sku = {
    tier = "Standard"
    size = "S1"
  }

  # List of App Services to create
  app_names = ["service1", "service2"]
}

resource "azurerm_resource_group" "rg" {
  name     = module.naming_convention.for_modules.resource_group
  location = var.location
}




