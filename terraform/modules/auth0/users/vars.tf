variable "user_connection_name" {
  description = "User connection name"
  type        = string
  default     = "Username-Password-Authentication"
}

variable "user_email" {
  description = "User email"
  type        = string
}

variable "user_password" {
  description = "User password"
  type        = string
}

variable "roles" {
  description = "Roles which this user belongs to "
  type        = list(string)
}
