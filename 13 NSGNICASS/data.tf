data "azurerm_resource_group" "drg" {
  name = "jan_rg1"
}
data "azurerm_network_security_group" "ddnsg" {
  for_each            = var.nnsg
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.drg.name
}

data "azurerm_network_interface" "example" {
  for_each            = var.nnsg
  name                = each.value.name1
  resource_group_name = data.azurerm_resource_group.drg.name
}