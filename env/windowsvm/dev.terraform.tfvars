### NIC ##########
nics = {
  "nic1" = {
    location                      = "East US"
    resource_group_name           = "rg-dev-01"
    ip_configuration_name         = "ipconfig1"
    subnet_id                     = "/subscriptions/52xxcccv56789-xxxxxxxxxxxx/resourceGroups/rg-dev-01/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"
    private_ip_allocation         = "Dynamic"
    private_ip_address            = null
    public_ip_address_id          = null
    enable_accelerated_networking = true
    tags = {
      environment = "Development"
      owner       = "Team A"
    }
  }
  
}

### Win VM ######
windows_vms = {
  "vm1" = {
    location             = "East US"
    resource_group_name  = "rg-dev-01"
    network_interface_id = "/subscriptions/52b0xxxxxxxxxxxx-xxxxxx2334/resourceGroups/rg-dev-01/providers/Microsoft.Network/networkInterfaces/nic1"
    vm_size              = "Standard_DS1_v2"
    os_disk_type         = "Standard_LRS"
    image_publisher      = "MicrosoftWindowsServer"
    image_offer          = "WindowsServer"
    image_sku            = "2019-Datacenter"
    image_version        = "latest"
    admin_username       = "adminuser"
    tags = {
      environment = "Development"
      owner       = "Team A"
    }
  }
}

subscription_id = "xxxxxxxxxxxxxx-456789"
