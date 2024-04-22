resource "azurerm_mssql_database" "database" {

  for_each = var.sql



  name           = each.value.name
  server_id      = data.azurerm_mssql_server.example.id
  
}