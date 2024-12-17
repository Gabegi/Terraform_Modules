module "naming_convention" {
  source = "../../naming_convention"
  application_identification = var.application_identification
  application_subgroup       = var.application_subgroup
  business_unit              = var.business_unit
  environment                = var.environment
}

resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                         = "${module.naming_convention.workloads.mysql_server}-${var.department}"
  location                     = var.location
  resource_group_name          = var.rg_name
  administrator_login          = var.administrator_login
  administrator_password       = var.administrator_pw
  sku_name = "B_Standard_B1s"
}

resource "azurerm_mysql_flexible_database" "mysql_db" {
  for_each            = toset(var.mysql_db_names)
  name                = "${module.naming_convention.workloads.mysql_db}-${each.value}-${var.department}"
  resource_group_name = var.rg_name
  server_name         = azurerm_mysql_flexible_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}