variable "project_name" {
  type    = string
  default = "test_name"
}
variable "env_project" {
  type    = string
  default = "test_env"
}
variable "bucket_name" {
  type    = string
  default = "test_bucket_name"
}
variable "cors_rule_s3_allowed_headers" {
  type    = list(string)
  default = ["Authorization"]
}
variable "cors_rule_s3_allowed_methods" {
  type    = list(string)
  default = ["GET", "POST"]
}
variable "cors_rule_s3_allowed_origins" {
  type    = list(string)
  default = ["*"]
}
variable "cors_rule_s3_max_age_seconds" {
  type    = number
  default = 3000    
} 
variable "cors_rule_s3_expose_headers" {
  type    = list(string)
  default = []
}
variable "acl_s3" {
  type    = string
  default = "private"    
}
variable "bucket_access_block_public_acls" {
  type    = string
  default = "true"
}
variable "bucket_access_block_public_policy" {
  type    = string
  default = "true"    
}
variable "bucket_access_ignore_public_acls" {
  type    = string
  default = "true"    
}
variable "bucket_access_restrict_public_buckets" {
  type    = string
  default = "true"    
}
variable "object_ownership" {
  type    = string
  default = "BucketOwnerPreferred"    
}
