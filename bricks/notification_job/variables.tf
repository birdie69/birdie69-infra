variable "name" {
  type        = string
  description = "Container App Job name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "container_apps_environment_id" {
  type        = string
  description = "ID of the Container Apps Environment"
}

variable "image" {
  type        = string
  default     = "mcr.microsoft.com/dotnet/runtime:8.0"
  description = "Container image for the notification job"
}

variable "env_vars" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "Environment variables for the job container"
}
