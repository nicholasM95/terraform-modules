resource "keycloak_openid_client" "openid_client" {
  realm_id  = var.realm_id
  client_id = var.client_id

  name    = var.client_name
  enabled = true

  access_type              = "CONFIDENTIAL"
  service_accounts_enabled = var.service_accounts_enabled

}
