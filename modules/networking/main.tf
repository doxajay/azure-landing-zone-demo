resource "azurerm_resource_group" "net" {
  name     = "rg-${var.prefix}-${var.environment}-net"
  location = var.location
}

resource "azurerm_virtual_network" "hub" {
  name                = "vnet-${var.prefix}-${var.environment}-hub"
  location            = var.location
  resource_group_name = azurerm_resource_group.net.name
  address_space       = var.hub_address_space
}

resource "azurerm_subnet" "hub_private_endpoints" {
  name                 = "snet-private-endpoints"
  resource_group_name  = azurerm_resource_group.net.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.10.0/24"]

  private_endpoint_network_policies_enabled = true
}

resource "azurerm_subnet" "hub_firewall" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.net.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.20.0/24"]
}

resource "azurerm_virtual_network" "spokes" {
  for_each            = var.spoke_address_spaces
  name                = "vnet-${var.prefix}-${var.environment}-spoke-${each.key}"
  location            = var.location
  resource_group_name = azurerm_resource_group.net.name
  address_space       = each.value
}

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  for_each                  = azurerm_virtual_network.spokes
  name                      = "peer-hub-to-${each.key}"
  resource_group_name       = azurerm_resource_group.net.name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = each.value.id
  allow_forwarded_traffic   = true
  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  for_each                  = azurerm_virtual_network.spokes
  name                      = "peer-${each.key}-to-hub"
  resource_group_name       = azurerm_resource_group.net.name
  virtual_network_name      = each.value.name
  remote_virtual_network_id = azurerm_virtual_network.hub.id
  allow_forwarded_traffic   = true
  allow_virtual_network_access = true
}
