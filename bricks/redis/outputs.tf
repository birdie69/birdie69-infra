output "id" {
  value       = azurerm_redis_cache.this.id
  description = "Redis cache resource ID"
}

output "hostname" {
  value       = azurerm_redis_cache.this.hostname
  description = "Redis hostname"
}

output "primary_connection_string" {
  value       = azurerm_redis_cache.this.primary_connection_string
  sensitive   = true
  description = "Primary connection string (sensitive)"
}

output "primary_access_key" {
  value       = azurerm_redis_cache.this.primary_access_key
  sensitive   = true
  description = "Primary access key (sensitive)"
}
