#create IGW#

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name   = var.basic_name + var.prod_igw
    Env    = var.env
    Author = var.author
  }
}

###elastic IP address###

resource "aws_eip" "prod-eip-address" {
  domain = "vpc"

}

resource "aws_eip" "prod-eip-address2" {
  domain = "vpc"

}

#create NGW#

resource "aws_nat_gateway" "prod-nat-gateway" {
  allocation_id = aws_eip.prod-eip-address.id
  subnet_id     = aws_subnet.prod-nat-sub.id

  tags = {
    Name   = var.basic_name + var.prod_nat_gateway
    Env    = var.env
    Author = var.author
  }

  depends_on = [aws_internet_gateway.prod-igw]
}

resource "aws_nat_gateway" "prod-nat-gateway2" {
  allocation_id = aws_eip.prod-eip-address2.id
  subnet_id     = aws_subnet.prod-nat-sub2.id

  tags = {
    Name   = var.basic_name + var.prod_nat_gateway_2
    Env    = var.env
    Author = var.author
  }


  depends_on = [aws_internet_gateway.prod-igw]
}

#public route table# - PROD

resource "aws_route_table" "prod-public-rt" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-igw.id
  }
  tags = {
    Name   = var.basic_name + var.public-rt-name
    Env    = var.env
    Author = var.author
  }


}
resource "aws_route_table_association" "prod-public-rt-association" {
  subnet_id      = aws_subnet.prod-nat-sub.id
  route_table_id = aws_route_table.prod-public-rt.id
}

resource "aws_route_table_association" "prod-public-rt-association2" {
  subnet_id      = aws_subnet.prod-nat-sub2.id
  route_table_id = aws_route_table.prod-public-rt.id
}

#private route table#

resource "aws_route_table" "prod-private-rt-az-1" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.prod-nat-gateway.id
  }

  tags = {
    Name   = var.basic_name + var.private-rt-name-1
    Env    = var.env
    Author = var.author
  }
}

resource "aws_route_table" "prod-private-rt-az-2" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.prod-nat-gateway2.id
  }

  tags = {
    Name   = var.basic_name + var.private-rt-name-2
    Env    = var.env
    Author = var.author
  }
}

resource "aws_route_table_association" "prod-private-rt-association1" {
  subnet_id      = aws_subnet.prod-pri-sub.id
  route_table_id = aws_route_table.prod-private-rt-az-1.id
}

resource "aws_route_table_association" "prod-private-rt-association2" {
  subnet_id      = aws_subnet.prod-pri-sub2.id
  route_table_id = aws_route_table.prod-private-rt-az-2.id
}