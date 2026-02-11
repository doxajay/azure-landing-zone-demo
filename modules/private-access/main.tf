resource "azurerm_private_dns_zone" "kv" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.hub_resource_group
}

resource "azurerm_private_dns_zone" "sql" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.hub_resource_group
}

resource "azurerm_private_dns_zone" "storage_blob" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.hub_resource_group
}

resource "azurerm_private_dns_zone_virtual_network_link" "kv_link" {
  name                  = "link-${var.prefix}-${var.environment}-kv"
  resource_group_name   = var.hub_resource_group
  private_dns_zone_name = azurerm_private_dns_zone.kv.name
  virtual_network_id    = var.hub_vnet_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_link" {
  name                  = "link-${var.prefix}-${var.environment}-sql"
  resource_group_name   = var.hub_resource_group
  private_dns_zone_name = azurerm_private_dns_zone.sql.name
  virtual_network_id    = var.hub_vnet_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "storage_blob_link" {
  name                  = "link-${var.prefix}-${var.environment}-stblob"
  resource_group_name   = var.hub_resource_group
  private_dns_zone_name = azurerm_private_dns_zone.storage_blob.name
  virtual_network_id    = var.hub_vnet_id
}
