variable "name" {
  description = "Name of the Linux web app. Must be globally unique."
  type        = string
}

variable "service_plan_name" {
  description = "Name of the service plan hosting the web app."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "Azure region in which to create the resources."
  type        = string
}

variable "sku_name" {
  description = "SKU of the service plan, e.g. B1, P1v3 or S1."
  type        = string
  default     = "B1"
}

variable "https_only" {
  description = "Whether the web app redirects all HTTP traffic to HTTPS."
  type        = bool
  default     = true
}

variable "always_on" {
  description = "Whether the web app is always kept loaded. Not supported on some free/shared SKUs."
  type        = bool
  default     = true
}

variable "docker_image_name" {
  description = "Docker image and tag to run, e.g. nginx:latest. Null runs the default runtime."
  type        = string
  default     = null
}

variable "docker_registry_url" {
  description = "URL of the container registry hosting the image, e.g. https://index.docker.io."
  type        = string
  default     = null
}

variable "app_settings" {
  description = "Map of application settings exposed to the web app as environment variables."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Map of tags applied to the resources."
  type        = map(string)
  default     = {}
}
