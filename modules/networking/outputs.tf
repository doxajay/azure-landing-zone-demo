output "network_resource_group_name" {
  value = azurerm_resource_group.net.name
}

output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "spoke_vnet_ids" {
  value = { for k, v in azurerm_virtual_network.spokes : k => v.id }
}
