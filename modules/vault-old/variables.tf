variable "role_id" {
  description = "Vault role id"
  type        = string
}

variable "secret_id" {
  description = "Vault secret id"
  type        = string
}

variable "vault_path" {
  description = "Vault path"
  type        = string
}

variable "data_json" {
  description = "Secrets as data json"
  type        = string
}
