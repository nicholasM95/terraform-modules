resource "keycloak_realm" "realm" {
  realm                = var.realm_name
  enabled              = true
  display_name         = var.realm_display_name
  registration_allowed = false

  client_authentication_flow    = "registration"
  default_default_client_scopes = ["dcr"]
}