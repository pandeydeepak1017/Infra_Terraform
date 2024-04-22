
resource "azurerm_subnet" "subnet" {
  for_each = var.subnet

  name                 = each.value.name
  resource_group_name  = data.azurerm_resource_group.jan_rg1.name
  virtual_network_name = data.azurerm_virtual_network.jan_vnet1.name
  address_prefixes     = each.value.address_prefixes
}
