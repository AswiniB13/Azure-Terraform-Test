variable "rgname" {
  description = "The name of the resource group"
  type        = string
  default = ""
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default = ""
}

variable "tags" {
  description = "A map of tags to assign to the resource group"
  type        = map(string)
  default     = {}
}