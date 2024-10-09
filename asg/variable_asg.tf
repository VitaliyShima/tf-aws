variable "project_name" {
  type = string
}
variable "env_project" {
  type = string
}
variable "alb_target_group_arn" {
  type = string
}
variable "image_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "region" {
  type = string
}
variable "security_groups" {
  type = string
}
variable "name_asg" {
  type = string
  default = "back"
}
variable "health_check_grace_period" {
  type = number
  default = 300
}
variable "target_value" {
  type = number
  default = 50.0
}
