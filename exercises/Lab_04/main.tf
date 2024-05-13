# The main.tf file in Terraform is a required configuration file that defines the infrastructure resources that should be created, modified or deleted. This file is used to declare the resources that make up your infrastructure in a declarative way.
resource "azurerm_resource_group" "rg-main" {
  location = local.rg.location
  name     = local.rg.name
}

resource "azurerm_virtual_network" "vnet01" {
  name                = "${local.rg.prefix}-vnet"
  location            = azurerm_resource_group.rg-main.location
  resource_group_name = azurerm_resource_group.rg-main.name
  address_space       = ["10.1.0.0/16"]

  tags = local.common_tags
}

resource "azurerm_subnet" "subnet01" {
  name                 = "default" #It doesn't follow naming convention of this module
  resource_group_name  = azurerm_resource_group.rg-main.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.1.0.0/24"]
}
resource "azurerm_subnet" "subnet02" {
  name                 = "AzureBastionSubnet" #It doesn't follow naming convention of this module
  resource_group_name  = azurerm_resource_group.rg-main.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = ["10.1.1.0/26"]
}

resource "azurerm_dns_zone" "dnsZone-main" {
  name                = var.PublicDnsZone
  resource_group_name = azurerm_resource_group.rg-main.name

  tags = local.common_tags
}

resource "azurerm_public_ip" "pIP01" {
  name                = "${local.rg.prefix}-ip"
  resource_group_name = azurerm_resource_group.rg-main.name
  location            = azurerm_resource_group.rg-main.location
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = local.common_tags
}

resource "azurerm_network_interface" "nic-vm01" {
  name                = "${local.rg.prefix}997"
  resource_group_name = azurerm_resource_group.rg-main.name
  location            = azurerm_resource_group.rg-main.location

  ip_configuration {
    name                          = "nic-vm01"
    subnet_id                     = azurerm_subnet.subnet01.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = local.common_tags
}

resource "azurerm_network_security_group" "nsg-vm01" {
  name = "${local.rg.prefix}-nsg"
  resource_group_name = azurerm_resource_group.rg-main.name
  location = azurerm_resource_group.rg-main.location

  tags = local.common_tags
}