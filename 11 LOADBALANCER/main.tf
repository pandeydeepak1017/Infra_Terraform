resource "azurerm_lb" "lb" {
  name                = "loadb"
  location            = data.azurerm_resource_group.jan_rg1.location
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "frontendip"
    public_ip_address_id = data.azurerm_public_ip.dpip.id
  }

}
resource "azurerm_lb_backend_address_pool" "bpl" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackEndAddressPool"
}
resource "azurerm_lb_backend_address_pool_address" "example" {
    for_each =var.dvm
  name                    = each.value.name1
  backend_address_pool_id = azurerm_lb_backend_address_pool.bpl.id
  virtual_network_id      = data.azurerm_virtual_network.dvnet.id
  ip_address              = data.azurerm_virtual_machine.dvm[each.key].private_ip_address
}

# resource "azurerm_network_interface_backend_address_pool_association" "example" {
#   network_interface_id    = azurerm_network_interface.example.id
#   ip_configuration_name   = "testconfiguration1"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
# }

resource "azurerm_lb_probe" "example" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "http-running-probe"
  port            = 80
}
resource "azurerm_lb_rule" "example" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontendip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.bpl.id]
  probe_id                       = azurerm_lb_probe.example.id
}