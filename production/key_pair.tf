resource "aws_key_pair" "prod-key" {
  key_name   = "${var.key_name}"
  public_key = var.public_ec2_key

  tags = {
    Scenario = "${var.basic_name}${var.key_name}"
    Env = "${var.env}"
    Author = "${var.author}"
  }
}