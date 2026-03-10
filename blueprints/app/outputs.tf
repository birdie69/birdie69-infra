output "api_fqdn" {
  value       = module.api.fqdn
  description = "API Container App FQDN"
}

output "cms_fqdn" {
  value       = module.cms.fqdn
  description = "CMS Container App FQDN"
}

output "api_url" {
  value       = "https://${module.api.fqdn}"
  description = "API base URL"
}

output "cms_url" {
  value       = "https://${module.cms.fqdn}"
  description = "CMS base URL"
}

output "db_connection_string_template" {
  value       = module.postgres.connection_string_template
  description = "PostgreSQL connection string (password from Key Vault)"
}

output "acr_login_server" {
  value       = module.acr.login_server
  description = "ACR login server"
}

output "key_vault_uri" {
  value       = module.key_vault.vault_uri
  description = "Key Vault URI"
}

output "blob_primary_endpoint" {
  value       = module.blob_storage.primary_blob_endpoint
  description = "Blob storage primary endpoint"
}
