#Declaring needed providers for the cloud platform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}

  client_id       = local.az.app
  client_secret   = local.az.secret
  tenant_id       = local.az.tenant
  subscription_id = local.az.subscription
}