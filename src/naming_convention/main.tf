locals {
  name_with_env  = "${var.application_identification}-${var.application_subgroup}-${var.business_unit}-${var.environment}"
  name_without_env  = "${var.application_identification}-${var.application_subgroup}-${var.business_unit}"
}

output "workloads" {
  value = {
    mysql_server    = "mysqlfs-${local.name_with_env}"
    mysql_db    = "mysql-db-${local.name_with_env}"
    rg    = "rg-${local.name_with_env}"
    app_service_plan = "asp-${local.name_with_env}"
    app_service = "as-${local.name_with_env}"
  }
}