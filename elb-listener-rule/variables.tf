variable "lb_listener_arn" {
  type = string
  default = "example_arn"
}

variable "rule_priority" {
  type = number
  default = 10
}

variable "type_action" {
  type = string
  default = "forward"
}

variable "target_group_arn" {
  type = string
  default = "example_target_group_arn"
}

variable "path_pattern" {
  type = string
  default = "/socket.io"
}