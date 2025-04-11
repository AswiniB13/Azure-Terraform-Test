resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetName
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }

  name                 = each.value.subnetName
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
}
