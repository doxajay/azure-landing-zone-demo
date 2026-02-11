output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.law.id
}

output "log_rg_name" {
  value = azurerm_resource_group.log.name
}
