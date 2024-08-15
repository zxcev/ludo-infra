variable "vpc_name" {
  type        = string
  description = "name of the main vpc"
  default     = "vpc"
}

variable "vpc_cidr_block" {
  type        = string
  description = "default vpc CIDR value"
  default     = "10.0.0.0/16"
}

