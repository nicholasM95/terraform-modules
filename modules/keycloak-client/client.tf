resource "keycloak_openid_client" "openid_client" {
  realm_id  = var.realm_id
  client_id = var.client_id

  name    = var.client_name
  enabled = true

  access_type         = "PUBLIC"
  valid_redirect_uris = var.valid_redirect_uris
  web_origins         = var.valid_redirect_uris

  valid_post_logout_redirect_uris = var.valid_redirect_uris

  login_theme           = "keycloak"
  standard_flow_enabled = true
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