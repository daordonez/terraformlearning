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

  client_id       = local.az.app
  client_secret   = local.az.secret
  tenant_id       = local.az.tenant
  subscription_id = local.az.subscription
}


#1 resource creation
# Resource group
resource "azurerm_resource_group" "rg-01" {
  name     = "TST-WEUR-TFLAB1"
  location = "westeurope"

  tags = local.common_tags
}

#2. Create vnet & subnet
resource "azurerm_virtual_network" "lab01-vnet" {
  name = "TST-WEUR-VNET01"
  address_space = [ "10.0.0.0/26" ]
  location = "westeurope"
  resource_group_name = azurerm_resource_group.rg-01.name

  tags = local.common_tags
}
resource "azurerm_subnet" "lab01-subnet" {
  name = "TST-WEUR-SUBNET01"
  address_prefixes = ["10.0.0.0/27"]
  virtual_network_name = azurerm_virtual_network.lab01-vnet.name
  resource_group_name = azurerm_resource_group.rg-01.name

}