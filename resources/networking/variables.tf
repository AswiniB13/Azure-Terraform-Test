### RG ##########
variable "resource_groups" {
  description = "A map of resource group configurations"
  type        = map(object({
    location = string
    tags     = map(string)
  }))
}

## Vnet #######
variable "vnets" {
  description = "A map of VNet configurations"
  type = map(object({
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets             = list(object({
      subnetName            = string
      address_prefixes = list(string)
    }))
    tags = map(string)
  }))
}

variable "subscription_id" {
  type = string
  description = "subscription id"
}
