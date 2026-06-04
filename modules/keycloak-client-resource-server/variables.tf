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

variable "oauth2_device_flow_enabled" {
  type        = bool
  description = "enable device flow"
  default     = false
}


variable "audiences" {
  description = "List of client audiences to include in the access token"
  type        = list(string)
  default     = []
}

variable "enable_broker_read_token" {
  type    = bool
  default = false
}

variable "enable_manage_users" {
  type    = bool
  default = false
}

variable "enable_manage_clients" {
  type    = bool
  default = false
}