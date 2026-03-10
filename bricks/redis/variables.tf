variable "name" {
  type        = string
  description = "Redis cache name (e.g. birdie69-redis)"
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
  default     = "Basic"
  description = "SKU: Basic or Standard"
}

variable "family" {
  type        = string
  default     = "C"
  description = "SKU family (e.g. C)"
}

variable "capacity" {
  type        = number
  default     = 0
  description = "SKU capacity (e.g. 0 for Basic C0, 1 for Standard C1)"
}

variable "enable_non_ssl_port" {
  type        = bool
  default     = false
  description = "Enable non-SSL port"
}
