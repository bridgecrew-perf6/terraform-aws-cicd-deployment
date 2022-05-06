# terraform-aws-cicd-deployment
This project is to build a three tier application(without DB instance provisioned) in a standalone VPC with files (config,tfvars and buildspec) needed for CICD Pipeline.

An AWS Code Pipeline with Code Build process can be manually built or via another terraform project in my Github Repository (not Ready yet). This pipeline will deploy the infrastrature in Dev and Stage Environment.

# Key Files Explanation
- buildspec-dev.yml & buildspec-stage.yml
```yaml
# buildspec-dev.yaml
version: 0.2

env:
  variables:
    # Swithc the TF_COMMAND varibale for deploy and destroy
    # TF_COMMAND: "apply"
    TF_COMMAND: "destroy"

phases:
  pre_build:
    commands:
      # For local testing, you can store tfstate to local but during code build, s3 backend is needed.
      - sed -i 's/# backend/backend/g' h1-versions.tf   
      - sed -i 's/profile =/# profile =/g' h1-versions.tf
      # Different conf and variable files are used
      - terraform init -input=false -backend-config=config-dev.conf
      - terraform validate
      - terraform plan -lock=false -var-file=h0-dev.tfvars
  build:
    commands:
      - terraform $TF_COMMAND -var-file=h0-dev.tfvars -auto-approve

```

- config-dev.conf & config-stage.conf
  - DynamoDB tables with Partition Key LockID(String) need to be manually created or via terraform template 
  - S3 bucket needs to be manually created or via terraform template
```yaml
bucket = "terraform-resource-bucket-07285xx"   
key = "terraform-aws-cicd-deployment/dev/terraform.tfstate"
region = "ap-southeast-2"
dynamodb_table = "cicd-dev-tfstate"      
```

- h0-dev.tfvars & h0-stage.tfvars
    - Use different varibles for both dev and stage environment
```yaml
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
```

- h3-local-values.tf
    - local.name will be used in almost all the resources creation as same types of resources cannot use the same name such security group,launch template...
```yaml
# Define Local Values
locals {
  owners = var.team
  environment = var.environment
  name = "${local.owners}-${local.environment}"
  common_tags = {
      owners = local.owners
      environment = local.environment
  }
  ...
}
```

- h11-autoscaling-launchtemplate-resource.tf
    - Use *Depends_on*: EC2 instances need to be created after the VPC is ready as they need to install packages from internet so a NAT gateway is needed for VPC creation.
```yaml
resource "aws_launch_template" "my_new_lt" {
  # Wait until VPC is created with NAT gateway and EC2 can be launched
  depends_on = [        
    module.vpc
  ]
  name_prefix = "${local.name}-"
  # name = "my-new-launch-template"
  ...
}
```