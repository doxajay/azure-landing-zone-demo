output "rbac_scope" {
  value = "/providers/Microsoft.Management/managementGroups/${var.management_group_id}"
}
