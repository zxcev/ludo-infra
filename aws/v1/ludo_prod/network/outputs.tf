# REGION
output "region" {
  description = "A Region the vpc belongs to"
  value       = var.region
}

output "azs" {
  description = "list of azs the vpc belongs to"
  value       = var.azs
}

# VPC
output "vpc_id" {
  description = "The id of the vpc"
  value       = aws_
}

output "vpc_name" {
  description = "The name of the vpc"
  value       = 
}

output "cidr_block" {
  description = "CIDR block of the VPC"
  value = aws_vpc.main.cidr_block
}

# SUBNETS
output "public_subnet_ids" {
  description = "ids of public subnets in the VPC"
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "ids of private subnets in the VPC"
  value = aws_subnet.private[*].id
}

output "isloated_private_subnet_ids" {
  description = "ids of isolated private subnets in the VPC"
  value = aws_subnet.isolated_private[*].id
}



