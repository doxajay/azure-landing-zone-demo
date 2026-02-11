variable "prefix" {
  type        = string
  description = "Naming prefix for resources"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/test/prod)"
}

variable "hub_address_space" {
  type        = list(string)
  description = "CIDR(s) for the hub VNet"
}

variable "spoke_address_spaces" {
  type        = map(list(string))
  description = "Map of spoke name => list of CIDR(s)"
}
