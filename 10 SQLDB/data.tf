data "azurerm_resource_group" "jan_rg1" {
  name = "jan_rg1"
}



data "azurerm_mssql_server" "example" {
  name                = "jandatabaseservernew"
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
}