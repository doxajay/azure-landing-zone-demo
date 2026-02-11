locals {
  mg_scope = "/providers/Microsoft.Management/managementGroups/${var.management_group_id}"
}

resource "azurerm_policy_definition" "require_tags" {
  name         = "${var.prefix}-require-tags"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "${var.prefix} - Require Tags (owner, environment)"

  policy_rule = jsonencode({
    if = {
      anyOf = [
        { field = "tags['owner']",       exists = "false" },
        { field = "tags['environment']", exists = "false" }
      ]
    }
    then = { effect = "deny" }
  })

  metadata = jsonencode({
    category = "Governance"
  })
}

resource "azurerm_management_group_policy_assignment" "require_tags" {
  name                 = "${var.prefix}-require-tags-assignment"
  management_group_id  = var.management_group_id
  policy_definition_id = azurerm_policy_definition.require_tags.id

  display_name = "${var.prefix} - Require Tags at MG"
}
