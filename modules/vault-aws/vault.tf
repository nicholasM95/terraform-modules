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

resource "vault_auth_backend" "auth_aws_backend" {
  type = "aws"
  path = var.vault_path
}

resource "vault_aws_auth_backend_role" "auth_aws_backend_role" {
  backend             = vault_auth_backend.auth_aws_backend.path
  role                = var.vault_path
  bound_account_ids   = [var.aws_account]
  bound_iam_role_arns = [var.role_id]
  token_policies      = [vault_policy.policy.name]
}
