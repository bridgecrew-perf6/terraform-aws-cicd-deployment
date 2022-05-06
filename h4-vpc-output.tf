output "vpc_id" {
  description = "VPC ID of the VPC"
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = module.vpc.vpc_cidr_block
}

output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value = module.vpc.default_security_group_id
}

output "private_subnets" {
  description = "List of IDs of the private subnets"
  value = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of the public subnets"
  value = module.vpc.public_subnets
}

output "database_subnets" {
  description = "List of IDs of the database subnets"
  value = module.vpc.database_subnets
}

output "database_subnet_group_name" {
  description = "Database subnet group name"
  value = module.vpc.database_subnet_group_name
}


