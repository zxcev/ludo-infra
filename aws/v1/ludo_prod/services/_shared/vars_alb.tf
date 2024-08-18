variable "alb_protocol" {
  type    = string
  default = "HTTP"
}

variable "alb_health_check_port" {
  type    = string
  default = "8080"
}
