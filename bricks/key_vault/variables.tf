variable "name" {
  type        = string
  description = "Key Vault name (e.g. birdie69-kv)"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "tenant_id" {
  type        = string
  description = "Azure AD tenant ID"
}

variable "object_ids" {
  type        = map(string)
  default     = {}
  description = "Map of principal name to object_id for access policies"
}

variable "key_permissions" {
  type        = list(string)
  default     = ["Get", "List"]
  description = "Key permissions for access policies"
}

variable "secret_permissions" {
  type        = list(string)
  default     = ["Get", "List"]
  description = "Secret permissions for access policies"
}

variable "soft_delete_retention_days" {
  type        = number
  default     = 7
  description = "Soft delete retention in days"
}
