variable "region" {
    type        = string
    description = "my aws region"
}

variable "vpc_cidr_block" {
    type        = string
    description = "vpc cidr main block"
}

variable "vpc_name" {
    type        = string
    description = "my VPC name"
}

variable "availability_zones" {
    type        = list
    description = "availability zones"
}

variable "subnet_cidrs_public" {
    type        = list
    description = "Public subnets cidrs"
}

variable "subnet_cidrs_priv" {
    type        = list
    description = "Private subnets cidrs"
}

variable "igw_name" {
    type        = string
    description = "Internet gateway name"
}

variable "pub-rt" {
    type        = string
    description = "Public route table name"
}

variable "priv-rt" {
    type        = string
    description = "Private route table name"
}

variable "priv-subnets_name" {
    type        = string
    description = "Private subnet name"
}

variable "public-subnets_name" {
    type        = string
    description = "Public subnet name"
}

variable "inbound_ports" {
  type        = list(number)
  description = "inbound ports for sg"
}

variable "alb-sg" {
  type        = string
  description = "sg name"
}

variable "domain" {
  type        = string
  description = "domain name"
}

variable "a-record" {
  type        = string
  description = "subdomain"
}

variable "ami" {
  type        = string
  description = "instance ami"
}

variable "instance_type" {
  type        = string
  description = "instance type"
}

variable "pubssh-key" {
  type        = string
  description = "public ssh key"
  sensitive   = true
}

variable "pub-sub-id" {
  type        = string
  description = "public subnets"
}
