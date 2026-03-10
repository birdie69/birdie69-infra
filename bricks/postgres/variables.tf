variable "name" {
  type        = string
  description = "Base name for PostgreSQL server (e.g. birdie69-db)"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sku_name" {
  type        = string
  default     = "B_Standard_B1ms"
  description = "SKU name (e.g. B_Standard_B1ms, GP_Standard_D2s_v3)"
}

variable "storage_mb" {
  type        = number
  default     = 32768
  description = "Storage in MB"
}

variable "admin_login" {
  type        = string
  description = "Server admin login (no secrets here; password from Key Vault)"
}

variable "database_name" {
  type        = string
  default     = "birdie69"
  description = "Database name to create"
}

variable "postgres_version" {
  type        = string
  default     = "15"
  description = "PostgreSQL version"
}
