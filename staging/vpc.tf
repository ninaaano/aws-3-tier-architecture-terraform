#vpc creation#

resource "aws_vpc" "stage-vpc" {
  cidr_block       = var.stage_vpc_cidr_block

  tags = {
    Name = var.stage_vpc
    Environment = "stage"
  }
}
