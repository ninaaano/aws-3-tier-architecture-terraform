#database instance#

resource "aws_db_instance" "dev-database" {
  allocated_storage    = 10
  db_name              = var.dev_db_name
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.instance-type-db
  username             = var.dev_db_username
  password             = var.dev_db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.dev-db-sg.id]
}
