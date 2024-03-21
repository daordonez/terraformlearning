
import {
  to = azurerm_virtual_network.vnet-lab03
  id = "[...]/providers/Microsoft.Network/virtualNetworks/tf-weur-vnet"
}

import {
  to = azurerm_subnet.default-lab03
  id = "[...]/providers/Microsoft.Network/virtualNetworks/tf-weur-vnet/subnets/default"
}
import {
  to = azurerm_subnet.sub01-lab03
  id = "[...]/providers/Microsoft.Network/virtualNetworks/tf-weur-vnet/subnets/sub01"
}
import {
  to = azurerm_subnet.sub02-lab03
  id = "[...]/providers/Microsoft.Network/virtualNetworks/tf-weur-vnet/subnets/sub02"
}
import {
  to = azurerm_subnet.sub03-lab03
  id = "[...]/providers/Microsoft.Network/virtualNetworks/tf-weur-vnet/subnets/sub03"
}

import {
  to = azurerm_nat_gateway.natgw-lab03
  id = "[...]/providers/Microsoft.Network/natGateways/tf-subnet-def-nat"
}

import {
  to = azurerm_network_security_group.nsg-default
  id = "[...]/providers/Microsoft.Network/networkSecurityGroups/tf-subnet-def-nsg"
}

import {
  to = azurerm_public_ip.pip-lab03
  id = "[...]/providers/Microsoft.Network/publicIPAddresses/default"
}