resource "azurerm_postgresql_flexible_server" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  version             = var.postgres_version
  administrator_login = var.admin_login
  administrator_password = "REPLACE_WITH_REAL_VALUE" # Set via env / Key Vault; never commit real value

  sku_name   = var.sku_name
  storage_mb = var.storage_mb
}

resource "azurerm_postgresql_flexible_server_database" "this" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
