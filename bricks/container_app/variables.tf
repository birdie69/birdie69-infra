variable "name" {
  type        = string
  description = "Container App name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "container_app_environment_id" {
  type        = string
  description = "ID of the Container App Environment"
}

variable "image" {
  type        = string
  description = "Container image (e.g. myacr.azurecr.io/app:tag)"
}

variable "cpu" {
  type        = number
  default     = 0.5
  description = "CPU cores"
}

variable "memory" {
  type        = string
  default     = "1Gi"
  description = "Memory (e.g. 1Gi)"
}

variable "env_vars" {
  type        = map(string)
  default     = {}
  description = "Non-sensitive environment variables"
}

variable "secret_refs" {
  type        = map(string)
  default     = {}
  description = "Map of env name to Key Vault secret identifier (used in secret block + env value from secret)"
}

variable "ingress_enabled" {
  type        = bool
  default     = true
  description = "Enable external ingress"
}

variable "min_replicas" {
  type        = number
  default     = 0
  description = "Minimum number of replicas"
}

variable "max_replicas" {
  type        = number
  default     = 10
  description = "Maximum number of replicas"
}
