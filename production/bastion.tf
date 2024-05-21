########################################################################################################################
## Bastion host SG and EC2 Instance
########################################################################################################################

resource "aws_security_group" "ec2-bastion-sg" {
  name        = "prod-SecurityGroup-BastionHost"
  description = "Bastion host Security Group"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "${var.basic_name}-prod-sg-bastionhost"
    Env    = "${var.env}"
    Author = "${var.author}"
  }
}

resource "aws_instance" "ec2-bastion-host" {
    ami = data.aws_ami.amazon_linux_2
    instance_type = "t3.micro"
    key_name = aws_key_pair.ec2-bastion-host-key-pair.key_name
    vpc_security_group_ids = [ aws_security_group.ec2-bastion-sg.id ]
    subnet_id = aws_subnet.prod-nat-sub.id
    associate_public_ip_address = false
    root_block_device {
      volume_size = 8
      delete_on_termination = true
      volume_type = "gp2"
      encrypted = true
      tags = {
        Name = "${var.basic_name}-prod-ec2-bastion-host-root-volume"
        Env = "${var.env}"
        Author = "${var.author}"
      }
    }
    credit_specification {
      cpu_credits = "standard"
    }
    tags = {
        Name = "${var.basic_name}-prod-ec2-bastion-host"
        Env = "${var.env}"
        Author = "${var.author}"
    }
    lifecycle {
      ignore_changes = [ 
        associate_public_ip_address,
       ]
    }
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }

  owners = ["amazon"]
}

## EC2 Bastion Host Elastic IP
resource "aws_eip" "ec2-bastion-host-eip" {
  domain = "vpc"
  tags = {
    Name = "prod-ec2-bastion-host-eip"
  }
}

## EC2 Bastion Host Elastic IP Association
resource "aws_eip_association" "ec2-bastion-host-eip-association" {
  instance_id   = aws_instance.ec2-bastion-host.id
  allocation_id = aws_eip.ec2-bastion-host-eip.id
}