resource "azurerm_resource_group" "log" {
  name     = "rg-${var.prefix}-${var.environment}-log"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${var.prefix}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.log.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
