output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "A list of IDs of the subnets"
  value       = [for subnet in azurerm_subnet.subnet : subnet.id]
}
