variable "application_name" {
  description = "Name of the application"
  type        = string
}

variable "image_identifier" {
  description = "Image container"
  type        = string
}

variable "web_acl" {
  description = "WEB ACL"
  type        = string
}

variable "host_name" {
  description = "Host name (example.com)"
  type        = string
}

variable "domain_name" {
  description = "Domain name (api.example.com)"
  type        = string
}

variable "vault_uri" {
  description = "Vault URI"
  type        = string
}

variable "aws_account" {
  description = "aws account id"
  type        = string
  default     = ""
}

variable "database_resource_id" {
  description = "database resource id"
  type        = string
  default     = ""
}

variable "database_user" {
  description = "database user"
  type        = string
  default     = ""
}

variable "policy_type" {
  description = "Specify which policy you want to use: 'empty', 'vault', 'rds', or 'vault_rds'."
  type        = string
  default     = "empty"
}
