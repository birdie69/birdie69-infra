variable "name" {
  type        = string
  description = "Storage account name (3-24 chars, lowercase alphanumeric)"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "Storage account tier"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "Replication type (LRS, GRS, etc.)"
}

variable "containers" {
  type        = list(string)
  default     = ["uploads"]
  description = "List of blob container names to create"
}
