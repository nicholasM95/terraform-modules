resource "keycloak_realm" "realm" {
  realm        = var.realm_name
  enabled      = true
  display_name = var.realm_name
}

resource "keycloak_required_action" "webauthn_register_passwordless" {
  realm_id = keycloak_realm.realm.id
  alias    = "webauthn-register-passwordless"
  name     = "Webauthn Register Passwordless"
  enabled  = true
}

resource "keycloak_authentication_flow" "passwordless_browser" {
  realm_id    = keycloak_realm.realm.id
  alias       = "passwordless-browser"
  description = "Browser flow for passwordless authentication"

  depends_on = [keycloak_required_action.webauthn_register_passwordless]
}

resource "keycloak_authentication_execution" "webauthn_passwordless" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_flow.passwordless_browser.alias
  authenticator     = "webauthn-passwordless-authenticator"
  requirement       = "REQUIRED"

  depends_on = [keycloak_required_action.webauthn_register_passwordless]
}