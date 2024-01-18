data "azurerm_dns_zone" "dns_root_id" {
  name = var.dns_root_zone
}

import {
  to = azurerm_dns_zone.dns-root-zone
  id = data.azurerm_dns_zone.dns_root_id.id
}