# resource "azurerm_resource_group" "rg" {
#   name     = module.naming.resource_group_name
#   location = local.azure_regions[random_integer.region_index.result]
# }