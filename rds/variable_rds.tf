variable type_engine {
  type = string
  default = ""
}
variable project_name {
  type = string
  default = ""
  }
variable name_instans_rds {
  type = string
  default = ""
  }
variable env_project {
  type = string
  default = ""
  }
variable class_db_instance {
  type = string
  default = ""
  }
variable engine_version {
  type = string
  default = ""
  }
variable vpc_security_group_ids {}
variable db_username {
  type = string
  default = ""
  }
variable db_userpass {
  type = string
  default = ""
  }
variable region {
  type = string
  default = ""
  }
variable snapshot_identifier {
  type = string
  default = ""
}
variable name_db_rds {
  type = string
  default = ""
  }
variable db_subnet_group_name{
  type = string
  default = ""
  }
variable "allocated_storage" {
  type = number
  default = 30
}
variable "storage_type" {
  type = string
  default = "gp3"
}