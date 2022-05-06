# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.14.0"

  # VPC Basic Details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs = var.vpc_availability_zone
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  # Database Subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets  = var.vpc_database_subnets

  # NAT Gateway for Outbound traffic
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # VPC DNS Parameter
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
      Type = "public_subnets"
  }

  private_subnet_tags = {
      Type = "private_subnets"
  }

  database_subnet_tags = {
      Type = "database_subnets"
  }

  tags = local.common_tags

  vpc_tags ={
    Name = module.vpc.name
  }

}