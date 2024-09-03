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
