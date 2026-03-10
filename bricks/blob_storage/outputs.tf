output "id" {
  value       = azurerm_storage_account.this.id
  description = "Storage account resource ID"
}

output "name" {
  value       = azurerm_storage_account.this.name
  description = "Storage account name"
}

output "primary_connection_string" {
  value       = azurerm_storage_account.this.primary_connection_string
  sensitive   = true
  description = "Primary connection string (sensitive)"
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.this.primary_blob_endpoint
  description = "Primary blob endpoint"
}

output "container_names" {
  value       = [for c in azurerm_storage_container.this : c.name]
  description = "Created container names"
}
