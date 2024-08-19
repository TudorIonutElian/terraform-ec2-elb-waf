variable "architecture" {
  description = "The architecture of the AMI"
  type        = string
  default     = "x86_64"
}

variable "startsWith" {
  description = "The starting string of the AMI"
  type        = string
  default     = "al2023-ami"
}

variable "endsWith" {
  description = "The ending string of the AMI"
  type        = string
  default     = "x86_64"
}

variable "health_check" {
   type = map(string)
   default = {
      "timeout"  = "10"
      "interval" = "20"
      "path"     = "/"
      "port"     = "80"
      "unhealthy_threshold" = "2"
      "healthy_threshold" = "3"
    }
}