data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ec2_instance_type_offerings" "t2_micro" {
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
}


# variable "azs" {
#   type = list(string)

#   default = [
#     for az_name in data.aws_availability_zones.available.names :
#     az_name if endswith(az_name, "a") || endswith(az_name, "c")
#   ]
# }


# output "azs2" {
#   value = data.aws_ec2_instance_type_offering.t2_micro
# }

# locals {
#   azs = [
#     for az in data.aws_availability_zones.available.names :
#     az if data.aws_ec2_instance_type_offerings.t2_micro.location
#   ]
# }
# output "azs3" {
#   value = local.azs
# }
