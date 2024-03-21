#Base resourge group
resource "azurerm_resource_group" "rg-test" {
  name     = local.rg
  location = local.az.location
}

# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/TF-WEUR-LAB03/providers/Microsoft.Network/natGateways/tf-subnet-def-nat"
resource "azurerm_nat_gateway" "natgw-lab03" {
  idle_timeout_in_minutes = 4
  location                = "westeurope"
  name                    = "tf-subnet-def-nat"
  resource_group_name     = "TF-WEUR-LAB03"
  sku_name                = "Standard"
  tags                    = {}
  zones                   = []
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/TF-WEUR-LAB03/providers/Microsoft.Network/publicIPAddresses/default"
resource "azurerm_public_ip" "pip-lab03" {
  allocation_method       = "Static"
  domain_name_label       = null
  edge_zone               = null
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westeurope"
  name                    = "default"
  public_ip_prefix_id     = null
  resource_group_name     = "TF-WEUR-LAB03"
  reverse_fqdn            = null
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
  zones                   = []
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/TF-WEUR-LAB03/providers/Microsoft.Network/networkSecurityGroups/tf-subnet-def-nsg"
resource "azurerm_network_security_group" "nsg-default" {
  location            = "westeurope"
  name                = "tf-subnet-def-nsg"
  resource_group_name = "TF-WEUR-LAB03"
  security_rule       = []
  tags                = {}
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_subnet" "sub02-lab03" {
  address_prefixes                               = ["10.0.0.64/27"]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = false
  name                                           = "sub02"
  resource_group_name                            = "TF-WEUR-LAB03"
  service_endpoints                              = []
  virtual_network_name                           = "tf-weur-vnet"
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_subnet" "sub03-lab03" {
  address_prefixes                               = ["10.0.0.96/27"]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = false
  name                                           = "sub03"
  resource_group_name                            = "TF-WEUR-LAB03"
  service_endpoints                              = []
  virtual_network_name                           = "tf-weur-vnet"
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_subnet" "default-lab03" {
  address_prefixes                               = ["10.0.0.0/27"]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = false
  name                                           = "default"
  resource_group_name                            = "TF-WEUR-LAB03"
  service_endpoints                              = []
  virtual_network_name                           = "tf-weur-vnet"
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_virtual_network" "vnet-lab03" {
  address_space       = ["10.0.0.0/24"]
  bgp_community       = null
  dns_servers         = []
  edge_zone           = null
  location            = "westeurope"
  name                = "tf-weur-vnet"
  resource_group_name = "TF-WEUR-LAB03"
  tags                = {}
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_subnet" "sub01-lab03" {
  address_prefixes                               = ["10.0.0.32/27"]
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = false
  name                                           = "sub01"
  resource_group_name                            = "TF-WEUR-LAB03"
  service_endpoints                              = []
  virtual_network_name                           = "tf-weur-vnet"
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}
