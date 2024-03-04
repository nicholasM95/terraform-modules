variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = ""
}

variable "application_name" {
  description = "Kubernetes application name"
  type        = string
}

variable "namespace_name" {
  description = "Kubernetes application namespace"
  type        = string
}

variable "helm_path" {
  description = "Helm path"
  type        = string
}

variable "docker_config" {
  description = "Docker config to pull an image"
  type        = string
  default     = ""
}

variable "vault_uri" {
  description = "Vault uri"
  type        = string
  default     = ""
}

variable "vault_role_id" {
  description = "Vault role id"
  type        = string
  default     = ""
}

variable "vault_secret_id" {
  description = "Vault secret id"
  type        = string
  default     = ""
}

variable "aws_trust_profile" {
  description = "AWS trust profile"
  type        = string
  default     = ""
}

variable "aws_trust_anchor" {
  description = "AWS trust anchor"
  type        = string
  default     = ""
}

variable "aws_role" {
  description = "AWS role"
  type        = string
  default     = ""
}
