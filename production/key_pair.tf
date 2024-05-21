## Generate PEM (and OpenSSH) formatted private key.
resource "tls_private_key" "ec2-bastion-host-key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

## Create the file for Public Key
resource "local_file" "ec2-bastion-host-public-key" {
  depends_on = [tls_private_key.ec2-bastion-host-key-pair]
  content    = tls_private_key.ec2-bastion-host-key-pair.public_key_openssh
  filename   = var.ec2-bastion-public-key-path
}

## Create the sensitive file for Private Key
resource "local_sensitive_file" "ec2-bastion-host-private-key" {
  depends_on      = [tls_private_key.ec2-bastion-host-key-pair]
  content         = tls_private_key.ec2-bastion-host-key-pair.private_key_pem
  filename        = var.ec2-bastion-private-key-path
  file_permission = "0600"
}

## AWS SSH Key Pair
resource "aws_key_pair" "ec2-bastion-host-key-pair" {
  key_name   = "${var.basic_name}-prod-ec2-bastion-host-key-pair"
  public_key = file(var.ec2-bastion-public-key-path)
}