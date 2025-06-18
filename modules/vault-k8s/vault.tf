data "vault_auth_backend" "kubernetes" {
  path = "kubernetes"
}

resource "vault_kubernetes_auth_backend_role" "auth_kubernetes_backend_role" {
  backend                          = data.vault_auth_backend.kubernetes.path
  role_name                        = var.vault_path
  bound_service_account_names      = [var.service_account_name]
  bound_service_account_namespaces = [var.service_account_namespace]
  token_policies                   = [var.vault_path]
}
