resource "keycloak_openid_client" "openid_client" {
  realm_id  = var.realm_id
  client_id = var.client_id

  name    = var.client_name
  enabled = true

  access_type                     = "CONFIDENTIAL"
  service_accounts_enabled        = var.service_accounts_enabled
  standard_token_exchange_enabled = var.standard_token_exchange_enabled

}

resource "keycloak_openid_audience_protocol_mapper" "audience_mapper" {
  for_each = toset(var.audiences)

  realm_id  = var.realm_id
  client_id = keycloak_openid_client.openid_client.id
  name      = "audience-${each.value}"

  included_client_audience = each.value
  add_to_access_token      = true
  add_to_id_token          = false
}
