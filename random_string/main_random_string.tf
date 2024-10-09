// Generate Password
resource "random_string" "rds_password" {
  length           = 12
  special          = true
  override_special = "!$&"
}
