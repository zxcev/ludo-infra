resource "aws_vpc" "main" {
  cidr_block = ["10.0.0.0/16"]
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id

  map_public_ip_on_launch = false
  cidr_block              = []
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "isolated_private" {
  vpc_id = aws_vpc.main.id
}
