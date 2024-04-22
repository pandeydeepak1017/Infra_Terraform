resource "azurerm_bastion_host" "deepakbst" {
  
  name                = "jan_bastion"
  location            = data.azurerm_resource_group.jan_rg1.location
  resource_group_name = data.azurerm_resource_group.jan_rg1.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.dpip.id
  }
}