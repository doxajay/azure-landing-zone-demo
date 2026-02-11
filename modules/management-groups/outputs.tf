output "platform_mg_id" {
  description = "Management Group ID (name) for platform"
  value       = azurerm_management_group.platform.name
}

output "platform_mg_scope" {
  description = "Scope string for MG role assignments and policy assignments"
  value       = "/providers/Microsoft.Management/managementGroups/${azurerm_management_group.platform.name}"
}
