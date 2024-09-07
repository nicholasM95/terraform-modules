resource "vault_auth_backend" "auth_aws_backend" {
  type = "aws"
  path = var.vault_path
}

resource "vault_aws_auth_backend_client" "auth_aws_backend_client" {
  backend                    = vault_auth_backend.auth_aws_backend.path
  access_key                 = var.access_key
  secret_key                 = var.secret_key
  use_sts_region_from_client = true
}


resource "vault_aws_auth_backend_role" "auth_aws_backend_role" {
  depends_on               = [vault_aws_auth_backend_client.auth_aws_backend_client]
  backend                  = vault_auth_backend.auth_aws_backend.path
  role                     = var.vault_path
  bound_iam_principal_arns = [var.role_id]
  token_policies           = [var.vault_path]
}
