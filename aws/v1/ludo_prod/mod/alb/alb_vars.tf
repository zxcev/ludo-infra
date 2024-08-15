variable "region" {
  type        = string
  description = "AWS Region"
}

# variable "az" {
#   type        = string
#   description = "AWS availability zone"
# }

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "Public subnets CIDR blocks for application load balancer"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnets ids for application load balancer"
}

variable "alb_ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR Blocks for Application Load Balancer"
  default     = ["0.0.0.0/0"]
}

variable "vpc_id" {
  type        = string
  description = "AWS vpc id"
}

variable "app_name" {
  type        = string
  description = "Name of the Application"
}

variable "app_port" {
  type        = number
  description = "Port of the Application"
}

variable "health_check_port" {
  type        = number
  description = "Port for Health Check Endpoint"
}
