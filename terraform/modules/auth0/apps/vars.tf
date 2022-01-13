variable "app_name" {
  description = "App name"
  type        = string
}

variable "app_description" {
  description = "App description"
  type        = string
  default     = ""
}

variable "app_type" {
  description = "App type"
  type        = string
  default     = "non_interactive"
}


variable "oidc_conformant" {
  description = "Indicates whether or not this client will conform to strict OIDC specifications."
  type        = bool
  default     = true
}

variable "callbacks" {
  description = "URLs that Auth0 may call back to after a user authenticates for the client"
  type        = list(string)
  default     = []
}

variable "allowed_origins" {
  description = "URLs that represent valid origins for cross-origin resource sharing"
  type        = list(string)
  default     = []
}

variable "allowed_logout_urls" {
  description = "URLs that Auth0 may redirect to after logout."
  type        = list(string)
  default     = []
}

variable "grant_types" {
  description = "Types of grants that this client is authorized to use."
  type        = list(string)
  default     = ["authorization_code", "implicit", "password", "refresh_token", "client_credentials"]

}

variable "allowed_web_origins" {
  description = "URLs that represent valid web origins for use with web message response mode."
  type        = list(string)
  default     = []
}

variable "jwt_lifetime_in_seconds" {
  description = "Number of seconds during which the JWT will be valid."
  type        = number
  default     = 2592000
}

variable "jwt_secret_encoded" {
  description = "Indicates whether or not the client secret is base64 encoded."
  type        = bool
  default     = true
}

variable "jwt_alg" {
  description = "Algorithm used to sign JWTs"
  type        = string
  default     = "RS256"
}

variable "rotation_type" {
  description = "Type of rotation used for refresh token"
  type        = string
  default     = "rotating"

}

variable "expiration_type" {
  description = "Whether a refresh token will expire based on an absolute lifetime, after which the token can no longer be used"
  type        = string
  default     = "expiring"
}

variable "token_lifetime" {
  description = "The absolute lifetime of a refresh token in seconds."
  type        = number
  default     = 2592000
}

variable "infinite_token_lifetime" {
  description = "Whether or not refresh tokens should remain valid indefinitely"
  type        = bool
  default     = false
}

variable "infinite_idle_token_lifetime" {
  description = "Whether or not inactive refresh tokens should be remain valid indefinitely.'"
  type        = bool
  default     = false
}

variable "idle_token_lifetime" {
  description = "The time in seconds after which inactive refresh tokens will expire."
  type        = number
  default     = 1296000
}
