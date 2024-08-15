resource "aws_subnet" "public" {
  for_each = {
    for i, az in local.azs :
    az => local.public_subnet_cidr_blocks[i]
  }
  #   count = length(local.azs)
  #   for_each = { for i, az in local.azs : i => az }

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = each.value
  // public ip will be automatically assigned after ec2 is spinned up in the public subnet
  // ec2 생성 시 자동으로 ec2에 public ip 할당 여부
  map_public_ip_on_launch = false

  tags = local.public_subnet_tags
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = local.public_rt_tags
}

resource "aws_route_table_association" "public" {
  for_each = toset(local.azs)

  subnet_id      = aws_subnet.public[each.value].id
  route_table_id = aws_route_table.public.id
}

resource "aws_subnet" "private" {
  for_each = {
    for i, az in local.azs :
    az => local.private_subnet_cidr_blocks[i]
  }

  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = false

  tags = local.private_subnet_tags

}

resource "aws_route_table" "private" {
  for_each = toset(local.azs)

  vpc_id = aws_vpc.main.id

  tags = local.private_rt_tags_map[each.value]
}

resource "aws_route_table_association" "private" {
  for_each = toset(local.azs)

  subnet_id      = aws_subnet.private[each.value].id
  route_table_id = aws_route_table.private[each.value].id

}


resource "aws_subnet" "isolated_private" {
  for_each = {
    for i, az in local.azs :
    az => local.isolated_private_subnet_cidr_blocks[i]
  }

  vpc_id                  = aws_vpc.main.id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = false

  tags = local.isolated_private_subnet_tags
}

resource "aws_route_table" "isolated_private" {
  for_each = toset(local.azs)

  vpc_id = aws_vpc.main.id

  tags = local.isolated_private_rt_tags_map[each.value]
}

resource "aws_route_table_association" "isolated_private" {
  for_each = toset(local.azs)

  subnet_id      = aws_subnet.isolated_private[each.value].id
  route_table_id = aws_route_table.isolated_private[each.value].id
}

resource "aws_nat_gateway" "main" {
  for_each = toset(local.azs)

  allocation_id = aws_eip.nat[each.value].id
  subnet_id     = aws_subnet.private[each.value].id

  tags = local.nat_tags
}

resource "aws_route" "nat" {
  for_each = toset(local.azs)

  nat_gateway_id         = aws_nat_gateway.main[each.value].id
  route_table_id         = aws_route_table.private[each.value].id
  destination_cidr_block = "0.0.0.0/0"

}
