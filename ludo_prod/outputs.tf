output "azs" {
  description = "availability zones that will be used in the application"
  value       = local.azs
}

# output "azs2" {
#   value = data.aws_ec2_instance_type_offering.t2_micro
# }
