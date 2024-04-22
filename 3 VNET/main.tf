resource "azurerm_virtual_network" "vnet" {

  for_each = var.vnet


  name                = each.value.name
  location            = data.azurerm_resource_group.jan_rg1.location
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
  address_space       = ["10.0.0.0/16"]


}