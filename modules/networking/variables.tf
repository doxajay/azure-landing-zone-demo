variable "prefix" { type = string }
variable "location" { type = string }
variable "environment" { type = string }

variable "hub_address_space" {
  type        = list(string)
  description = "CIDR(s) for hub vnet"
  default     = ["10.0.0.0/16"]
}

variable "private_endpoints_subnet_prefix" {
  type        = list(string)
  description = "CIDR(s) for Private Endpoint subnet"
  default     = ["10.0.10.0/24"]
}
