environment = "dev"

# ASG Number of Instances
asg_desired = 1
asg_max = 2
asg_min = 0

# Default DNS Name for ALB
default_dns_name = "dev.sparkiot.click"


# VPC Variable
vpc_name = "my-vpc"
vpc_cidr_block = "20.0.0.0/16"
vpc_availability_zone = ["ap-southeast-2a", "ap-southeast-2b"]
vpc_public_subnets  = ["20.0.1.0/24", "20.0.2.0/24"]
vpc_private_subnets = ["20.0.101.0/24", "20.0.102.0/24"]
vpc_database_subnets  = ["20.0.151.0/24", "20.0.152.0/24"]
vpc_create_database_subnet_group           = true
vpc_create_database_subnet_route_table     = true
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true
vpc_one_nat_gateway_per_az = false


