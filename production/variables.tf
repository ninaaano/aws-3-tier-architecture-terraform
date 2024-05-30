variable "region" {
  description = "aws_region"
}

variable "prod_vpc" {
  description = "prod vpc"
}

variable "prod_vpc_cidr_block" {
  description = "prod vpc cidr block"
}

variable "prod_nat_gateway" {
  description = "prod NAT Gateway name"
}

variable "prod_nat_gateway_2" {
  description = "prod NAT Gateway name2"
}

variable "prod_igw" {
  description = "internet gateway name"
}

variable "az_1" {
  description = "availability zone 1"
}

variable "az_2" {
  description = "availability zone 2"
}

variable "prod_nat_sub_cidr" {
  description = "CIDR Block for prod nat-tier Subnet-1"
}

variable "prod_nat_sub_name" {
  description = "Name for prod nat-tier Subnet-1"
}

variable "prod_nat_sub_cidr2" {
  description = "CIDR Block for prod nat-tier Subnet-2"
}

variable "prod_nat_sub_name2" {
  description = "Name for prod nat-tier Subnet-2"
}

variable "prod_pri_sub_cidr" {
  description = "CIDR Block for prod pri Subnet-1"
}

variable "prod_pri_sub_name" {
  description = "Name for prod pri Subnet-1"
}

variable "prod_pri_sub_cidr2" {
  description = "CIDR Block for prod pri Subnet-2"
}

variable "prod_pri_sub_name2" {
  description = "Name for prod pri Subnet-2"
}

variable "prod_db_sub_cidr" {
  description = "CIDR Block for prod db Subnet"
}

variable "prod_db_sub_name" {
  description = "Name for prod pri Subnet"
}

variable "prod_db_sub_cidr2" {
  description = "CIDR Block for prod db Subnet-2"
}

variable "prod_db_sub_name2" {
  description = "Name for prod db Subnet2"
}

variable "prod_public_rt_name" {
  description = "Name for Public Route table"
}

variable "prod_public_rt_name2" {
  description = "Name for Public Route table"
}

variable "prod_private_rt_name" {
  description = "Name for Private Route table"
}

variable "prod_private_rt_name2" {
  description = "Name for Private Route table"
}

variable "prod_alb_name" {
  description = "Name the Load Balancer for the prod"
}

variable "prod_alb_sg_name" {
  description = "Name for alb security group 1"
}

variable "prod_asg_name" {
  description = "Name the Auto Scaling group in prod"
}

variable "prod_asg_sg_name" {
  description = "Name for asg security group 1"
}

variable "prod_tg_name" {
  description = "Name for Target group prod"
}

variable "prod_db_username" {
  description = "Username for db instance"
}

variable "prod_db_password" {
  description = "Password for db instance"
}

variable "prod_db_name" {
  description = "Name for Database"
}

variable "instance-type-db" {
  description = "db instance type"
}

variable "prod_db_sg_name" {
  description = "Name for DB Security group"
}

variable "domain" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "app_name" {
  type = string
}

variable "acm_arn" {
  type = string
}

variable "tpl_path" {
  type = string
}

variable "basic_name" {
  description = "Basic name for resources"
  type        = string
}

variable "env" {
  description = "Environment for resources"
  type        = string
}

variable "author" {
  description = "Author identifier"
  type        = string
}

########################################################################################################################
## EC2 Computing variables
########################################################################################################################
variable "instance_type" {
  description = "Instance type for EC2"
  default     = "t3.micro"
  type        = string
}

# EC2 Bastion Host variables
variable "ec2-bastion-public-key-path" {
  type = string
}

variable "ec2-bastion-private-key-path" {
  type = string
}

variable "container_port" {
  type = number
  default = 80
}

variable "host_port" {
  type = number
  default = 80
}
