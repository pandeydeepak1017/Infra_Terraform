
resource "azurerm_linux_virtual_machine" "virtualmachine" {

  for_each = var.vm



  name                            = each.value.name
  resource_group_name             = data.azurerm_resource_group.jan_rg1.name
  location                        = data.azurerm_resource_group.jan_rg1.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = data.azurerm_key_vault_secret.seceret.value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.nic[each.key].id]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}