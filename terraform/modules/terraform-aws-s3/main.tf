resource "aws_s3_bucket" "bucket" {
  count  = var.enabled ? 1 : 0
  bucket = var.bucket_name
  acl    = var.acl

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  dynamic "versioning" {
    for_each = var.enable_bucket_versioning ? [1] : []
    content {
      enabled = var.enable_bucket_versioning
    }
  }

  tags = merge({ "provisioned_by" : "terraform" }, var.tags)
}

resource "aws_s3_bucket_public_access_block" "access" {
  count  = var.enabled && var.block_public_access ? 1 : 0
  bucket = aws_s3_bucket.bucket[0].id

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

# resource "aws_s3_bucket_policy" "policy" {
#   count  = var.enabled && var.enable_bucket_policy ? 1 : 0
#   bucket = aws_s3_bucket.bucket[0].id

#   # Terraform's "jsonencode" function converts a
#   # Terraform expression's result to valid JSON syntax.
#   policy = jsonencode(var.policy)

#   depends_on = [aws_s3_bucket_public_access_block.access]
# }
