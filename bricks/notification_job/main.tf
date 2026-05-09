resource "azurerm_container_app_job" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  container_app_environment_id = var.container_apps_environment_id
  replica_timeout_in_seconds   = 300

  schedule_trigger_config {
    cron_expression          = "0 * * * *"
    parallelism              = 1
    replica_completion_count = 1
  }

  template {
    container {
      name   = "notification-job"
      image  = var.image
      cpu    = 0.25
      memory = "0.5Gi"

      dynamic "env" {
        for_each = var.env_vars
        content {
          name  = env.value.name
          value = env.value.value
        }
      }
    }
  }
}
