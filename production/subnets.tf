# prod sub - nat
resource "aws_subnet" "prod-nat-sub" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = var.prod_nat_sub_cidr
    map_public_ip_on_launch = "true"
    availability_zone = var.az_1

    tags = {
        Name = var.prod_nat_sub_name
    }
}

resource "aws_subnet" "prod-nat-sub2" {
    vpc_id = aws_vpc.prod-vpc.id
    cidr_block = var.prod_nat_sub_cidr2
    map_public_ip_on_launch = "true"
    availability_zone = var.az_2

    tags = {
        Name = var.prod_nat_sub_name2
    }
}

# prod pri sub
resource "aws_subnet" "prod-pri-sub" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = var.prod_pri_sub_cidr
  availability_zone = var.az_1

  tags = {
    Name = var.prod_pri_sub_name
  }
}

resource "aws_subnet" "prod-pri-sub2" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = var.prod_pri_sub_cidr2
  availability_zone = var.az_2

  tags = {
    Name = var.prod_pri_sub_name2
  }
}

resource "aws_db_subnet_group" "prod-db-subnet-group" {
  name = "prod-db-subnet-group"
  subnet_ids = [
    aws_subnet.prod-pri-sub.id, aws_subnet.prod-pri-sub2.id
  ]

  tags = {
    Name = "prod db subnet group"
  }
  
}