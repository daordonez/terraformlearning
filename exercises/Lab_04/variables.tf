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
  type    = string
  default = "monojaus.com"
}

variable "AllowedIPs" {
  type        = list(string)
  description = "Theses IPs are intented to allow communications of the main server"
  default     = ["88.17.191.106", "98.71.215.242"]
}

variable "vm_size" {
  type        = string
  description = "Sizing of the main virtual machine of the group"
  default     = "Standard_B2ms"
}

variable "vm_admin_username" {
  type        = string
  description = "It defines the default admin user even if it's disabled"
  default     = "dordonc"
}

variable "ResourcePrefix" {
  type        = string
  description = "Set a common prefix for all of the resources"
  default     = "pweurlnx"
}

variable "ProjectInfo" {
  type        = map(string)
  description = "Describes project minimal information"
  default = {
    "ENV"     = "develop"
    "Company" = "dordo-labs"
    "Project" = "tf-ex04"
  }
}