resource "azurerm_management_group" "platform" {
  display_name = "${var.prefix}-platform"
  name         = "${var.prefix}-platform"
}
