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

  authentication_flow_binding_overrides {
    browser_id = var.passwordless_browser_id
  }
}
