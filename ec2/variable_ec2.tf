variable project_name {
  type = string
  default = ""
  }
variable env_project {
  type = string
  default = ""
  }
variable region {
  type = string
  default = ""
  }
variable type_os {
  type = string
  default = "ubuntu"
  }
variable ami_id_ec2 {
  type = string
  default = ""
  } 
variable instance_type {
  type = string
  default = "t3.micro"
  }
variable volume_size_ec2 {
  type = number
  default = 15
  }
variable iam_instance_profile {
  type = string
  default = ""
  }
variable user_data {
  type = string
  default = ""
  }
variable private_key_for_gitlab {
  type = string
  default = ""
  }
variable gitlab_project_path {
  type = string
  default = ""
  }
variable deploy_project {
  type = string
  default = ""
  }
variable name_ec2_instance {
  type = string
  default = ""
  }
# variable security_groups {
  # type = string
  # default = ""
  # }
variable subnet_id {
  type = string
  default = ""
  }
variable vpc_security_group_ids {
  type = list(string)
  default = []
  }