region = "ap-northeast-2"

dev_vpc = "dev-vpc"
stage_vpc = "stage-vpc"
prod_vpc = "prod-vpc"

dev_vpc_cidr_block = "10.0.0.0/16"
stage_vpc_cidr_block = "10.10.0.0/16"
prod_vpc_cidr_block = "10.20.0.0/16"

dev_igw = "dev-igw"
stage_igw = "stage-igw"
prod_igw = "prod-igw"

dev_nat_gateway = "dev-nat"
stage_nat_gateway = "stage-nat"
prod_nat_gateway = "prod-nat-1"
prod_nat_gateway_2 = "prod-nat-2"

az_1 = "ap-northeast-2a"
az_2 = "ap-northeast-2c"

instance-type-db = "db.t3.micro"

dev_nat_sub_cidr = "10.0.1.0/24"
dev_nat_sub_name = "dev nat sub"
dev_pri_sub_name = "dev pri sub"
dev_pri_sub_cidr = "10.0.2.0/24"

stage_nat_sub_cidr = "10.0.3.0/24"
stage_nat_sub_name = "stage nat sub"
stage_pri_sub_cidr = "10.0.4.0/24"
stage_pri_sub_name = "stage pri sub"
stage_pri_sub_cidr2 = "10.0.5.0/24"
stage_pri_sub_name2 = "stage pri sub2"

prod_nat_sub_cidr = "10.0.6.0/24"
prod_nat_sub_name = "prod nat sub"
prod_nat_sub_cidr2 = "10.0.7.0/24"
prod_nat_sub_name2 = "prod nat sub2"
prod_pri_sub_cidr = "10.0.5.0/24"
prod_pri_sub_name = "prod pri sub"
prod_pri_sub_cidr2 = "10.0.6.0/24"
prod_pri_sub_name2 = "prod pri sub2"

# 여기 수정

public-rt-name = "3-tier-public-rt"
private-rt-name-1 = "3-tier-private-rt-1"
private-rt-name-2 = "3-tier-private-rt-2"

key-name = "project-key"

# alb
stage_alb_name = "stage-alb"
stage_alb_sg_name = "stage-alb-sg"

prod_alb_name = "prod-alb"
prod_alb_sg_name = "prod-alb-sg"

# asg
stage_asg_name = "stage-asg"
stage_asg_sg_name = "stage-asg-sg"
stage_tg_name = "stage-tg"

prod_asg_name = "prod-asg"
prod_asg_sg_name = "prod-asg-sg"
prod_tg_name = "prod-tg"

# db
dev_db_name = "dev-rdsdb"
dev_db_sg_name = "dev-db-sg"
dev_db_password = "devdb1234"
dev_db_username = "root"

stage_db_name = "stage-rdsdb"
stage_db_sg_name = "stage-db-sg"
stage_db_password = "stagedb1234"
stage_db_username = "root"

prod_db_name = "prod-rdsdb"
prod_db_sg_name = "prod-db-sg"
prod_db_password = "proddb1234"
prod_db_username = "root"

domain = "ninaaano.shop"
bucket_name = ""
app_name = "service"
acm_arn = "arn:aws:acm:us-east-1:992382638511:certificate/86065644-00c3-4509-b68c-4a3f54bbfd7b"