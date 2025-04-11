variable "nics" {
  description = "A map of Network Interface configurations"
  type = map(object({
    location                      = string
    resource_group_name           = string
    ip_configuration_name         = string
    subnet_id                     = string
    private_ip_allocation         = string
    private_ip_address            = string
    public_ip_address_id          = string
    enable_accelerated_networking = bool
    tags                          = map(string)
  }))
}

### Win VM #######
variable "windows_vms" {
  description = "A map of Windows Virtual Machine configurations"
  type = map(object({
    location                      = string
    resource_group_name           = string
    network_interface_id          = string
    vm_size                       = string
    os_disk_type                  = string
    image_publisher               = string
    image_offer                   = string
    image_sku                     = string
    image_version                 = string
    admin_username                = string
    # admin_password                = string
    tags                          = map(string)
  }))
}

variable "subscription_id" {
  type = string
  description = "subscription id"
}