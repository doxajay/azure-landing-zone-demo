module "management_groups" {
  source = "./modules/management-groups"
  prefix = var.prefix
}

module "policy" {
  source = "./modules/policy"
  prefix = var.prefix

  # pass the full resource ID format
  management_group_id = "/providers/Microsoft.Management/managementGroups/${module.management_groups.platform_mg_id}"
}


module "rbac" {
  source              = "./modules/rbac"
  management_group_id = module.management_groups.platform_mg_id
}

module "logging" {
  source      = "./modules/logging"
  prefix      = var.prefix
  location    = var.location
  environment = var.environment
}

module "networking" {
  source      = "./modules/networking"
  prefix      = var.prefix
  location    = var.location
  environment = var.environment
}

module "private_access" {
  source              = "./modules/private-access"
  prefix              = var.prefix
  location            = var.location
  environment         = var.environment
  hub_vnet_id         = module.networking.hub_vnet_id
  hub_vnet_name       = module.networking.hub_vnet_name
  hub_resource_group  = module.networking.hub_rg_name
}
