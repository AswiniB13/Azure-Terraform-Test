output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_virtual_machine.vm.id
}

output "vm_public_ip" {
  description = "The public IP address of the Virtual Machine"
  value       = azurerm_network_interface.nic.ip_configuration[0].public_ip_address_id
}
