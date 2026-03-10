terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

locals {
  suffix = var.env
  rg     = var.resource_group_name
  loc    = var.location
  prefix = var.name_prefix
}

# Container Apps Environment (shared by both apps)
resource "azurerm_container_app_environment" "this" {
  name                       = "${local.prefix}-env-${local.suffix}"
  resource_group_name        = local.rg
  location                   = local.loc
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
}

resource "azurerm_log_analytics_workspace" "this" {
  name                = "${local.prefix}-law-${local.suffix}"
  resource_group_name = local.rg
  location            = local.loc
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# --- Bricks ---

module "acr" {
  source = "../../bricks/container_registry"

  name                = "${replace(local.prefix, "-", "")}acr${local.suffix}"
  resource_group_name = local.rg
  location            = local.loc
  sku                 = "Basic"
  admin_enabled       = false
}

module "key_vault" {
  source = "../../bricks/key_vault"

  name                = "${local.prefix}-kv-${local.suffix}"
  resource_group_name = local.rg
  location            = local.loc
  tenant_id           = var.tenant_id
  object_ids          = {}
}

module "postgres" {
  source = "../../bricks/postgres"

  name                   = "${local.prefix}-db-${local.suffix}"
  resource_group_name     = local.rg
  location               = local.loc
  sku_name               = var.postgres_sku_name
  storage_mb             = var.postgres_storage_mb
  admin_login            = "birdie69admin"
  administrator_password = var.postgres_admin_password
  database_name          = "birdie69"
}

module "redis" {
  source = "../../bricks/redis"

  name                = "${local.prefix}-redis-${local.suffix}"
  resource_group_name = local.rg
  location            = local.loc
  sku_name            = var.redis_sku_name
  family              = var.redis_family
  capacity            = var.redis_capacity
}

module "blob_storage" {
  source = "../../bricks/blob_storage"

  name                = "${replace(local.prefix, "-", "")}stor${local.suffix}"
  resource_group_name = local.rg
  location            = local.loc
  containers          = ["uploads"]
}

module "api" {
  source = "../../bricks/container_app"

  name                         = "${local.prefix}-api"
  resource_group_name          = local.rg
  container_app_environment_id = azurerm_container_app_environment.this.id
  image                        = var.api_image
  cpu                          = var.container_cpu
  memory                       = var.container_memory
  env_vars = {
    "ASPNETCORE_ENVIRONMENT" = var.env
    "ConnectionStrings__DefaultConnection" = "Host=${module.postgres.server_fqdn};Database=${module.postgres.database_name};Username=birdie69admin;Password=${var.postgres_admin_password};SSL Mode=Require"
  }
  secret_refs       = {}
  ingress_enabled   = true
  min_replicas      = 0
  max_replicas      = 10
}

module "cms" {
  source = "../../bricks/container_app"

  name                         = "${local.prefix}-cms"
  resource_group_name          = local.rg
  container_app_environment_id = azurerm_container_app_environment.this.id
  image                        = var.cms_image
  cpu                          = var.container_cpu
  memory                       = var.container_memory
  env_vars = {
    "NODE_ENV" = var.env
  }
  secret_refs     = {}
  ingress_enabled = true
  min_replicas    = 0
  max_replicas    = 10
}
