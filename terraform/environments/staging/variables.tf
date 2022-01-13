variable "app_image_tag" {
  description = "App docker image tag. Usually used as parameter from terraform cli. It is recommended to update the default value each deployment time"
  default     = "a148b5aa3cf925cf8dad1bfe0256773034d2912a"
  type        = string
}