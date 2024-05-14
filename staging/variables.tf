variable "region" {
  description = "aws_region"
}

variable "stage_vpc" {
  description = "stage vpc"
}

variable "stage_vpc_cidr_block" {
  description = "stage vpc cidr block"
}

variable "stage_nat_gateway" {
  description = "stage NAT Gateway name"
}

variable "stage_igw" {
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

variable "stage_nat_sub_cidr" {
  description = "CIDR Block for stage nat-tier Subnet"
}

variable "stage_nat_sub_name" {
  description = "Name for stage nat-tier Subnet"
}

variable "stage_nat_sub_cidr2" {
  description = "CIDR Block for stage nat-tier Subnet-2"
}

variable "stage_nat_sub_name2" {
  description = "Name for stage nat-tier Subnet-2"
}

variable "stage_pri_sub_cidr" {
  description = "CIDR Block for stage pri Subnet-1"
}

variable "stage_pri_sub_name" {
  description = "Name for stage pri Subnet-1"
}

variable "stage_pri_sub_cidr2" {
  description = "CIDR Block for stage pri Subnet-2"
}

variable "stage_pri_sub_name2" {
  description = "Name for stage pri Subnet-2"
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

variable "stage_alb_name" {
  description = "alb for the stage"
}

variable "stage_alb_sg_name" {
  description = "alb security group 1"
}

variable "stage_asg_name" {
  description = "asg in stage"
}

variable "stage_asg_sg_name" {
  description = "asg security group 1 name"
}

variable "stage_tg_name" {
  description = "target group for web"
}

variable "stage_db_username" {
  description = "Username for db instance"
}

variable "stage_db_password" {
  description = "Password for db instance"
}

variable "stage_db_name" {
  description = "Name for Database"
}

variable "instance-type-db" {
  description = "db instance type"
}

variable "stage_db_sg_name" {
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