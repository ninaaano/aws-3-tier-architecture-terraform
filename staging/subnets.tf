# stage Public Subnet - NAT
resource "aws_subnet" "stage-nat-sub" {
    vpc_id = aws_vpc.stage-vpc.id
    cidr_block = var.stage_nat_sub_cidr
    map_public_ip_on_launch = "true"
    availability_zone = var.az_1

    tags = {
        Name = var.stage_nat_sub_name
    }
}

resource "aws_subnet" "stage-nat-sub2" {
    vpc_id = aws_vpc.stage-vpc.id
    cidr_block = var.stage_nat_sub_cidr2
    map_public_ip_on_launch = "true"
    availability_zone = var.az_2

    tags = {
        Name = var.stage_nat_sub_name2
    }
}

# stage pri sub
resource "aws_subnet" "stage-pri-sub" {
  vpc_id     = aws_vpc.stage-vpc.id
  cidr_block = var.stage_pri_sub_cidr
  availability_zone = var.az_1

  tags = {
    Name = var.stage_pri_sub_name
  }
}

resource "aws_subnet" "stage-pri-sub2" {
  vpc_id     = aws_vpc.stage-vpc.id
  cidr_block = var.stage_pri_sub_cidr2
  availability_zone = var.az_2

  tags = {
    Name = var.stage_pri_sub_name2
  }
}