variable "AZ_APPID" {
  sensitive = true
}
variable "AZ_TENANTID" {}
variable "AZ_SECRET" {
  sensitive = true
}
variable "AZ_SUBSID" {}

variable "rg_name" {
  type = string
  description = "Default name for resource group"
  default = "TST-WEUR-TFLAB1"
}

variable "company" {
  type        = string
  description = "Company name for tagging purpose"
  default     = "DordoLabs"
}
variable "project_name" {
  type        = string
  description = "Project name for tagging purpose"
  default     = "lab01"
}
variable "billing_code" {
  type        = string
  description = "Billing code for tagging purpose"
  default     = "201219DN"
}

variable "environment" {
  type        = string
  description = "Defines deployment environment"
  default     = "TST"

}

variable "rg_location" {
  type        = string
  description = "Define resource AZ region"
  default     = "westeurope"
}

variable "vm_username" {
  type        = string
  description = "Define admin user name"
  default     = "dordolnx01"
}

#DNS Experimental zone
variable "rg_name_dns_root" {
  type = string
  description = "Contains resource group of the dns zone"
  default = "pro-weur-networking"
}

variable "dns_root_zone" {
  type = string
  description = "Defines the root DNS zone for the primary infra domain"
  default = "365enespanol.com"
}