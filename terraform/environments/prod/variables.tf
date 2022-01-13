variable "app_image_tag" {
  description = "App docker image tag. Usually used as parameter from terraform cli. It is recommended to update the default value each deployment time"
  default     = "1af102e2db8b6b5e637550afc36f393693a96f65"
  type        = string
}
