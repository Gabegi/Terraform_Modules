variable "application_identification" {
  type        = string
  description = "3 char application code"
  default = "app"
}

variable "application_subgroup" {
  type        = string
  description = "2 char code according to naming convention"
  default = "nl"
}

variable "business_unit" {
    type        = string
    description = "The business unit"
    default = "important_department"
}

variable "environment" {
  type        = string
  description = "The environment name"
  default = "test"
}

variable "administrator_login" {
  type        = string
  description = "The mysql login name"
  default = "Bob"
}

variable "administrator_pw" {
  type        = string
  description = "The admin mysql password"
  default = "notsafe"
}


variable "location" {
  type        = string
  description = "Where the resources are located"
  default = "West Europe"
}

