variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-northeast-2"
}

variable "owners" {
  description = "Owners of the project"
  type        = string
  default     = "ludo"
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "prod"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "ludo"
}
