variable "env" {
  type        = string
  description = "Environment name (dev, staging, prod)"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "api_image" {
  type        = string
  description = "API container image (e.g. myacr.azurecr.io/birdie69-api:tag)"
}

variable "cms_image" {
  type        = string
  description = "CMS container image (e.g. myacr.azurecr.io/birdie69-cms:tag)"
}

variable "postgres_sku_name" {
  type        = string
  default     = "B_Standard_B1ms"
  description = "PostgreSQL Flexible Server SKU"
}

variable "postgres_storage_mb" {
  type        = number
  default     = 32768
  description = "PostgreSQL storage in MB"
}

variable "redis_sku_name" {
  type        = string
  default     = "Basic"
  description = "Redis SKU (Basic or Standard)"
}

variable "redis_family" {
  type        = string
  default     = "C"
  description = "Redis SKU family"
}

variable "redis_capacity" {
  type        = number
  default     = 0
  description = "Redis SKU capacity (0 for Basic C0, 1 for Standard C1)"
}

variable "container_cpu" {
  type        = number
  default     = 0.5
  description = "Container App CPU cores"
}

variable "container_memory" {
  type        = string
  default     = "1Gi"
  description = "Container App memory"
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID (for Key Vault)"
}

variable "name_prefix" {
  type        = string
  default     = "birdie69"
  description = "Prefix for resource names"
}
