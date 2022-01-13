variable "enabled" {
  description = "Enable/Disable bucket creation."
  type        = bool
  default     = false
}

variable "bucket_name" {
  description = "S3 bucket name."
  type        = string
}


variable "acl" {
  description = "Access List of Bucket: private or public"
  type        = string
  default     = "private"
}

variable "block_public_access" {
  description = "Set bucket public access to be blocked"
  type        = bool
  default     = true
}


variable "enable_bucket_versioning" {
  description = "Enable bucket versioning"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Bucket tags"
  type        = map(string)
  default     = {}
}