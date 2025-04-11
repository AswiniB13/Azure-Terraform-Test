# Azure-Terraform-Test 
**Note:** Due to time constraints, I have provisioned the essential infrastructure. Under Networking we can include UDR's, NSG's and Vnet Peering. And also we can deploy and make use of PAAS resources like Storage Account, Backup policies and Key Vault. We can provision Linux and Windows VM's with Extensions.

## 1. Build a reusable Terraform module to deploy an Azure Virtual Network (VNET).
Created a reusable Terraform module for deploying the Azure Virtual Network. Using this module we can deploy multiple Vnets in Multiple environments.Also with Vnet i have created some more Terraform modules which i am using for configuring the Infrastructure.

Please refer the below link for the created modules:

[Terraform Modules Link](https://github.com/AswiniB13/Azure-Terraform-Test/tree/main/modules)

## 2. Use this module to create multiple environments in Azure (eg: Develoment and Production), adding a few additional resources of your choice.
Using the above Terraform modules i have deployed the Basic networking resources which i require for the basic Windows VM deployment and we can also create base modules for UDR and NSG as part of network configuration. Also deployed the Windows VM using deployed networking resources.

Please refer below link for created resource templates :

[Azure Resources link](https://github.com/AswiniB13/Azure-Terraform-Test/tree/main/resources)

Using the above resource template we can deploy multiple resources into multiple environments by using different tfvar files.

[Env files](https://github.com/AswiniB13/Azure-Terraform-Test/tree/main/env)

![Alt Text](https://github.com/AswiniB13/Azure-Terraform-Test/blob/main/images/1.png)

## Submit your work via one or many GitHub repositories, make them plublic and share the URL with us.
For base modules we can use separate repo and share it with multiple teams, so that they can make use of same modules.but here i have used single repo for time being.
Here is the Repo [link](https://github.com/AswiniB13/Azure-Terraform-Test)

**Terraform Plan for Netwotking resources :**
```
PS C:\terraformtest\Azure-Terraform-Test\resources\networking> terraform plan -var-file "C:\terraformtest\Azure-Terraform-Test\env\networking\prod.terraform.tfvars"

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the        
following symbols:
  + create

Terraform will perform the following actions:

  # module.resource_groups["rg-prod-01"].azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "rg-prod-01"
      + tags     = {
          + "environment" = "Production"
          + "owner"       = "Team A"
        }
    }

  # module.vnets["vnet1"].azurerm_subnet.subnet["0"] will be created
  + resource "azurerm_subnet" "subnet" {
      + address_prefixes                              = [
          + "10.x.x.x/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "subnet1"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "rg-prod-01"
      + virtual_network_name                          = "vnet1"
    }

  # module.vnets["vnet1"].azurerm_subnet.subnet["1"] will be created
  + resource "azurerm_subnet" "subnet" {
      + address_prefixes                              = [
          + "10.x.x.x/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "subnet2"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "rg-prod-01"
      + virtual_network_name                          = "vnet1"
    }

  # module.vnets["vnet1"].azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space                  = [
          + "10.0.x.x/16",
        ]
      + dns_servers                    = (known after apply)
      + guid                           = (known after apply)
      + id                             = (known after apply)
      + location                       = "eastus"
      + name                           = "vnet1"
      + private_endpoint_vnet_policies = "Disabled"
      + resource_group_name            = "rg-prod-01"
      + subnet                         = (known after apply)
      + tags                           = {
          + "environment" = "prodelopment"
          + "owner"       = "Team A"
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run  
"terraform apply" now.
```
**Terraform Plan for Windows VM :**

```
# module.network_interfaces["nic1"].azurerm_network_interface.nic will be created
  + resource "azurerm_network_interface" "nic" {
      + accelerated_networking_enabled = false
      + applied_dns_servers            = (known after apply)
      + id                             = (known after apply)
      + internal_domain_name_suffix    = (known after apply)
      + ip_forwarding_enabled          = false
      + location                       = "eastus"
      + mac_address                    = (known after apply)
      + name                           = "nic1"
      + private_ip_address             = (known after apply)
      + private_ip_addresses           = (known after apply)
      + resource_group_name            = "rg-prod-01"
      + tags                           = {
          + "environment" = "Production"
          + "owner"       = "Team A"
        }
      + virtual_machine_id             = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
          + name                                               = "ipconfig1"
          + primary                                            = (known after apply)
          + private_ip_address                                 = (known after apply)
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + subnet_id                                          = "/subscriptions/52b0d977-da36-47fxxxxxxx/resourceGroups/rg-prod-01/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"
        }
    }

  # module.windows_vms["vm1"].azurerm_virtual_machine.vm will be created
  + resource "azurerm_virtual_machine" "vm" {
      + availability_set_id              = (known after apply)
      + delete_data_disks_on_termination = false
      + delete_os_disk_on_termination    = false
      + id                               = (known after apply)
      + license_type                     = (known after apply)
      + location                         = "eastus"
      + name                             = "vm1"
      + network_interface_ids            = [
          + "/subscriptions/52b0d977xxxxxxxxxx/resourceGroups/rg-prod-01/providers/Microsoft.Network/networkInterfaces/nic1",
        ]
      + resource_group_name              = "rg-prod-01"
      + tags                             = {
          + "environment" = "Production"
          + "owner"       = "Team A"
        }
      + vm_size                          = "Standard_DS1_v2"

      + os_profile {
          # At least one attribute in this block is (or was) sensitive,
          # so its contents will not be displayed.
        }

      + os_profile_windows_config {
          + enable_automatic_upgrades = true
          + provision_vm_agent        = true
            # (1 unchanged attribute hidden)
        }

      + storage_data_disk (known after apply)

      + storage_image_reference {
            id        = null
          + offer     = "WindowsServer"
          + publisher = "MicrosoftWindowsServer"
          + sku       = "2019-Datacenter"
          + version   = "latest"
        }

      + storage_os_disk {
          + caching                   = "ReadWrite"
          + create_option             = "FromImage"
          + disk_size_gb              = (known after apply)
          + managed_disk_id           = (known after apply)
          + managed_disk_type         = "Standard_LRS"
          + name                      = "vm1-osdisk"
          + os_type                   = (known after apply)
          + write_accelerator_enabled = false
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```











