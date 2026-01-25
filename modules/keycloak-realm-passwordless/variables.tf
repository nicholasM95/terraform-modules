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
