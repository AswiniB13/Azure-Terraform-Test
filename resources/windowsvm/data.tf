data "azurerm_client_config" "current" {}
data "azurerm_key_vault" "keyvault" {
  name                = "abtestkv01"
  resource_group_name = "rg-dev-01"
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "server-password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
