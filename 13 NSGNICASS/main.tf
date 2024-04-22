resource "azurerm_network_interface_security_group_association" "example" {
  for_each                  = var.nnsg
  network_interface_id      = data.azurerm_network_interface.example[each.key].id
  network_security_group_id = data.azurerm_network_security_group.ddnsg[each.key].id
}