variable "location" {
  type        = string
  description = "Set a value for the default location"
}
variable "rg_name" {
  type        = string
  description = "Resource group name for deployment"
}

variable administrator_login {
  type        = string
  nullable    = false
  default     = "adminuser"
  description = "Administrator Login"
}

variable administrator_pw {
  type        = string
  nullable    = false
  description = "Administrator Password"
}

variable "mysql_db_names" {
  type        = list(string)
  description = "The names of the MySQL Databases."
  default     = ["SampleDB"]
}

variable environment {
  type        = string
  nullable    = false
  description = "Environment (e.g. test, prd)"
}