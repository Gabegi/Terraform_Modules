variable "application_identification" {
  type        = string
  description = "3 char application code"
}

variable "application_subgroup" {
  type        = string
  description = "2 char code according to naming convention"
}

variable "business_unit" {
    type        = string
    description = "The business unit"
}

variable "environment" {
  type        = string
  description = "The environment name"
}
