output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "hub_vnet_name" {
  value = azurerm_virtual_network.hub.name
}

output "hub_rg_name" {
  value = azurerm_resource_group.hub.name
}

output "private_endpoints_subnet_id" {
  value = azurerm_subnet.private_endpoints.id
}
