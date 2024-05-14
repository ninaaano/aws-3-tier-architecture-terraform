#create IGW#

resource "aws_internet_gateway" "stage-igw" {
  vpc_id = aws_vpc.stage-vpc.id
  tags = {
    Name = var.stage_igw
    Environment = "stage"
  }
}

###elastic IP address###

resource "aws_eip" "stage-eip-address" {
    domain     = "vpc"
    
}

#create NGW#

resource "aws_nat_gateway" "stage-nat-gateway" {
  allocation_id = aws_eip.stage-eip-address.id
  subnet_id     = aws_subnet.stage-nat-sub.id

  tags = {
    Name = var.stage_nat_gateway
  }

  depends_on = [aws_internet_gateway.stage-igw]
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