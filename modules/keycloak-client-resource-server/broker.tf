data "keycloak_openid_client" "broker" {
  count     = var.enable_broker_read_token ? 1 : 0
  realm_id  = var.realm_id
  client_id = "broker"
}

data "keycloak_role" "broker_read_token" {
  count     = var.enable_broker_read_token ? 1 : 0
  realm_id  = var.realm_id
  client_id = data.keycloak_openid_client.broker[0].id
  name      = "read-token"
}

resource "keycloak_openid_client_service_account_role" "backend_broker_role" {
  count                   = var.enable_broker_read_token ? 1 : 0
  realm_id                = var.realm_id
  service_account_user_id = keycloak_openid_client.openid_client.service_account_user_id
  client_id               = data.keycloak_openid_client.broker[0].id
  role                    = data.keycloak_role.broker_read_token[0].name
}