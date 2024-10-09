output "ENV_ec2" {
  value = var.env_project
}

output "ec2_id" {
  value = aws_instance.serv_aws.id
}

output "ec2_ip" {
  value = aws_instance.serv_aws.public_ip
}