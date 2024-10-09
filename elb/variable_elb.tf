variable "project_name" {}
variable "env_project" {}
variable "region" {}
variable "security_groups" {}
variable certificate_ssl_arn {}
variable availability_zone_az1 {
  type = string
}
variable availability_zone_az2 {
  type = string
}
variable "name_elb" {
  type = string
  default = "back"
}