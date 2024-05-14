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

variable "key-name" {
  description = "key pair"
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

# 이거 수정
variable "public-rt-name" {
  description = "Name for Public Route table"
}

variable "private-rt-name-1" {
  description = "Name for Private Route table"
}

variable "private-rt-name-2" {
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