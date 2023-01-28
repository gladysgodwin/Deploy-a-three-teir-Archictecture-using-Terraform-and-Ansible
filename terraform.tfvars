priv-subnets_name   = "love_private_subnets"
public-subnets_name = "love-pub-subnets"
availability_zones  = ["us-east-1b", "us-east-1a"]
vpc_name            = "love_vpc"
region              = "us-east-1"
vpc_cidr_block      = "18.0.0.0/16"
subnet_cidrs_public = ["18.0.1.0/24", "18.0.2.0/24"]
subnet_cidrs_priv   = ["18.0.3.0/24", "18.0.4.0/24"]
igw_name            = "love-igw"
pub-rt              = "love-publicRt"
priv-rt             = "love-privRt"
inbound_ports       = [22, 80, 443]
alb-sg              = "my_alb_sg"
domain              = "praestohealth.com.ng"
a-record            = "terraform-test.praestohealth.com.ng"
instance_type       = "t2.micro"
ami                 = "ami-0b5eea76982371e91"
