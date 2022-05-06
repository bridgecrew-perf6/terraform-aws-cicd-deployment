# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "ap-southeast-2"
}

# Environment
variable "environment" {
  description = "Environment"
  type = string
}

# Team
variable "team" {
  description = "Team"
  type = string
}

# Credential Profile
variable "aws_credential_profile" {
  description = "Your Own AWS credential Profile"
  type = string
}

# Route 53 Domain - Host Zone
variable "mydomain" {
  description = "Route 53 Domain - Host Zone"
  type = string
}
# SNS Notification Email Endpoint
variable "sns_email_endpoint" {
  description = "SNS Email Endpoint"
  type = string
}

# ASG Desired Instance
variable "asg_desired" {
  description = "Desired Number of Instances"
  type = number
}

# ASG Max Instance
variable "asg_max" {
  description = "Max Number of Instances"
  type = number
}

# ASG Min Instance
variable "asg_min" {
  description = "Min Number of Instances"
  type = number
}



# VPC Variable
variable "vpc_name" {
  description = "VPC Name"
  default = "my-vpc"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
}

variable "vpc_availability_zone" {
  description = "VPC Availability Zones"
}

variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
}

variable "vpc_private_subnets" {
  description = "VPC Private Subnet"
  type = list(string)
}

variable "vpc_database_subnets" {
  description = "VPC Database Subnet"
  type = list(string)
}

variable "vpc_create_database_subnet_group" {
  description = "Create Database Subnet Group"
}

variable "vpc_create_database_subnet_route_table" {
  description = "Create Database Subnet Route Table"
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateway"
}

variable "vpc_single_nat_gateway" {
  description = "Enable Single NAT Gateway"
}

variable "vpc_one_nat_gateway_per_az" {
  description = "One NAT Gateway per AZ"
}


# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair"
  type = string
}



# Default DNS Name
variable "default_dns_name" {
  description = "Default DNS Name"
}


