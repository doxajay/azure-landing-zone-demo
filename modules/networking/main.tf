resource "azurerm_resource_group" "hub" {
  name     = "rg-${var.prefix}-${var.environment}-hub"
  location = var.location
}

resource "azurerm_virtual_network" "hub" {
  name                = "vnet-${var.prefix}-${var.environment}-hub"
  location            = var.location
  resource_group_name = azurerm_resource_group.hub.name
  address_space       = var.hub_address_space
}

resource "azurerm_subnet" "private_endpoints" {
  name                 = "snet-private-endpoints"
  resource_group_name  = azurerm_resource_group.hub.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = var.private_endpoints_subnet_prefix

  private_endpoint_network_policies_enabled = true
}
