output "nic_id" {
  description = "The ID of the Network Interface"
  value       = azurerm_network_interface.nic.id
}

output "nic_private_ip" {
  description = "The private IP address of the Network Interface"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}
