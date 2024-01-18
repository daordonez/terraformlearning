#Set providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }

    #In order to create the SSH key pair, we'll use 'azapi'
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }

    #It's also required to use 'random' from hashicorp
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
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
  tags                = local.common_tags
}
#5.1 Set nsg security rules
#SSH
resource "azurerm_network_security_rule" "nsg-rule-ssh" {
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
resource "azurerm_network_security_rule" "nsg-rule-http" {
  name                        = "HTTP"
  priority                    = "1002"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg-01.name
  network_security_group_name = azurerm_network_security_group.lab01-nsg-nic.name

}
#HTTP (once nginx created)

#5.2 Connecting nsg to NIC
resource "azurerm_network_interface_security_group_association" "lab01-nsgnic-assoc" {
  network_interface_id      = azurerm_network_interface.lab01-nic.id
  network_security_group_id = azurerm_network_security_group.lab01-nsg-nic.id
}

#5. Create new SSH key pair in order to connect to the linux vm
# See ssh.tf generation. This private key will be setted up into the vm during deployment

#6. It's mandatory to have on storage account for boot diagnostics
resource "azurerm_storage_account" "stg-bootDiagnostics-vmLinux" {
  name                     = "tstweurstgboot"
  location                 = local.location
  resource_group_name      = azurerm_resource_group.rg-01.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.common_tags
}

#7. Linux VM
resource "azurerm_linux_virtual_machine" "lab01-vmLinux" {
  name                  = "TST-WEUR-VMLinux01"
  location              = local.location
  resource_group_name   = azurerm_resource_group.rg-01.name
  network_interface_ids = [azurerm_network_interface.lab01-nic.id]
  size                  = "Standard_B2ts_v2"

  os_disk {
    name                 = "DiskVm-linux01"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "TSTWEURLNX01"
  admin_username = var.vm_username

  admin_ssh_key {
    username   = var.vm_username
    public_key = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stg-bootDiagnostics-vmLinux.primary_blob_endpoint
  }

  #7.1 Pushing nginx installation and 'hello world' string
  custom_data = local.custom_data

  tags = local.common_tags

}