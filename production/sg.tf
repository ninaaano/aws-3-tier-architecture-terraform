#prod alb security group#

resource "aws_security_group" "prod-alb-sg" {
  name        = var.prod_alb_sg_name
  description = "ALB Security Group"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "http from internet"
    from_port   = var.host_port
    to_port     = var.host_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow https"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_security_group" "prod-ecs-tasks" {
  vpc_id = aws_vpc.prod-vpc.id
  name = "ecs-tasks-sg"

  ingress {
    from_port       = var.host_port
    protocol        = "tcp"
    to_port         = var.container_port
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port     = 0
    protocol      = "-1"
    to_port       = 0
    cidr_blocks   = ["0.0.0.0/0"]
  }
}