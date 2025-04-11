variable "nicName" {
  description = "The name of the Network Interface"
  type        = string
  default = ""
}

variable "location" {
  description = "The location/region where the Network Interface will be created"
  type        = string
  default = ""
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
  default = ""
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type        = string
  default = ""
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the Network Interface"
  type        = string
  default = ""
}

variable "private_ip_allocation" {
  description = "The allocation method for the private IP (Static or Dynamic)"
  type        = string
  default     = "Dynamic"
}

variable "private_ip_address" {
  description = "The private IP address (only required if using Static allocation)"
  type        = string
  default     = null
}

variable "public_ip_address_id" {
  description = "The ID of the Public IP address to associate with the Network Interface"
  type        = string
  default     = null
}

# variable "enable_accelerated_networking" {
#   description = "Should Accelerated Networking be enabled?"
#   type        = bool
#   default     = false
# }

variable "tags" {
  description = "A map of tags to assign to the Network Interface"
  type        = map(string)
  default     = {}
}
