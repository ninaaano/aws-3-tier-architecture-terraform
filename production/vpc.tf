#vpc creation#

resource "aws_vpc" "prod-vpc" {
  cidr_block       = var.prod_vpc_cidr_block

  tags = {
    Name = var.prod_vpc
    Environment = "prod"
  }
}