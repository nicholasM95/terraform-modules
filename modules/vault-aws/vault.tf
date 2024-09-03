resource "vault_mount" "vault_mount" {
  path        = var.vault_path
  type        = "kv-v2"
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "secret" {
  mount     = vault_mount.vault_mount.path
  name      = "secret"
  data_json = var.data_json
}

resource "vault_policy" "policy" {
  name = var.vault_path

  policy = <<EOT
path "${var.vault_path}/*" {
  capabilities = [ "read", "list" ]
}
EOT
}

resource "vault_auth_backend" "vault_app_role" {
  type = "aws"
  path = var.vault_path
}

resource "vault_aws_auth_backend_sts_role" "role" {
  backend    = vault_auth_backend.vault_app_role.path
  account_id = var.aws_account
  sts_role   = var.role_id
}

resource "vault_aws_auth_backend_role" "my-app-role" {
  backend            = vault_auth_backend.vault_app_role.path
  role               = var.vault_path
  auth_type          = "sts"
  bound_iam_role_arn = var.role_id
  policies           = [var.vault_path]
  ttl                = "1h"
  max_ttl            = "24h"
}
