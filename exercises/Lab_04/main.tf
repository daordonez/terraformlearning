# The main.tf file in Terraform is a required configuration file that defines the infrastructure resources that should be created, modified or deleted. This file is used to declare the resources that make up your infrastructure in a declarative way.
resource "azurerm_resource_group" "rg-main" {
  location = local.rg.location
  name     = local.rg.name
}