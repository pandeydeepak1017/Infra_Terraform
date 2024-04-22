# data "azurerm_public_ip" "public_ip" {

#   for_each = var.nic
#   name                = each.value.pipname
#   resource_group_name = each.value.resource_group_name
# }



resource "azurerm_network_interface" "nic" {

  for_each = var.nic


  name                = each.value.nicname
  location            = data.azurerm_resource_group.jan_rg1.location
  resource_group_name = data.azurerm_resource_group.jan_rg1.name



  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
   # public_ip_address_id = data.azurerm_public_ip.public_ip[each.key].id

  }
}