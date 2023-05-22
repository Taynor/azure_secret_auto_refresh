data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "arg" {
  name     = var.resource_group_name
}

data "azuread_application" "aa" {
  display_name = var.azuread_application_name
}

data "azurerm_key_vault" "akv" {
  name                       = var.key_vault_name
  resource_group_name        = data.azurerm_resource_group.arg.name
}

resource "time_rotating" "tr" {
  rotation_days = 7
}

resource "azuread_application_password" "aap" {
  application_object_id = data.azuread_application.aa.object_id
  rotate_when_changed = {
    rotation = time_rotating.tr.id
  }
  depends_on = [ data.azuread_application.aa ]
}

resource "azurerm_key_vault_secret" "akvs" {
  name         = var.key_vault_secret_name
  value        = azuread_application_password.aap.value
  key_vault_id = data.azurerm_key_vault.akv.id
  depends_on = [ azuread_application_password.aap, data.azurerm_key_vault.akv ]
}