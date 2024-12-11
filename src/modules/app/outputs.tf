output "app_service_plan_id" {
  description = "ID of the App Service Plan"
  value       = azurerm_app_service_plan.app_service_plan.id
}

output "app_service_names" {
  description = "Names of the created App Services"
  value       = azurerm_app_service.app_service[*].name
}

output "app_service_urls" {
  description = "Default URLs of the created App Services"
  value       = azurerm_app_service.app_service[*].default_site_hostname
}
