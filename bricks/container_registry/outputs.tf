output "id" {
  value       = azurerm_container_registry.this.id
  description = "ACR resource ID"
}

output "name" {
  value       = azurerm_container_registry.this.name
  description = "ACR name"
}

output "login_server" {
  value       = azurerm_container_registry.this.login_server
  description = "ACR login server (e.g. name.azurecr.io)"
}

output "admin_username" {
  value       = azurerm_container_registry.this.admin_username
  description = "Admin username (when admin_enabled)"
  sensitive   = true
}

output "admin_password" {
  value       = azurerm_container_registry.this.admin_password
  description = "Admin password (when admin_enabled)"
  sensitive   = true
}
