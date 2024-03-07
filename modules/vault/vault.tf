resource "vault_mount" "vault_mount" {
  path        = var.vault_path
  type        = "kv-v2"
  description = "KV Version 2 secret engine mount"
}

resource "vault_kv_secret_v2" "secret" {
  mount = vault_mount.vault_mount.path
  name  = "secret"
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
  type = "approle"
  path = var.vault_path
}

resource "vault_approle_auth_backend_role" "vault_approle_auth_backend_role" {
  backend        = vault_auth_backend.vault_app_role.path
  role_name      = "${var.vault_path}-role"
  role_id        = var.role_id
  bind_secret_id = true
  token_policies = [var.vault_path]
}

resource "vault_approle_auth_backend_role_secret_id" "vault_secret_id" {
  backend   = vault_auth_backend.vault_app_role.path
  role_name = vault_approle_auth_backend_role.vault_approle_auth_backend_role.role_name
  secret_id = var.secret_id
}
