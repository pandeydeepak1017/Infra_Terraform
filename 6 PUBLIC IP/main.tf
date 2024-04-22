resource "azurerm_public_ip" "public_ip" {
  for_each            = var.public_ip
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
  location            = data.azurerm_resource_group.jan_rg1.location
  allocation_method   = "Static"
  sku = "Standard"


}