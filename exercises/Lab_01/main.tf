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
  location = local.location

  tags = local.common_tags
}

#2. Create vnet & subnet
resource "azurerm_virtual_network" "lab01-vnet" {
  name                = "TST-WEUR-VNET01"
  address_space       = ["10.0.0.0/26"]
  location            = local.location
  resource_group_name = azurerm_resource_group.rg-01.name

  tags = local.common_tags
}
resource "azurerm_subnet" "lab01-subnet" {
  name                 = "TST-WEUR-SUBNET01"
  address_prefixes     = ["10.0.0.0/27"]
  virtual_network_name = azurerm_virtual_network.lab01-vnet.name
  resource_group_name  = azurerm_resource_group.rg-01.name

}

#3. Creating Public IP
resource "azurerm_public_ip" "lab01-PubIP" {
  name                = "TST-WEUR-PUBIP01"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg-01.name
  allocation_method   = "Dynamic"

  tags = local.common_tags
}

#4. Creating network interface
resource "azurerm_network_interface" "lab01-nic" {
  name                = "TST-WEUR-NIC01"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg-01.name

  ip_configuration {
    name                          = "nic-config"
    subnet_id                     = azurerm_subnet.lab01-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.lab01-PubIP.id
  }

  tags = local.common_tags
}
#5. Creating network security group
resource "azurerm_network_security_group" "lab01-nsg-nic" {
  name                = "lab01NetworkSecurityGroup"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg-01.name
  tags = local.common_tags
}
#5.1 Set nsg security rule
resource "azurerm_network_security_rule" "lab01-nsg-rule" {
  name                        = "SSH"
  priority                    = "1001"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-01.name
  network_security_group_name = azurerm_network_security_group.lab01-nsg-nic.name

}

#5.2 Connecting nsg to NIC
resource "azurerm_network_interface_security_group_association" "lab01-nsgnic-assoc" {
  network_interface_id = azurerm_network_interface.lab01-nic.id
  network_security_group_id = azurerm_network_security_group.lab01-nsg-nic.id
}