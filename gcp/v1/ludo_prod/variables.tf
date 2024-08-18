variable "project" {
  description = "name of the project"
  type        = string
  default     = "ludo"
}

variable "env" {
  description = "environment of the project"
  type        = string
  default     = "prod"
}

variable "owner" {
  description = "owner of the porject"
  type        = string
  default     = "ludo"
}

variable "region" {
  description = "region of the project"
  type        = string
  default     = "asia-northeast-3"
}
