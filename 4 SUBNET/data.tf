data "azurerm_resource_group" "jan_rg1" {
  name = "jan_rg1"
}
data "azurerm_virtual_network" "jan_vnet1" {
  name = "jan_vnet1"
  resource_group_name = data.azurerm_resource_group.jan_rg1.name

}
