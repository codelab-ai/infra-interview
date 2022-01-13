variable "user_name" {
  description = "Username to be created"
  type        = string
}

variable "iam_policy_arn_list" {
  description = "List of IAM policy ARNs"
  type        = list(any)
}

variable "create_key" {
  description = "Enable/Disable create user access key"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Bucket tags"
  type        = map(string)
  default     = {}
}