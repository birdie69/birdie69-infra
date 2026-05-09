output "job_id" {
  value       = azurerm_container_app_job.this.id
  description = "Resource ID of the Container App Job"
}

output "job_name" {
  value       = azurerm_container_app_job.this.name
  description = "Name of the Container App Job"
}
