#Set providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  #Which will be the minimum version required
  required_version = ">= 1.1.0"
}

#Set the provider to be used
provider "azurerm" {
  features {}

  client_id       = var.AZ_APPID
  client_secret   = var.AZ_SECRET
  tenant_id       = var.AZ_TENANTID
  subscription_id = var.AZ_SUBSID
}


#1 resource creation
# Resource group
resource "azurerm_resource_group" "rg-01" {
  name     = "TST-WESTEUR-TFLAB1"
  location = "westeurope"
}
