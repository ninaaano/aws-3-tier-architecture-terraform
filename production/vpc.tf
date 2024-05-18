#vpc creation#

resource "aws_vpc" "prod-vpc" {
  cidr_block = var.prod_vpc_cidr_block

  tags = {
    Name   = var.basic_name + var.prod_vpc
    Env    = var.env
    Author = var.author
  }
}