resource "keycloak_authentication_flow" "registration_passwordless" {
  realm_id    = keycloak_realm.realm.id
  alias       = "passwordless registration"
  description = "Passwordless registration flow"
  provider_id = "basic-flow"
}


resource "keycloak_authentication_subflow" "passwordless_step" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_flow.registration_passwordless.alias

  alias         = "passwordless registration form"
  provider_id   = "form-flow"
  authenticator = "registration-page-form"
  requirement   = "REQUIRED"
}


resource "keycloak_authentication_execution" "user_creation" {
  realm_id          = keycloak_realm.realm.id
  parent_flow_alias = keycloak_authentication_subflow.passwordless_step.alias

  authenticator = "registration-user-creation"
  requirement   = "REQUIRED"
  priority      = 0
}

resource "keycloak_authentication_bindings" "registration_flow_realm_bindings" {
  realm_id          = keycloak_realm.realm.id
  registration_flow = keycloak_authentication_flow.registration_passwordless.alias
}

resource "keycloak_required_action" "webauthn_register_passwordless" {
  realm_id       = keycloak_realm.realm.id
  alias          = "webauthn-register-passwordless"
  name           = "Webauthn Register Passwordless"
  enabled        = true
  default_action = true
}
