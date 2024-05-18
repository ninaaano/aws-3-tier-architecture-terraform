#database instance#

resource "aws_db_instance" "prod-database" {
  allocated_storage      = 10
  db_name                = var.prod_db_name
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.instance-type-db
  username               = var.prod_db_username
  password               = var.prod_db_password
  parameter_group_name   = "prod-db-instance"
  skip_final_snapshot    = true
  multi_az               = true
  vpc_security_group_ids = [aws_security_group.prod-db-sg.id]

  db_subnet_group_name = aws_db_subnet_group.prod-db-subnet-group.name

  tags = {
    Name   = var.basic_name + "prod-rds"
    Env    = var.env
    Author = var.author
  }

}