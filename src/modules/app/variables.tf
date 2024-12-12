variable "application_identification" {
  description = "Application identification (e.g., app name or code)"
  type        = string
}

variable "application_subgroup" {
  description = "Application subgroup"
  type        = string
}

variable "business_unit" {
  description = "Business unit"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "app_service_plan_sku" {
  description = "SKU details for the App Service Plan"
  type = object({
    tier = string
    size = string
  })
  default = {
    tier = "Standard"
    size = "S1"
  }
}

variable "app_names" {
  description = "List of App Service names to create"
  type        = list(string)
}

variable "mysql_server_id" {
  description = "Id of MySQL server"
  type        = string
}
