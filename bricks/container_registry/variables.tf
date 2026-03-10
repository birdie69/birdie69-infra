variable "name" {
  type        = string
  description = "ACR name (e.g. birdie69acr, alphanumeric only)"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sku" {
  type        = string
  default     = "Basic"
  description = "SKU (Basic, Standard, Premium)"
}

variable "admin_enabled" {
  type        = bool
  default     = false
  description = "Enable admin user (prefer managed identity in production)"
}
