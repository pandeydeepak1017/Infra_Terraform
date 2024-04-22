data "azurerm_resource_group" "jan_rg1" {
  name = "jan_rg1"
}

data "azurerm_subnet" "subnet" {
  for_each = var.nic
  name                 = each.value.name
  virtual_network_name = "jan_vnet1"
  resource_group_name  = data.azurerm_resource_group.jan_rg1.name
}