#database security group#

resource "aws_security_group" "dev-db-sg" {
  name        = var.dev_db_sg_name
  description = "DataBase Security Group"
  vpc_id      = aws_vpc.dev-vpc.id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]    
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
