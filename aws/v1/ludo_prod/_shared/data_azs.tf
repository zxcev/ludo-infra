data "aws_availability_zones" "available" {
  state = "available"
}


variable "selected_azs" {
  description = "list of selected azs in the current region"
  type        = list(string)

  default = [
    for az_name in aws_availability_zones.available.names :
    az_name if endswith(az_name, "a") || endswith(az_name, "c")
  ]
}

variable "public_subnet_cidr_blocks" {

}
