resource "vault_auth_backend" "auth_k8s_backend" {
  type = "kubernetes"
  path = var.vault_path
}

resource "vault_kubernetes_auth_backend_role" "auth_kubernetes_backend_role" {
  backend                          = vault_auth_backend.auth_k8s_backend.path
  role_name                        = var.vault_path
  bound_service_account_names      = [var.service_account_name]
  bound_service_account_namespaces = [var.service_account_namespace]
  token_policies                   = [var.vault_path]
}
