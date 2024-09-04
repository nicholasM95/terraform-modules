variable "role_id" {
  description = "Vault role id"
  type        = string
}

variable "aws_account" {
  description = "AWS account"
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
