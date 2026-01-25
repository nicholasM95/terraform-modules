resource "keycloak_realm" "realm" {
  realm                          = var.realm_name
  enabled                        = true
  registration_allowed           = var.realm_registration_allowed
  login_with_email_allowed       = true
  duplicate_emails_allowed       = false
  registration_email_as_username = true
  display_name                   = var.realm_display_name
}

resource "keycloak_authentication_flow" "passwordless_browser" {
  realm_id    = keycloak_realm.realm.id
  alias       = "passwordless-browser"
  description = "Browser flow for passwordless authentication"
}

resource "keycloak_authentication_execution" "webauthn_passwordless" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_flow.passwordless_browser.alias
  authenticator     = "webauthn-authenticator-passwordless"
  requirement       = "REQUIRED"
}