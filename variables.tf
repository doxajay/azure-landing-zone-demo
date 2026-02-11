variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID where subscription-level resources (like Log Analytics, networking RG/VNet) will be created."
}

variable "prefix" {
  type        = string
  description = "Naming prefix, e.g. alz, demo, corp"
}

variable "location" {
  type        = string
  description = "Azure region, e.g. canadacentral"
}

variable "environment" {
  type        = string
  description = "Environment, e.g. dev, prod"
}
