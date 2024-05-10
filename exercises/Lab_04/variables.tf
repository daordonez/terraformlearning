# The variables.tf file in Terraform is used to define input variables for your Terraform configuration. Input variables allow you to parameterize your infrastructure resources, making your configuration more flexible and reusable.

variable "AZ_CLIENT_ID" {}
variable "AZ_CLIENT_SECRET" {
  sensitive = true
}
variable "AZ_SUBSCRIPTION_ID" {}
variable "AZ_TENANT_ID" {}

variable "rg_name" {
  type        = string
  description = "Enter the default resource group name"
  default     = "PRO-WEUR-LNX"
}

variable "location" {
  type        = string
  description = "Set the default region for the resource group"
  default     = "westeurope"
}

variable "PublicDnsZone" {
  type = string
  default = "monojaus.com"
}