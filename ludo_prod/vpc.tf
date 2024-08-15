resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = local.vpc_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = local.igw_tags
}

resource "aws_route" "igw" {
  gateway_id             = aws_internet_gateway.main.id
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
}
