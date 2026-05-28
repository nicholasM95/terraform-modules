resource "keycloak_oidc_identity_provider" "github" {
  count = var.enable_github ? 1 : 0

  realm        = keycloak_realm.realm.id
  alias        = "github"
  display_name = "GitHub"
  provider_id  = "github"

  client_id     = var.github_client_id
  client_secret = var.github_client_secret

  authorization_url = "https://github.com/login/oauth/authorize"
  token_url         = "https://github.com/login/oauth/access_token"
  user_info_url     = "https://api.github.com/user"

  default_scopes = "user:email read:user repo"

  store_token                   = true
  add_read_token_role_on_create = true

  sync_mode   = "IMPORT"
  trust_email = true
}