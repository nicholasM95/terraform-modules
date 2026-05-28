data "keycloak_openid_client" "realm_management" {
  count     = var.enable_manage_users ? 1 : 0
  realm_id  = var.realm_id
  client_id = "realm-management"
}

data "keycloak_role" "manage_users" {
  count     = var.enable_manage_users ? 1 : 0
  realm_id  = var.realm_id
  client_id = data.keycloak_openid_client.realm_management[0].id
  name      = "manage-users"
}

resource "keycloak_openid_client_service_account_role" "backend_manage_users" {
  count                   = var.enable_manage_users ? 1 : 0
  realm_id                = var.realm_id
  service_account_user_id = keycloak_openid_client.openid_client.service_account_user_id
  client_id               = data.keycloak_openid_client.realm_management[0].id
  role                    = data.keycloak_role.manage_users[0].name
}