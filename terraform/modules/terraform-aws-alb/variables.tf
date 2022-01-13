
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "alb_allowed_ports" {
  type        = list(string)
  description = "List of allowed ports in ALB SG"
}

variable "alb_name" {
  type        = string
  description = "ALB Name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet ID which ALB belongs to"
}

variable "tg_name" {
  type        = string
  description = "Target group name"
}

variable "health_check_path" {
  type        = string
  description = "Path for ALB to healthcheck"
  default     = "/"
}

variable "port" {
  type        = string
  description = "Port of target group"
  default     = "80"
}


variable "healthy_threshold" {
  type        = string
  description = "Threshold to determine target group is healthy"
  default     = "3"
}


variable "interval" {
  type        = string
  description = "Interval time to health check"
  default     = "30"
}

variable "matcher" {
  type        = string
  description = "Matcher of target group"
  default     = "200"
}

variable "timeout" {
  type        = string
  description = "Duration to mark healthcheck timed out"
  default     = "3"
}

variable "unhealthy_threshold" {
  type        = string
  description = "Threshold to determine target group is unhealthy"
  default     = "2"
}

variable "tg_port" {
  type        = string
  description = "Target group port for ALB"
  default     = "80"
}

variable "protocol" {
  type        = string
  description = "Protocol listening on listener"
  default     = "HTTP"
}

variable "listener_port" {
  type        = string
  description = "Port listening on listener"
  default     = "80"
}