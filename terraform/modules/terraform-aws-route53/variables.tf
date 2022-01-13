variable "record" {
  type        = string
  description = "Record to be created"
}

variable "cloudfront_domain_name" {
  type        = string
  description = "Domain name of cloudfront distribution"
}

variable "cloudfront_hosted_zone_id" {
  type        = string
  description = "Hosted zone ID of Cloudfront"
}

variable "zone_id" {
  type        = string
  description = "Zone ID of Route53"
}