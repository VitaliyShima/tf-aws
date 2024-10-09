variable "vpc_id" {
  type = string
  default = "no_value"
}

variable "protocol" {
  type = string
  default = "HTTPS"
}

variable "name_lb_target_group" {
  type = string
  default = "lb_target_group"
}

variable "port" {
  type = number
  default = 443
}

# variable "path" {
#   type = string
#   default = "/healthcheck"
# }