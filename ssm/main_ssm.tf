#-----------------------------
# Create parameter store 
#-----------------------------
resource "aws_ssm_parameter" "name_rds" {
  name  = var.name_ssm
  type  = var.record_type
  value = var.value
}
