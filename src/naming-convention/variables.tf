locals {
  name_with_env  = "${var.application_identification}-${var.application_subgroup}-${var.business_unit}-${var.environment}"
  name_without_env  = "${var.application_identification}-${var.application_subgroup}-${var.business_unit}"
}