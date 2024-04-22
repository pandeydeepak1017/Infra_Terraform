resource "azurerm_network_security_group" "nsg" {
    for_each = var.nnsg
  name                = each.value.name
  location            = data.azurerm_resource_group.jan_rg1.location
  resource_group_name = data.azurerm_resource_group.jan_rg1.name


  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }


}