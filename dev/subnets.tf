# dev Public Subnet - NAT
resource "aws_subnet" "dev-nat-sub" {
    vpc_id = aws_vpc.dev-vpc.id
    cidr_block = var.dev_nat_sub_cidr
    map_public_ip_on_launch = "true"
    availability_zone = var.az_1

    tags = {
        Name = var.dev_nat_sub_name
    }
}

# dev private subnet
resource "aws_subnet" "dev-pri-sub" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = var.dev_pri_sub_cidr
  availability_zone = var.az_1

  tags = {
    Name = var.dev_pri_sub_name
  }
}