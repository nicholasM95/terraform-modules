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

variable "audiences" {
  description = "List of client audiences to include in the access token"
  type        = list(string)
  default     = []
}
