data "azurerm_resource_group" "jan_rg1" {
  name = "jan_rg1"
}
data "azurerm_subnet" "subnet" {
  
  name                 = "AzureBastionSubnet"
  virtual_network_name = "jan_vnet1"
  resource_group_name  = "jan_rg1"
}
data "azurerm_public_ip" "dpip" {
  name                = "jan_bastion_ip"
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
}