resource "vault_auth_backend" "auth_aws_backend" {
  type = "aws"
  path = var.vault_path
}

resource "vault_aws_auth_backend_role" "auth_aws_backend_role" {
  backend                  = vault_auth_backend.auth_aws_backend.path
  role                     = var.vault_path
  bound_iam_principal_arns = [var.role_id]
  token_policies           = [var.vault_path]
}
