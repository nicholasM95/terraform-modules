variable "vault_path" {
  description = "Vault path"
  type        = string
}

variable "kubernetes_ca_cert" {
  description = "Kubernetes ca cert"
  type        = string
}

variable "kubernetes_internal_host" {
  description = "Kubernetes internal host"
  type        = string
}

variable "service_account_name" {
  description = "Service account name"
  type        = string
}

variable "service_account_namespace" {
  description = "Service account namespace"
  type        = string
}
