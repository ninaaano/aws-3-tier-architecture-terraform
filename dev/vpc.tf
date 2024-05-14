#vpc creation#

resource "aws_vpc" "dev-vpc" {
  cidr_block       = var.dev_vpc_cidr_block

  tags = {
    Name = var.dev_vpc
    Environment = "dev"
  }
}