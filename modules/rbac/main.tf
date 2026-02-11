locals {
  mg_scope = "/providers/Microsoft.Management/managementGroups/${var.management_group_id}"
}

resource "azurerm_role_assignment" "platform_owner" {
  count                = var.platform_owner_object_id == null ? 0 : 1
  scope                = local.mg_scope
  role_definition_name = "Owner"
  principal_id         = var.platform_owner_object_id
}
