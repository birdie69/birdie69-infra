terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

module "app" {
  source = "../../blueprints/app"

  env                     = "dev"
  location                = var.location
  resource_group_name     = var.resource_group_name
  api_image               = var.api_image
  cms_image               = var.cms_image
  tenant_id               = var.tenant_id
  name_prefix             = var.name_prefix
  postgres_sku_name       = var.postgres_sku_name
  postgres_storage_mb     = var.postgres_storage_mb
  redis_sku_name          = var.redis_sku_name
  redis_family            = var.redis_family
  redis_capacity          = var.redis_capacity
  container_cpu           = var.container_cpu
  container_memory        = var.container_memory
  postgres_admin_password = var.postgres_admin_password
}
