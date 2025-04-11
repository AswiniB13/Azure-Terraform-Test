variable "vnetName" {
  description = "The name of the Virtual Network"
  type        = string
  default = ""
}

variable "location" {
  description = "The Azure region where the VNet will be created"
  type        = string
  default = ""
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
  default = ""
}

variable "address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
  default = ""
}

variable "subnets" {
  description = "A list of subnets to create within the VNet"
  type = list(object({
    subnetName            = string
    address_prefixes = list(string)
  }))
}

variable "tags" {
  description = "A map of tags to assign to the VNet"
  type        = map(string)
  default     = {}
}
