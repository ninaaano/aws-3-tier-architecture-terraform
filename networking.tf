#create IGW#

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = var.dev_igw
    Environment = "dev"
  }
}

resource "aws_internet_gateway" "stage-igw" {
  vpc_id = aws_vpc.stage-vpc.id
  tags = {
    Name = var.stage_igw
    Environment = "stage"
  }
}

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = var.prod_igw
    Environment = "prod"
  }
}

###elastic IP address###

resource "aws_eip" "dev-eip-address" {
    domain     = "vpc"
    
}

resource "aws_eip" "stage-eip-address" {
    domain     = "vpc"
    
}

resource "aws_eip" "prod-eip-address" {
    domain     = "vpc"
    
}

resource "aws_eip" "prod-eip-address2" {
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

resource "aws_nat_gateway" "stage-nat-gateway" {
  allocation_id = aws_eip.stage-eip-address.id
  subnet_id     = aws_subnet.stage-nat-sub.id

  tags = {
    Name = var.stage_nat_gateway
  }

  depends_on = [aws_internet_gateway.stage-igw]
}

resource "aws_nat_gateway" "prod-nat-gateway" {
  allocation_id = aws_eip.prod-eip-address.id
  subnet_id     = aws_subnet.prod-nat-sub.id

  tags = {
    Name = var.prod_nat_gateway
  }

  depends_on = [aws_internet_gateway.prod-igw]
}

resource "aws_nat_gateway" "prod-nat-gateway2" {
  allocation_id = aws_eip.prod-eip-address2.id
  subnet_id     = aws_subnet.prod-nat-sub2.id

  tags = {
    Name = var.prod_nat_gateway_2
  }

  depends_on = [aws_internet_gateway.prod-igw]
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

#public route table# - STAGE

resource "aws_route_table" "stage-public-rt" {
  vpc_id = aws_vpc.stage-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.stage-igw.id
  }
  tags = {
    Name = "stage-public-rt-name"
  }
}
resource "aws_route_table_association" "stage-public-rt-association1" {
  subnet_id      = aws_subnet.stage-nat-sub.id
  route_table_id = aws_route_table.stage-public-rt.id
}

#private route table#

resource "aws_route_table" "stage-private-rt-az-1" {
  vpc_id = aws_vpc.stage-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.stage-nat-gateway.id
  }

   tags = {
    Name = var.private-rt-name-1
  }
}

resource "aws_route_table_association" "stage-private-rt-association1" {
  subnet_id      = aws_subnet.stage-pri-sub.id
  route_table_id = aws_route_table.stage-private-rt-az-1.id
}

resource "aws_route_table_association" "stage-private-rt-association2" {
  subnet_id      = aws_subnet.stage-pri-sub2.id
  route_table_id = aws_route_table.stage-private-rt-az-1.id
}

#public route table# - PROD

resource "aws_route_table" "prod-public-rt" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-igw.id
  }
  tags = {
    Name = "prod-public-rt-name"
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
    Name = var.private-rt-name-1
  }
}

resource "aws_route_table" "prod-private-rt-az-2" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.prod-nat-gateway2.id
  }

   tags = {
    Name = var.private-rt-name-2
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