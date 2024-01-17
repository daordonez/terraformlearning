variable "AZ_APPID" {
    sensitive = true
}
variable "AZ_TENANTID" {}
variable "AZ_SECRET" {
    sensitive = true
}
variable "AZ_SUBSID" {}

variable "company" {
  type = string
  description = "Company name for tagging purpose"
  default = "DordoLabs"
}
variable "project_name" {
  type = string
  description = "Project name for tagging purpose"
  default = "Lab-01"
}
variable "billing_code" {
  type = string
  description = "Billing code for tagging purpose"
  default = "201219DN"
}

variable "environment" {
    type = string
    description = "Defines deployment environment"
    default = "TST"
  
}

variable "rg_location" {
  type = string
  description = "Define resource AZ region"
  default = "westeurope"
}

variable "vm_username" {
  type = string
  description = "Define admin user name"
  default = "dordolnx01"
}