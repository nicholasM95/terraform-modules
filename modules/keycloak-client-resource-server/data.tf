data "keycloak_openid_client" "realm_management" {
  count     = var.enable_manage_users || var.enable_manage_clients ? 1 : 0
  realm_id  = var.realm_id
  client_id = "realm-management"
}