resource "mysql_database" "database" {
  name = var.database_name
}

resource "mysql_user" "user" {
  user               = var.database_user
  host               = "%"
  plaintext_password = var.database_password
}

resource "mysql_grant" "grant" {
  user       = mysql_user.user.user
  host       = mysql_user.user.host
  database   = mysql_database.database.name
  privileges = ["SELECT", "UPDATE", "DELETE", "INSERT", "CREATE", "DROP", "INDEX", "ALTER"]
}
