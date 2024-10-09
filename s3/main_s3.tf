locals {
    bucket_name = lower("${var.project_name}-bucket-${var.env_project}-${var.bucket_name}")
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket        = local.bucket_name
    force_destroy = true
    tags = {
      Name = local.bucket_name
    }
}

resource "aws_s3_bucket_cors_configuration" "s3_bucket_cors_role" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  cors_rule {
    allowed_headers = var.cors_rule_s3_allowed_headers
    allowed_methods = var.cors_rule_s3_allowed_methods
    allowed_origins = var.cors_rule_s3_allowed_origins
    expose_headers = var.cors_rule_s3_expose_headers
    max_age_seconds = var.cors_rule_s3_max_age_seconds
  }
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.s3_bucket.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownership]
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.acl_s3
}

resource "aws_s3_bucket_public_access_block" "s3_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id
  block_public_acls       = var.bucket_access_block_public_acls
  block_public_policy = var.bucket_access_block_public_policy
  ignore_public_acls      = var.bucket_access_ignore_public_acls
  restrict_public_buckets = var.bucket_access_restrict_public_buckets
}
