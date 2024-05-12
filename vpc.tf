#vpc creation#

resource "aws_vpc" "dev-vpc" {
  cidr_block       = var.dev_vpc_cidr_block

  tags = {
    Name = var.dev_vpc
    Environment = var.dev_env
  }
}

resource "aws_vpc" "stage-vpc" {
  cidr_block       = var.stage_vpc_cidr_block

  tags = {
    Name = var.stage_vpc
    Environment = var.stage_env
  }
}

resource "aws_vpc" "prod-vpc" {
  cidr_block       = var.prod_vpc_cidr_block

  tags = {
    Name = var.prod_vpc
    Environment = var.prod_env
  }
}