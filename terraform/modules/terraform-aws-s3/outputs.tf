output "bucket_id" {
  value       = aws_s3_bucket.bucket[0].id
  description = "Bucket name"
}

output "bucket_arn" {
  value       = aws_s3_bucket.bucket[0].arn
  description = "Bucket ARN"
}

output "bucket_domain" {
  value       = aws_s3_bucket.bucket[0].bucket_domain_name
  description = "Bucket domain name."
}