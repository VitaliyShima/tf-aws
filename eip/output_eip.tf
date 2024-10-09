output "ec2_ip" {
  value = aws_eip.eip_serv_aws.public_ip
}

output "eip_id" {
  value = aws_eip.eip_serv_aws.id
}