resource "aws_eip" "nat" {
  for_each = toset(local.azs)
  // 
  domain = "vpc"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "eip-nat-${each.value}"
  }
}

output "eip_nat" {
  value = aws_eip.nat[*]
}
