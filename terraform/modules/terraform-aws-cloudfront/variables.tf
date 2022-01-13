variable "domain" {
  description = "FQDN of origin"
  type        = string
}

variable "aliases" {
  description = "List of domain to be aliased"
  type        = list(string)
}

variable "origin_id" {
  description = "Unique origin ID inside Cloudfront distribution"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of Certificate in ACM"
  type        = string
}