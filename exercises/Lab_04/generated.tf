# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/publicIPAddresses/pweurlnx-ip"
resource "azurerm_public_ip" "PublicIP01" {
  allocation_method       = "Static"
  domain_name_label       = null
  edge_zone               = null
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "westeurope"
  name                    = "pweurlnx-ip"
  public_ip_prefix_id     = null
  resource_group_name     = "PRO-WEUR-LNX"
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

# __generated__ by Terraform
resource "azurerm_network_security_group" "nsg01" {
  location            = "westeurope"
  name                = "pweurlnx-nsg"
  resource_group_name = "PRO-WEUR-LNX"
  security_rule = [{
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "22"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "SSH"
    priority                                   = 300
    protocol                                   = "TCP"
    source_address_prefix                      = ""
    source_address_prefixes                    = ["88.17.196.142", "98.71.215.242"]
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "443"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "AllowAnyHTTPSInbound"
    priority                                   = 320
    protocol                                   = "TCP"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "80"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "AllowAnyHTTPInbound"
    priority                                   = 330
    protocol                                   = "TCP"
    source_address_prefix                      = "*"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
    }, {
    access                                     = "Allow"
    description                                = ""
    destination_address_prefix                 = "*"
    destination_address_prefixes               = []
    destination_application_security_group_ids = []
    destination_port_range                     = "81"
    destination_port_ranges                    = []
    direction                                  = "Inbound"
    name                                       = "NPMAdmin_AllowMyIpAddressCustom81Inbound"
    priority                                   = 340
    protocol                                   = "*"
    source_address_prefix                      = "88.17.196.142"
    source_address_prefixes                    = []
    source_application_security_group_ids      = []
    source_port_range                          = "*"
    source_port_ranges                         = []
  }]
  tags = {}
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_virtual_network" "vnet01" {
  address_space           = ["10.1.0.0/16"]
  bgp_community           = null
  dns_servers             = []
  edge_zone               = null
  flow_timeout_in_minutes = 0
  location                = "westeurope"
  name                    = "pweurlnx-vnet"
  resource_group_name     = "PRO-WEUR-LNX"
  subnet = [{
    address_prefix = "10.1.0.0/24"
    id             = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/virtualNetworks/pweurlnx-vnet/subnets/default"
    name           = "default"
    security_group = ""
    }, {
    address_prefix = "10.1.1.0/26"
    id             = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/virtualNetworks/pweurlnx-vnet/subnets/AzureBastionSubnet"
    name           = "AzureBastionSubnet"
    security_group = ""
  }]
  tags = {}
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_managed_disk" "vm-lnx01-disk02" {
  create_option                 = "Empty"
  disk_access_id                = null
  disk_encryption_set_id        = null
  disk_iops_read_only           = 0
  disk_iops_read_write          = 500
  disk_mbps_read_only           = 0
  disk_mbps_read_write          = 100
  disk_size_gb                  = 128
  edge_zone                     = null
  gallery_image_reference_id    = null
  hyper_v_generation            = null
  image_reference_id            = null
  location                      = "westeurope"
  logical_sector_size           = null
  max_shares                    = 0
  name                          = "nc2"
  network_access_policy         = null
  on_demand_bursting_enabled    = false
  os_type                       = null
  public_network_access_enabled = true
  resource_group_name           = "PRO-WEUR-LNX"
  source_resource_id            = null
  source_uri                    = null
  storage_account_id            = null
  storage_account_type          = "StandardSSD_LRS"
  tags                          = {}
  tier                          = null
  trusted_launch_enabled        = false
  zone                          = null
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/networkInterfaces/pweurlnx997"
resource "azurerm_network_interface" "nic01" {
  dns_servers                   = []
  edge_zone                     = null
  enable_accelerated_networking = false
  enable_ip_forwarding          = false
  internal_dns_name_label       = null
  location                      = "westeurope"
  name                          = "pweurlnx997"
  resource_group_name           = "PRO-WEUR-LNX"
  tags                          = {}
  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = null
    name                                               = "ipconfig1"
    primary                                            = true
    private_ip_address                                 = "10.1.0.4"
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/publicIPAddresses/pweurlnx-ip"
    subnet_id                                          = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/virtualNetworks/pweurlnx-vnet/subnets/default"
  }
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_managed_disk" "vm-lnx01-disk01" {
  create_option                 = "FromImage"
  disk_access_id                = null
  disk_encryption_set_id        = null
  disk_iops_read_only           = 0
  disk_iops_read_write          = 120
  disk_mbps_read_only           = 0
  disk_mbps_read_write          = 25
  disk_size_gb                  = 30
  edge_zone                     = null
  gallery_image_reference_id    = null
  hyper_v_generation            = "V2"
  image_reference_id            = "/Subscriptions/b6a109e9-7d0c-4d40-a8ec-b8d6e9040d63/Providers/Microsoft.Compute/Locations/westeurope/Publishers/canonical/ArtifactTypes/VMImage/Offers/0001-com-ubuntu-server-focal/Skus/20_04-lts-gen2/Versions/20.04.202402050"
  location                      = "westeurope"
  logical_sector_size           = null
  max_shares                    = 0
  name                          = "pweurlnx_disk1_d69f8a2b6117463b8b503a05769f9a3b"
  network_access_policy         = null
  on_demand_bursting_enabled    = false
  os_type                       = "Linux"
  public_network_access_enabled = true
  resource_group_name           = "PRO-WEUR-LNX"
  source_resource_id            = null
  source_uri                    = null
  storage_account_id            = null
  storage_account_type          = "Premium_LRS"
  tags                          = {}
  tier                          = "P4"
  trusted_launch_enabled        = true
  zone                          = null
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/virtualMachines/pweurlnx/extensions/AADSSHLoginForLinux"
resource "azurerm_virtual_machine_extension" "VMExt-AADSSH" {
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = false
  name                       = "AADSSHLoginForLinux"
  protected_settings         = null # sensitive
  publisher                  = "Microsoft.Azure.ActiveDirectory"
  settings                   = null
  tags                       = {}
  type                       = "AADSSHLoginForLinux"
  type_handler_version       = "1.0"
  virtual_machine_id         = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/virtualMachines/pweurlnx"
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/virtualMachines/pweurlnx/extensions/enablevmAccess"
resource "azurerm_virtual_machine_extension" "VMExt-Acess" {
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = false
  name                       = "enablevmAccess"
  protected_settings         = null # sensitive
  publisher                  = "Microsoft.OSTCExtensions"
  settings                   = null
  tags                       = {}
  type                       = "VMAccessForLinux"
  type_handler_version       = "1.5"
  virtual_machine_id         = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/virtualMachines/pweurlnx"
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform from "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/dnszones/monojaus.com"
resource "azurerm_dns_zone" "zonedns-main" {
  name                = "monojaus.com"
  resource_group_name = "PRO-WEUR-LNX"
  tags                = {}
  soa_record {
    email         = "azuredns-hostmaster.microsoft.com"
    expire_time   = 2419200
    host_name     = "ns1-32.azure-dns.com."
    minimum_ttl   = 300
    refresh_time  = 3600
    retry_time    = 300
    serial_number = 1
    tags          = {}
    ttl           = 3600
  }
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}

# __generated__ by Terraform
resource "azurerm_virtual_machine" "vm-lnx01" {
  availability_set_id              = null
  delete_data_disks_on_termination = null
  delete_os_disk_on_termination    = null
  license_type                     = null
  location                         = "westeurope"
  name                             = "pweurlnx"
  network_interface_ids            = ["/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/networkInterfaces/pweurlnx997"]
  primary_network_interface_id     = null
  proximity_placement_group_id     = null
  resource_group_name              = "PRO-WEUR-LNX"
  tags                             = {}
  vm_size                          = "Standard_B2ms"
  zones                            = []
  additional_capabilities {
    ultra_ssd_enabled = null
  }
  boot_diagnostics {
    enabled     = true
    storage_uri = ""
  }
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
  os_profile {
    admin_password = null # sensitive
    admin_username = "dordonc"
    computer_name  = "pweurlnx"
    custom_data    = null
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMWrDB94Af5pcyzVPM1N5hrRQRNdL/rSg2wJYedUxr/o2eN4eBopZRR5w7VQb8+BYBsYNTAWwxS35tgv2indH5cvpgRJRxEs5DrA89+8RR4Nwix0sor50xy74e/ClFSrot+m/ZTu1/g+2/vEGADSKeDWGQ5jKA9+DZbCen8uee/qJ8BktYsmjgCG4tW1dvIUdjnMbSw9y7rFxdOg8FtLnpzCFHZOpodARL0JeV9rGKj0HIB1LL84EAOYhYEADmZpk2jtPAtxW9RW4G5uPv8BMJmBJN4KpazbptMWnenNgyE2iPUfyPRwObJIkA1DHf89x2PaWfCivApdZcbxZdtX8/CuYXFUb2N19FJ+ZEjKYu4Q4glHPNFRcWNjzBM/s5mR0Su3YJgWEsul9vj8+2v5rYBSeAnySr9smH/bFG2L1wQMQhBO41DsnK5mDQQGrqdzOlI9AeQQEgcrhtpGE0N8Bo3SiEXURCeuwbYJR6AmXhg+ZErZYVfIBeJIbFCTrSCbs= dordo@WINAPH9mKCpzjzR"
      path     = "/home/dordonc/.ssh/authorized_keys"
    }
  }
  storage_data_disk {
    caching                   = "ReadWrite"
    create_option             = "Attach"
    disk_size_gb              = 128
    lun                       = 1
    managed_disk_id           = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/disks/nc2"
    managed_disk_type         = "StandardSSD_LRS"
    name                      = "nc2"
    vhd_uri                   = null
    write_accelerator_enabled = false
  }
  storage_image_reference {
    id        = null
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  storage_os_disk {
    caching                   = "ReadWrite"
    create_option             = "FromImage"
    disk_size_gb              = 30
    image_uri                 = null
    managed_disk_id           = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/disks/pweurlnx_disk1_d69f8a2b6117463b8b503a05769f9a3b"
    managed_disk_type         = "Premium_LRS"
    name                      = "pweurlnx_disk1_d69f8a2b6117463b8b503a05769f9a3b"
    os_type                   = "Linux"
    vhd_uri                   = null
    write_accelerator_enabled = false
  }
  timeouts {
    create = null
    delete = null
    read   = null
    update = null
  }
}
