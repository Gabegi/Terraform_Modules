module "naming_convention" {
  source = "../../../naming-convention"
  application_identification = var.application_identification
  application_subgroup       = var.application_subgroup
  business_unit              = var.business_unit
  environment                = var.environment
  location_short             = var.location_short
}

resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                         = "${module.naming_convention.workloads.mysql_server}-${var.purpose}-${var.environment}"
  location                     = var.location
  resource_group_name          = var.rg_name
  administrator_login          = var.administrator_login
  administrator_password       = var.administrator_pw
}