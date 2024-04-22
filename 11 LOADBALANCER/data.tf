data "azurerm_resource_group" "jan_rg1" {
  name = "jan_rg1"
}
data "azurerm_virtual_network" "dvnet" {
  name                = "jan_vnet1"
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
}
data "azurerm_public_ip" "dpip" {
  name                = "jan_frontend_ip"
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
}
data "azurerm_virtual_machine" "dvm" {
  for_each            = var.dvm
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
}
data "azurerm_network_interface" "example" {
  for_each = var.nic
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
}