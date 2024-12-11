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


resource "azurerm_resource_group" "rg" {
  name     = module.naming_convention.for_modules.resource_group
  location = var.location
  tags     = local.tags.default
}




