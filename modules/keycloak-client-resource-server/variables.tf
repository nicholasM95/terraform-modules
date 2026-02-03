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

variable "service_accounts_enabled" {
  type        = bool
  description = "enable service account"
  default     = false
}

variable "standard_token_exchange_enabled" {
  type        = bool
  description = "enable token exchange"
  default     = false
}