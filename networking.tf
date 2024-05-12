#create IGW#

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = var.dev_igw
    Environment = var.dev_env
  }
}

resource "aws_internet_gateway" "stage-igw" {
  vpc_id = aws_vpc.stage-vpc.id
  tags = {
    Name = var.stage_igw
    Environment = var.stage_env
  }
}

resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags = {
    Name = var.prod_igw
    Environment = var.prod_env
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

resource "aws_eip" "prod-eip-address-2" {
    domain     = "vpc"
    
}

#create NGW#

resource "aws_nat_gateway" "dev-nat-gateway" {
  allocation_id = aws_eip.dev-eip-address.id
  subnet_id     = aws_subnet.web-subnet-1.id

  tags = {
    Name = var.dev_nat_gateway
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "stage-nat-gateway" {
  allocation_id = aws_eip.stage-eip-address.id
  subnet_id     = aws_subnet.web-subnet-2.id

  tags = {
    Name = var.stage_nat_gateway
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "prod-nat-gateway" {
  allocation_id = aws_eip.prod-eip-address.id
  subnet_id     = aws_subnet.web-subnet-2.id

  tags = {
    Name = var.prod_nat_gateway
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "prod-nat-gateway-2" {
  allocation_id = aws_eip.prod-eip-address-2.id
  subnet_id     = aws_subnet.web-subnet-2.id

  tags = {
    Name = var.prod_nat_gateway_2
  }

  depends_on = [aws_internet_gateway.igw]
}