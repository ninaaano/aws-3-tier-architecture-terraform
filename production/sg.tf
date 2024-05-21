#prod alb security group#

resource "aws_security_group" "prod-alb-sg" {
  name        = var.prod_alb_sg_name
  description = "ALB Security Group"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "http from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  ingress {
    description = "http from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "${var.basic_name}${var.prod_alb_sg_name}"
    Env    = var.env
    Author = var.author
  }
}

#prod auto scaling security group#

resource "aws_security_group" "prod-asg-security-group" {
  name        = var.prod_asg_sg_name
  description = "ASG Security Group"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description     = "HTTP from alb"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.prod-alb-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "${var.basic_name}${var.prod_asg_sg_name}"
    Env    = var.env
    Author = var.author
  }
}

#database security group#

resource "aws_security_group" "prod-db-sg" {
  name        = var.prod_db_sg_name
  description = "DataBase Security Group"
  vpc_id      = aws_vpc.prod-vpc.id
  ingress {

    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "${var.basic_name}${var.prod_db_sg_name}"
    Env    = var.env
    Author = var.author
  }
}