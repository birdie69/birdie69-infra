data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  tenant_id                  = var.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = false
}

resource "azurerm_key_vault_access_policy" "current" {
  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = var.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = var.key_permissions
  secret_permissions = var.secret_permissions
}

resource "azurerm_key_vault_access_policy" "principals" {
  for_each = var.object_ids

  key_vault_id = azurerm_key_vault.this.id
  tenant_id    = var.tenant_id
  object_id    = each.value

  key_permissions    = var.key_permissions
  secret_permissions = var.secret_permissions
}

resource "azurerm_role_assignment" "api_kv_secrets_user" {
  count = var.api_principal_id != "" ? 1 : 0

  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.api_principal_id
}
