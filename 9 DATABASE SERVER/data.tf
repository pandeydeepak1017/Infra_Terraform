data "azurerm_resource_group" "jan_rg1" {
  name = "jan_rg1"
}

data "azurerm_key_vault" "keyvault" {
  name                = "eeepakkeyvault"
  resource_group_name = data.azurerm_resource_group.jan_rg1.name
}
data "azurerm_key_vault_secret" "seceret" {
  name         = "deepak1234"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}