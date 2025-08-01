variable "realm_id" {
  type        = string
  description = "id of the keycloak realm"
}

variable "client_id" {
  type        = string
  description = "client id"
}

variable "client_name" {
  type        = string
  description = "client name"
}

variable "valid_redirect_uris" {
  description = "List of valid redirect URIs"
  type        = list(string)
}

variable "passwordless_browser_id" {
  description = "Passwordless browser id"
  type        = string
  default     = "b82dd6c9-3d48-4c1d-9d6f-9ea570a33863"
}
