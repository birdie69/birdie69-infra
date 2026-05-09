location            = "westeurope"
resource_group_name = "rg-birdie69-staging"
api_image           = "REPLACE_WITH_REAL_VALUE.azurecr.io/birdie69-api:latest"
cms_image           = "REPLACE_WITH_REAL_VALUE.azurecr.io/birdie69-cms:latest"
tenant_id           = "REPLACE_WITH_REAL_VALUE"

name_prefix = "birdie69"

# Staging sizing (prod-like)
postgres_sku_name   = "GP_Standard_D2s_v3"
postgres_storage_mb = 32768
redis_sku_name      = "Standard"
redis_family        = "C"
redis_capacity      = 1
container_cpu       = 0.5
container_memory    = "1Gi"

notification_job_image = "REPLACE_WITH_REAL_VALUE"
