output "server_id" {
  value       = azurerm_postgresql_flexible_server.this.id
  description = "PostgreSQL Flexible Server resource ID"
}

output "server_fqdn" {
  value       = azurerm_postgresql_flexible_server.this.fqdn
  description = "Server FQDN"
}

output "database_name" {
  value       = azurerm_postgresql_flexible_server_database.this.name
  description = "Database name"
}

output "connection_string_template" {
  value       = "Host=${azurerm_postgresql_flexible_server.this.fqdn};Database=${azurerm_postgresql_flexible_server_database.this.name};Username=${var.admin_login};Password=<inject from Key Vault or secret>;SSL Mode=Require"
  description = "Connection string template (password must be injected from Key Vault or TF_VAR at runtime)"
}
