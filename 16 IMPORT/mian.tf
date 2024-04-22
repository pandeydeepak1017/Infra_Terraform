# /subscriptions/07d28b30-1b1e-4a0c-9651-65f570421348/resourceGroups/import_rg

#terraform import azurerm_resource_group.rg /subscriptions/07d28b30-1b1e-4a0c-9651-65f570421348/resourceGroups/rg
#terraform import azurerm_storage_account.storageAcc1 /subscriptions/07d28b30-1b1e-4a0c-9651-65f570421348/resourceGroups/import_rg/providers/Microsoft.Storage/storageAccounts/stgaccd


resource "azurerm_resource_group" "rg" {
  location = "eastus"
   name     = "rg"
}

resource "azurerm_storage_account" "qwert12" {
  name                     = "qwert12"
  resource_group_name      = "rg"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

 
}
  
