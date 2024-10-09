output "ssh_public_key" {
  value = tls_private_key.privat_key.public_key_openssh
}
output "ssh_private_key" {
  value = tls_private_key.privat_key.private_key_pem
}