output "data_caller_identity_id" {
    value = data.aws_caller_identity.current.account_id
}

output data_aws_ami_amazon_id{
    value = data.aws_ami.amazon-linux-2.id
}

output data_aws_ami_ubuntu_id{
    value = data.aws_ami.ubuntu.id
}