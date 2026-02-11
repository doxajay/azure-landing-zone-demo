output "private_dns_zones" {
  value = {
    keyvault = azurerm_private_dns_zone.kv.id
    sql      = azurerm_private_dns_zone.sql.id
    blob     = azurerm_private_dns_zone.storage_blob.id
  }
}
