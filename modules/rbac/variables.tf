variable "management_group_id" {
  type        = string
  description = "Management group name/id"
}

variable "platform_owner_object_id" {
  type        = string
  description = "Optional: Entra ID Object ID for Platform Owner (user/group/sp)."
  default     = null
}
