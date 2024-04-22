# DEFAULT
REGION           = "us-east-1"

CLUSTER_NAME     = "eks-project-cluster"
CLUSTER_VERSION  = "1.21"

# VPC
VPC-NAME         = "eks-project-vpc"
VPC-CIDR         = "10.0.0.0/16"
IGW-NAME         = "eks-project-gateway"
PUBLIC-CIDR1     = "10.0.1.0/24"
PUBLIC-SUBNET1   = "eks-project-public-subnet1"
PUBLIC-CIDR2     = "10.0.2.0/24"
PUBLIC-SUBNET2   = "eks-project-public-subnet2"
PRIVATE-CIDR1    = "10.0.3.0/24"
PRIVATE-SUBNET1  = "eks-project-private-subnet1"
PRIVATE-CIDR2    = "10.0.4.0/24"
PRIVATE-SUBNET2  = "eks-project-private-subnet2"
EIP-NAME1        = "eks-project-Elastic-IP1"
EIP-NAME2        = "eks-project-Elastic-IP2"
NGW-NAME1        = "eks-project-NAT1"
NGW-NAME2        = "eks-project-NAT2"
PUBLIC-RT-NAME1  = "eks-project-Public-Route-table1"
PUBLIC-RT-NAME2  = "eks-project-Public-Route-table2"
PRIVATE-RT-NAME1 = "eks-project-Private-Route-table1"
PRIVATE-RT-NAME2 = "eks-project-Private-Route-table2"
AZ-A = "us-east-1a"
AZ-C = "us-east-1c"



# SECURITY GROUP
ALB-SG-NAME = "eks-project-alb-sg"
WEB-SG-NAME = "eks-project-web-sg"
DB-SG-NAME  = "eks-project-db-sg"

# RDS
SG-NAME      = "eks-project-rds-sg"
RDS-USERNAME = "admin"
RDS-PWD      = "Admin1234"
DB-NAME      = "mydb"
RDS-NAME     = "eks-project-RDS"

# ALB
TG-NAME  = "Web-TG"
ALB-NAME = "Web-elb"

# IAM
IAM-ROLE              = "iam-role-for-ec2-SSM-nmj"
IAM-POLICY            = "iam-policy-for-ec2-SSM-nmj"
INSTANCE-PROFILE-NAME = "iam-instance-profile-for-ec2-SSM-nmj"

# CLOUDFRONT
DOMAIN-NAME = "ninaaano.shop"
CDN-NAME    = "eks-project-CDN"

# WAF
WEB-ACL-NAME = "eks-project-WAF"
