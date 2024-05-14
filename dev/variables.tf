variable "region" {
  description = "aws_region"
}

variable "dev_vpc" {
  description = "dev vpc"
}

variable "dev_vpc_cidr_block" {
  description = "dev vpc cidr block"
}

variable "dev_nat_gateway" {
  description = "dev NAT Gateway name"
}

variable "dev_igw" {
  description = "internet gateway name"
}

variable "az_1" {
  description = "availability zone 1"
}

variable "key-name" {
  description = "key pair"
}

variable "dev_nat_sub_cidr" {
  description = "CIDR Block for dev nat-tier Subnet"
}

variable "dev_nat_sub_name" {
  description = "Name for dev nat-tier Subnet"
}

variable "dev_pri_sub_cidr" {
  description = "CIDR Block for dev pri Subnet-1"
}

variable "dev_pri_sub_name" {
  description = "Name for dev pri Subnet-1"
}

variable "public-rt-name" {
  description = "Name for Public Route table"
}

variable "private-rt-name-1" {
  description = "Name for Private Route table"
}

variable "private-rt-name-2" {
  description = "Name for Private Route table"
}

variable "dev_db_username" {
  description = "Username for db instance"
}

variable "dev_db_password" {
  description = "Password for db instance"
}

variable "dev_db_name" {
  description = "Name for Database"
}

variable "instance-type-db" {
  description = "db instance type"
}

variable "dev_db_sg_name" {
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

variable "tpl_path" {
  type = string
}