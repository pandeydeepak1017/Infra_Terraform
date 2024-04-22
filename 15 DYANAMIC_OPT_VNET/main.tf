resource "azurerm_virtual_network" "vnet" {
  name                = "new_vnet"
  location            = "france central"
  resource_group_name = "jan_rg2"
  address_space       = ["10.0.0.0/16"]
  

  dynamic "subnet" {
    for_each = var.subnet == null ? {} : var.subnet
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group
    }

  }

}