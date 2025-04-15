terraform {
  backend "azurerm" {
    resource_group_name  = "ab-test-rg"
    storage_account_name = "abteststorageacc13"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}
### Creating Resource Group ##########
module "resource_groups" {
  source = "github.com/AswiniB13/Azure-Terraform-Test//modules/resourcegroup/?ref=ab-feature-branch"
  
  for_each = var.resource_groups
  rgname   = each.key
  location = each.value.location
  tags     = each.value.tags
}

### Creating Virtual Network ###
module "vnets" {
  source = "github.com/AswiniB13/Azure-Terraform-Test//modules/virtualnetwork/?ref=ab-feature-branch"

  for_each            = var.vnets
  vnetName            = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  subnets             = each.value.subnets
  tags                = each.value.tags
# Explicit dependency on the resource_groups module
  depends_on = [
    module.resource_groups
  ]
}
