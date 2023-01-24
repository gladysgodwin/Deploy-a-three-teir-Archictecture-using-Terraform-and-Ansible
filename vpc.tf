# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_vpc" "love_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# Create Public subnets
resource "aws_subnet" "love-public-subnt" {
  count = "${length(var.subnet_cidrs_public)}"

  vpc_id = aws_vpc.love_vpc.id
  cidr_block = "${var.subnet_cidrs_public[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
    Name = var.public-subnets_name
  }
}

# Create Private subnets
resource "aws_subnet" "love-private-subnt" {
  count = "${length(var.subnet_cidrs_priv)}"

  vpc_id = aws_vpc.love_vpc.id
  cidr_block = "${var.subnet_cidrs_priv[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
    Name = var.priv-subnets_name
  }
}


# Create internet gateway

resource "aws_internet_gateway" "love-igw" {
  vpc_id = aws_vpc.love_vpc.id
  
  tags = {
    Name = var.igw_name
  }
}

# Create a route table

resource "aws_route_table" "my_public_RT" {
  vpc_id = aws_vpc.love_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.love-igw.id
  }

  tags {
    Name = var.pub-rt
  }
}

resource "aws_route_table" "my_private_RT" {
  vpc_id = aws_vpc.love_vpc.id

  tags {
    Name = var.priv-rt
  }
}

# Create Public Subnet Association

resource "aws_route_table_association" "public_sub_route_association" {
  count          = "${length(var.subnet_cidrs_public)}"

  subnet_id      = "${element(aws_subnet.love-public-subnt.*.id, count.index)}"
  route_table_id = aws_route_table.my_public_RT.id
}

# Create Private Subnet Association
resource "aws_route_table_association" "priv_sub_route_association" {
  count          = "${length(var.subnet_cidrs_priv)}"

  subnet_id      = "${element(aws_subnet.love-private-subnt.*.id, count.index)}"
  route_table_id = aws_route_table.my_private_RT.id
}

