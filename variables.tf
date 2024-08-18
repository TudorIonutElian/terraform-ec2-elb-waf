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