resource "helm_release" "helm_release" {
  name             = var.application_name
  chart            = var.helm_path
  namespace        = var.namespace_name
  create_namespace = "true"

  values = [
    file("${var.helm_path}/values.yaml")
  ]

  set = [
    {
      name  = "image.tag"
      value = var.image_tag
    },
    {
      name  = "docker.config"
      value = var.docker_config
    },
    {
      name  = "vault.role.id"
      value = var.vault_role_id
    },
    {
      name  = "vault.secret.id"
      value = var.vault_secret_id
    },
    {
      name  = "aws.trustProfile"
      value = var.aws_trust_profile
    },
    {
      name  = "aws.trustAnchor"
      value = var.aws_trust_anchor
    },
    {
      name  = "aws.role"
      value = var.aws_role
    },
    {
      name  = "db.url"
      value = var.db_url
    },
    {
      name  = "db.username"
      value = var.db_username
    },
    {
      name  = "db.password"
      value = var.db_password
    },
    {
      name  = "db.database"
      value = var.db_database
    }
  ]
}
