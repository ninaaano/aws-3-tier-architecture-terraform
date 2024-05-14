#stage alb security group#

resource "aws_security_group" "stage-alb-sg" {
  name        = var.stage_alb_sg_name
  description = "ALB Security Group"
  vpc_id      = aws_vpc.stage-vpc.id

  ingress {
    description = "http from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
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
    Name = var.stage_alb_sg_name
  }
}

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
    Name = var.prod_alb_sg_name
  }
}

#stage auto scaling security group#

resource "aws_security_group" "stage-asg-security-group" {
  name        = var.stage_asg_sg_name
  description = "ASG Security Group"
  vpc_id      = aws_vpc.stage-vpc.id

  ingress {
    description = "HTTP from alb"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.stage-alb-sg.id]
  }

    ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
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
    Name = var.stage_asg_sg_name
  }
}

#prod auto scaling security group#

resource "aws_security_group" "prod-asg-security-group" {
  name        = var.prod_asg_sg_name
  description = "ASG Security Group"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "HTTP from alb"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.prod-alb-sg.id]
  }

    ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.prod-asg-security-group.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.prod_asg_sg_name
  }
}

#database security group#

resource "aws_security_group" "dev-db-sg" {
  name        = var.dev_db_sg_name
  description = "DataBase Security Group"
  vpc_id      = aws_vpc.dev-vpc.id
  ingress {

    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.dev_db_sg_name
  }
}

resource "aws_security_group" "stage-db-sg" {
  name        = var.stage_db_sg_name
  description = "DataBase Security Group"
  vpc_id      = aws_vpc.stage-vpc.id
  ingress {

    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.stage-asg-security-group.id]
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.stage_db_sg_name
  }
}

resource "aws_security_group" "prod-db-sg" {
  name        = var.prod_db_sg_name
  description = "DataBase Security Group"
  vpc_id      = aws_vpc.prod-vpc.id
  ingress {

    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.prod-asg-security-group.id]
    
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.prod_db_sg_name
  }
}