#create IGW#

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = var.dev_igw
    Environment = "dev"
  }
}

###elastic IP address###

resource "aws_eip" "dev-eip-address" {
    domain     = "vpc"
}

#create NGW#

resource "aws_nat_gateway" "dev-nat-gateway" {
  allocation_id = aws_eip.dev-eip-address.id
  subnet_id     = aws_subnet.dev-nat-sub.id

  tags = {
    Name = var.dev_nat_gateway
  }

  depends_on = [aws_internet_gateway.dev-igw]
}

#public route table# - DEV

resource "aws_route_table" "dev-public-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }
  tags = {
    Name = "dev-public-rt-name"
  }
}
resource "aws_route_table_association" "dev-public-rt-association" {
  subnet_id      = aws_subnet.dev-nat-sub.id
  route_table_id = aws_route_table.dev-public-rt.id
}

#private route table#

resource "aws_route_table" "dev-private-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.dev-nat-gateway.id
  }

   tags = {
    Name = var.private-rt-name-1
  }
}

resource "aws_route_table_association" "dev-private-rt-association" {
  subnet_id      = aws_subnet.dev-pri-sub.id
  route_table_id = aws_route_table.dev-private-rt.id
}
