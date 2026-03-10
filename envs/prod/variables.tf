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
  description = "API container image"
}

variable "cms_image" {
  type        = string
  description = "CMS container image"
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}

variable "name_prefix" {
  type        = string
  default     = "birdie69"
  description = "Prefix for resource names"
}

variable "postgres_sku_name" {
  type        = string
  description = "PostgreSQL SKU"
}

variable "postgres_storage_mb" {
  type        = number
  description = "PostgreSQL storage MB"
}

variable "redis_sku_name" {
  type        = string
  description = "Redis SKU"
}

variable "redis_family" {
  type        = string
  description = "Redis family"
}

variable "redis_capacity" {
  type        = number
  description = "Redis capacity"
}

variable "container_cpu" {
  type        = number
  description = "Container CPU cores"
}

variable "container_memory" {
  type        = string
  description = "Container memory"
}
