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
    public_ip_address_id = azurerm_public_ip.pIP01.id
  }

  tags = local.common_tags
}

resource "azurerm_network_security_group" "nsg-vm01" {
  name                = "${local.rg.prefix}-nsg"
  resource_group_name = azurerm_resource_group.rg-main.name
  location            = azurerm_resource_group.rg-main.location

  tags = local.common_tags
}

resource "azurerm_network_security_rule" "ssh-InboundRule-nsg" {
  name                        = "SSH"
  resource_group_name         = azurerm_resource_group.rg-main.name
  network_security_group_name = azurerm_network_security_group.nsg-vm01.name
  source_address_prefixes     = var.AllowedIPs
  source_port_range = "*"

  destination_port_range = 22
  access                 = "Allow"
  protocol               = "Tcp"
  direction              = "Inbound"
  priority               = 300
}

resource "azurerm_network_security_rule" "https-InboundRule-nsg" {
  name                        = "AllowAnyHTTPSInbound"
  resource_group_name         = azurerm_resource_group.rg-main.name
  network_security_group_name = azurerm_network_security_group.nsg-vm01.name
  source_port_range = "*"

  destination_port_range = 443
  access                 = "Allow"
  protocol               = "Tcp"
  direction              = "Inbound"
  priority               = 320
}

resource "azurerm_network_security_rule" "http-InboundRule-nsg" {
  name                        = "AllowAnyHTTPInbound"
  resource_group_name         = azurerm_resource_group.rg-main.name
  network_security_group_name = azurerm_network_security_group.nsg-vm01.name
  source_port_range = "*"

  destination_port_range = 80
  access                 = "Allow"
  protocol               = "Tcp"
  direction              = "Inbound"
  priority               = 330
}
resource "azurerm_network_security_rule" "custom01-InboundRule-nsg" {
  name                        = "NPMAdmin_AllowMyIpAddressCustom81Inbound"
  resource_group_name         = azurerm_resource_group.rg-main.name
  network_security_group_name = azurerm_network_security_group.nsg-vm01.name
  source_address_prefixes     = var.AllowedIPs

  destination_port_range = 81
  access                 = "Allow"
  protocol               = "Tcp"
  direction              = "Inbound"
  priority               = 340

}
resource "azurerm_managed_disk" "vm01-disk02" {
  name = "nc2"
  resource_group_name = azurerm_resource_group.rg-main.name
  location = azurerm_resource_group.rg-main.location
  storage_account_type = "StandardSSD_LRS"
  create_option = "Empty"

  tags = local.common_tags
}

resource "azurerm_linux_virtual_machine" "vm01-linux" {
  name                  = local.rg.prefix
  resource_group_name   = azurerm_resource_group.rg-main.name
  location              = azurerm_resource_group.rg-main.location
  admin_username        = var.vm_admin_username
  size                  = var.vm_size
  network_interface_ids = [azurerm_network_interface.nic-vm01.id]
  secure_boot_enabled   = true
  vtpm_enabled          = true

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  admin_ssh_key {
    username   = var.vm_admin_username
    public_key = file("./ssh/id_rsa.pub")
  }

  source_image_reference { # forces replacement
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  additional_capabilities {
    ultra_ssd_enabled = false
  }

  tags = local.common_tags
}