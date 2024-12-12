output "app_service_managed_identities" {
  description = "Principal IDs of the system-assigned Managed Identities for the App Services"
  value       = { for k, v in azurerm_app_service.app_service : k => v.identity[0].principal_id }
}

output "app_service_plan_id" {
  description = "ID of the App Service Plan"
  value       = azurerm_app_service_plan.app_service_plan.id
}

# output "app_service_names" {
#   description = "Names of the created App Service"
#   value       = azurerm_app_service.app_service[*].name
# }

# output "app_service_url" {
#   description = "Default URLs of the created App Service"
#   value       = azurerm_app_service.app_service[*].default_site_hostname
# }
