#provider config
variable "AZ_APPID" {
  sensitive = true
}
variable "AZ_SECRET" {
  sensitive = true
}
variable "AZ_TENANTID" {}
variable "AZ_SUBSID" {}

#AZ general aprams
variable "Region" {
  type        = string
  description = "Defualt region for resource deployment"
  default     = "westeurope"
}

variable "rg-nameprefix" {
  type        = string
  description = "Default resource group prefix for this project"
  default     = "tf-weur"
}

#Project params
variable "Environment" {
  type        = string
  description = "Project environment (default: Dev)"
  default     = "dev"
}
variable "Company" {
  type        = string
  description = "Company Name (default: DordoLabs)"
  default     = "Dordolabs"
}
variable "Project" {
  type        = string
  description = "Project name of this module is developed for"
  default     = "lab03"
}