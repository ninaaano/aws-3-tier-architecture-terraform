# prod sub - nat
resource "aws_subnet" "prod-nat-sub" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = var.prod_nat_sub_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = var.az_1

  tags = {
    Name   = "${var.basic_name}${var.prod_nat_sub_name}"
    Env    = var.env
    Author = var.author
  }
}

resource "aws_subnet" "prod-nat-sub2" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = var.prod_nat_sub_cidr2
  map_public_ip_on_launch = "true"
  availability_zone       = var.az_2

  tags = {
    Name   = "${var.basic_name}${var.prod_nat_sub_name2}"
    Env    = var.env
    Author = var.author
  }
}

# prod pri sub
resource "aws_subnet" "prod-pri-sub" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.prod_pri_sub_cidr
  availability_zone = var.az_1

  tags = {
    Name   = "${var.basic_name}${var.prod_pri_sub_name}"
    Env    = var.env
    Author = var.author
  }
}

resource "aws_subnet" "prod-pri-sub2" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.prod_pri_sub_cidr2
  availability_zone = var.az_2

  tags = {
    Name   = "${var.basic_name}${var.prod_pri_sub_name2}"
    Env    = var.env
    Author = var.author
  }
}

#database subnets#

resource "aws_subnet" "prod-db-sub" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.prod_db_sub_cidr
  availability_zone = var.az_1

  tags = {
    Name   = "${var.basic_name}${var.prod_db_sub_name}"
    Env    = var.env
    Author = var.author
  }
}

resource "aws_subnet" "prod-db-sub2" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = var.prod_db_sub_cidr2
  availability_zone = var.az_2

  tags = {
    Name   = "${var.basic_name}${var.prod_db_sub_name2}"
    Env    = var.env
    Author = var.author
  }
}

resource "aws_db_subnet_group" "prod-db-subnet-group" {
  name = "prod-db-subnet-group"
  subnet_ids = [
    aws_subnet.prod-db-sub.id, aws_subnet.prod-db-sub2.id
  ]

  tags = {
    Name   = "${var.basic_name}${var.prod_db_sg_name}"
    Env    = var.env
    Author = var.author
  }

}