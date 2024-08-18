variable "service_name" {
  type        = string
  default     = "ludo_app"
  description = "Name of the service"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public Subnet ids that the ALB belongs to"
}

variable "region" {
  type        = string
  description = "Region of the service"
}

variable "vpc_id" {
  type        = string
  description = "vpc id that the service belongs to"
}

variable "app_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "An instance type of the app"
}

variable "app_instance_ssh_key_name" {
  type        = string
  description = "default app SSH key name"
}

variable "app_subnet_id" {
  type        = string
  description = "subnet id that app belongs to"
}

variable "app_port" {
  type        = string
  description = "Port of the app"
}

variable "health_check_port" {
  type        = string
  description = "Port for the health check"
}

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "Path for the health check"
}
