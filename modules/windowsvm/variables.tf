variable "name" {
  description = "The name of the Virtual Machine"
  type        = string
}

variable "location" {
  description = "The location/region where the Virtual Machine will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface to attach to the VM"
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "os_disk_type" {
  description = "The type of the OS disk (e.g., Standard_LRS or Premium_LRS)"
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  description = "The publisher of the image (e.g., MicrosoftWindowsServer)"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "image_offer" {
  description = "The offer of the image (e.g., WindowsServer)"
  type        = string
  default     = "WindowsServer"
}

variable "image_sku" {
  description = "The SKU of the image (e.g., 2019-Datacenter)"
  type        = string
  default     = "2019-Datacenter"
}

variable "image_version" {
  description = "The version of the image (e.g., latest)"
  type        = string
  default     = "latest"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM (ensure this is securely managed)"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to assign to the VM"
  type        = map(string)
  default     = {}
}
