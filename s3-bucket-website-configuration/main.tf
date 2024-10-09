resource "aws_s3_bucket_website_configuration" "s3_front" {
  bucket = var.name_s3_backet

  index_document {
    suffix = var.index_document_suffix
  }

  error_document {
    key = var.error_document_key
  }

  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
}