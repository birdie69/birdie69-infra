location            = "westeurope"
resource_group_name = "rg-birdie69-dev"
api_image           = "REPLACE_WITH_REAL_VALUE.azurecr.io/birdie69-api:latest"
cms_image           = "REPLACE_WITH_REAL_VALUE.azurecr.io/birdie69-cms:latest"
tenant_id           = "REPLACE_WITH_REAL_VALUE"

name_prefix = "birdie69"

# Dev sizing
postgres_sku_name   = "B_Standard_B1ms"
postgres_storage_mb = 32768
redis_sku_name      = "Basic"
redis_family        = "C"
redis_capacity      = 0
container_cpu       = 0.5
container_memory    = "1Gi"
