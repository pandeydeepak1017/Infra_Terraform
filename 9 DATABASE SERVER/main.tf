resource "azurerm_mssql_server" "server" {

  for_each =var.server

  name                         = each.value.name
  resource_group_name          = data.azurerm_resource_group.jan_rg1.name
  location                     = data.azurerm_resource_group.jan_rg1.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = data.azurerm_key_vault_secret.seceret.value
}