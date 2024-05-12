variable "region" {
  description = "aws_region"
}

variable "dev_vpc" {
    description = "dev vpc"
}

variable "stage_vpc" {
    description = "stage vpc"
}

variable "prod_vpc" {
    description = "prod vpc"
}

variable "dev_vpc_cidr_block" {
  description = "dev vpc cidr block"
}

variable "stage_vpc_cidr_block" {
  description = "stage vpc cidr block"
}

variable "prod_vpc_cidr_block" {
  description = "prod vpc cidr block"
}

variable "dev_env" {
    description = "dev env"
}

variable "stage_env" {
    description = "stage env"
}

variable "prod_env" {
    description = "prod env"
}

variable "dev_nat_gateway" {
  description = "dev NAT Gateway name"
}

variable "stage_nat_gateway" {
  description = "stage NAT Gateway name"
}

variable "prod_nat_gateway" {
  description = "prod NAT Gateway name"
}

variable "prod_nat_gateway_2" {
  description = "prod NAT Gateway name2"
}

variable "dev_igw" {
  description = "internet gateway name"
}

variable "az_1" {
    description = "availability zone 1"
}

variable "az_2" {
    description = "availability zone 2"
}


# 이거 어떻게 하지?
variable "image-id" {
    description = "ami image id"
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

variable "stage_nat_sub_cidr" {
  description = "CIDR Block for stage nat-tier Subnet"
}

variable "stage_nat_sub_name" {
  description = "Name for stage nat-tier Subnet"
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

variable "dev_pri_sub_cidr" {
  description = "CIDR Block for dev pri Subnet-1"
}

variable "dev_pri_sub_name" {
  description = "Name for dev pri Subnet-1"
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

variable "prod_pri_sub_cidr" {
  description = "CIDR Block for prod pri Subnet-1"
}

variable "prod_pri_sub_name" {
  description = "Name for prod pri Subnet-1"
}

variable "prod_pri_sub_cidr" {
  description = "CIDR Block for prod pri Subnet-2"
}

variable "prod_pri_sub_name" {
  description = "Name for prod pri Subnet-2"
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

variable "launch-template-web-name" {
  description = "web launch template"
}

variable "alb-web-name" {
  description = "alb for the Web Tier"
}

variable "alb-sg-web-name" {
  description = "alb security group 1"
}

variable "asg-web-name" {
  description = "asg in Web Tier"
}

variable "asg-sg-web-name" {
  description = "asg security group 1 name"
}

variable "tg-web-name" {
  description = "target group for web"
}

variable "launch-template-app-name" {
  description = "app launch template"
}

variable "alb-app-name" {
  description = "Name the Load Balancer for the App Tier"
}

variable "alb-sg-app-name" {
  description = "Name for alb security group 1"
}

variable "asg-app-name" {
  description = "Name the Auto Scaling group in app Tier"
}

variable "asg-sg-app-name" {
  description = "Name for asg security group 1"
}

variable "tg-app-name" {
  description = "Name for Target group app"
}

variable "db-username" {
  description = "Username for db instance"
}

variable "db-password" {
  description = "Password for db instance"
}

variable "db-name" {
  description = "Name for Database"
}

variable "instance-type-db" {
  description = "db instance type"
}

variable "db-sg-name" {
  description = "Name for DB Security group"
}

variable "db-subnet-grp-name" {
  description = "Name for DB Subnet Group"
}