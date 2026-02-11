variable "location" {
  type    = string
  default = "canadacentral"
}

variable "prefix" {
  type    = string
  default = "alz"
}

variable "environment" {
  type    = string
  default = "prod"
}

# Your existing subscription id (place it under correct MG)
variable "subscription_id" {
  type = string
}
