resource "helm_release" "helm_release" {
  name             = var.application_name
  chart            = var.helm_path
  namespace        = var.namespace_name
  create_namespace = "true"

  values = [
    file("${var.helm_path}/values.yaml")
  ]

  set {
    name  = "image.tag"
    value = var.image_tag
  }

  set {
    name  = "docker.config"
    value = var.docker_config
  }

  set {
    name  = "vault.uri"
    value = var.vault_uri
  }

  set {
    name  = "vault.role.id"
    value = var.vault_role_id
  }

  set {
    name  = "vault.secret.id"
    value = var.vault_secret_id
  }

  set {
    name  = "aws.trustProfile"
    value = var.aws_trust_profile
  }

  set {
    name  = "aws.trustAnchor"
    value = var.aws_trust_anchor
  }

  set {
    name  = "aws.role"
    value = var.aws_role
  }
}
