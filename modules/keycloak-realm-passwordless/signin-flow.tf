resource "keycloak_authentication_flow" "sign_in_passwordless" {
  realm_id    = keycloak_realm.realm.id
  alias       = "passwordless sign in"
  description = "Passwordless sign in flow"
  provider_id = "basic-flow"
}


resource "keycloak_authentication_subflow" "sign_in_step" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_flow.sign_in_passwordless.alias

  alias       = "passwordless sign in subflow"
  provider_id = "basic-flow"
  requirement = "REQUIRED"
}


resource "keycloak_authentication_execution" "passwordless_webauthn_execution" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_subflow.sign_in_step.alias

  authenticator = "webauthn-authenticator-passwordless"
  requirement   = "REQUIRED"
  priority      = 0
}


resource "keycloak_authentication_bindings" "browser_flow_realm_bindings" {
  realm_id     = keycloak_realm.realm.id
  browser_flow = keycloak_authentication_flow.sign_in_passwordless.alias
}
