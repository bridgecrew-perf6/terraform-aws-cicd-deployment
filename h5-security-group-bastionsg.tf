module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.9.0"

  name = "${local.name}-public_bastion_sg"
  description = "Security Group with SSH port open for every one."
  vpc_id = module.vpc.vpc_id
  # Ingress rule
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules = ["ssh-tcp"]
  # Egress rule
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules = ["all-all"]

  tags = local.common_tags
}