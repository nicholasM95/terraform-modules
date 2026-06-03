variable "realm_name" {
  type        = string
  description = "name of the keycloak realm"
}

variable "realm_display_name" {
  type        = string
  description = "display name of the keycloak realm"
}

variable "realm_registration_allowed" {
  type        = bool
  description = "enable registration"
}

variable "enable_github" {
  type        = bool
  description = "enable GitHub identity provider"
  default     = false
}

variable "github_client_id" {
  type        = string
  description = "GitHub client id"
  default     = ""
}

variable "github_client_secret" {
  type        = string
  description = "GitHub client secret"
  default     = ""
}

variable "realm_admin_permissions_enabled" {
  type        = bool
  description = "Enables the use of fine grained permissions v2"
  default     = false
}
