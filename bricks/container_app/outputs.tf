output "id" {
  value       = azurerm_container_app.this.id
  description = "Container App resource ID"
}

output "name" {
  value       = azurerm_container_app.this.name
  description = "Container App name"
}

output "fqdn" {
  value       = try(azurerm_container_app.this.ingress[0].fqdn, null)
  description = "FQDN of the Container App (when ingress enabled)"
}

output "latest_revision_fqdn" {
  value       = try(azurerm_container_app.this.latest_revision_fqdn, null)
  description = "FQDN of the latest revision"
}
