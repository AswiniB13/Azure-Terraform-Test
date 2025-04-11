### Network Interface ######
module "network_interfaces" {
  source = "github.com/AswiniB13/Azure-Terraform-Test//modules/networkinterface/?ref=ab-feature-branch"  # Path to the NIC module

  for_each = var.nics

  nicName                       = each.key
  location                      = each.value.location
  resource_group_name           = each.value.resource_group_name
  ip_configuration_name         = each.value.ip_configuration_name
  subnet_id                     = each.value.subnet_id
  private_ip_allocation         = each.value.private_ip_allocation
  private_ip_address            = each.value.private_ip_address
  public_ip_address_id          = each.value.public_ip_address_id
  # enable_accelerated_networking = each.value.enable_accelerated_networking
  tags                          = each.value.tags
}

######## WinVM ########
module "windows_vms" {
  source = "github.com/AswiniB13/Azure-Terraform-Test//modules/windowsvm/?ref=ab-feature-branch"

  for_each = var.windows_vms

  name                 = each.key
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  network_interface_id = each.value.network_interface_id
  vm_size              = each.value.vm_size
  os_disk_type         = each.value.os_disk_type
  image_publisher      = each.value.image_publisher
  image_offer          = each.value.image_offer
  image_sku            = each.value.image_sku
  image_version        = each.value.image_version
  admin_username       = each.value.admin_username
  admin_password       = data.azurerm_key_vault_secret.admin_password.value ## Fetach from Key Vault
  tags                 = each.value.tags
# Explicit dependency on the resource_groups module
  depends_on = [
    module.network_interfaces
  ]
}
