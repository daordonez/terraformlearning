#This file describes all the resource already deployed into az

#Main Resource group
import {
  to = azurerm_resource_group.rg-main
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX"
}

import {
  to = azurerm_virtual_network.vnet01
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/virtualNetworks/pweurlnx-vnet"
}

import {
  to = azurerm_subnet.subnet01
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/virtualNetworks/pweurlnx-vnet/subnets/default"
}

import {
  to = azurerm_subnet.subnet02
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/virtualNetworks/pweurlnx-vnet/subnets/AzureBastionSubnet"
}

import {
  to = azurerm_dns_zone.dnsZone-main
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/dnszones/monojaus.com"
} 

import {
  to = azurerm_public_ip.pIP01
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/publicIPAddresses/pweurlnx-ip"
}

import {
  to = azurerm_network_interface.nic-vm01
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/networkInterfaces/pweurlnx997"
}

import {
  to = azurerm_network_security_group.nsg-vm01
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Network/networkSecurityGroups/pweurlnx-nsg"
}


/* 
import {
  to = azurerm_virtual_machine_extension.VMExt-Acess
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/virtualMachines/pweurlnx/extensions/enablevmAccess"
}

import {
  to = azurerm_managed_disk.vm-lnx01-disk01
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/disks/pweurlnx_disk1_d69f8a2b6117463b8b503a05769f9a3b"
}
import {
  to = azurerm_dev_test_schedule.vm-lnx01-ShutDown
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.DevTestLab/schedules/shutdown-computevm-pweurlnx"
import {
  to = azurerm_managed_disk.vm-lnx01-disk02
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/disks/nc2"
}

import {
  to = azurerm_virtual_machine.vm-lnx01
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/virtualMachines/pweurlnx"
}

import {
  to = azurerm_virtual_machine_extension.VMExt-AADSSH
  id = "/subscriptions/dfc1c669-4460-40a1-8d6a-3469f2b10f23/resourceGroups/PRO-WEUR-LNX/providers/Microsoft.Compute/virtualMachines/pweurlnx/extensions/AADSSHLoginForLinux"
}
}*/



