variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-1"
}

variable "owners" {
  description = "Owners of the project"
  type        = string
  default     = "ludo"
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "stag"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "ludo"
}
