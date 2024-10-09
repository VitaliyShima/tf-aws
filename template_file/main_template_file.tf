locals {
  user_os = var.type_os == "amazon" ? "ec2-user" : "ubuntu"
  packet_manager = var.type_os == "amazon" ? "yum" : "apt"
  install_package = var.type_os == "amazon" ? "ruby wget git -y && amazon-linux-extras install nginx1 -y" : "ruby-full wget git nginx -y"  
}

data "template_file" "conf" {
  template = "${file(var.path_file_sh)}"
  vars = {
    region = var.region
    user_os = local.user_os
    install_package = local.install_package
    packet_manager = local.packet_manager
    private_key_for_gitlab = var.private_key_for_gitlab
    gitlab_project_path = var.gitlab_project_path
    env_project = var.env_project
    deploy_project = var.deploy_project
  }
}
