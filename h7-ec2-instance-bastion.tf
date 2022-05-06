module "ec2_public" {   # Can be customized but source should remmain the same
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.5.0"
  name = "${var.environment}-bastion"
  
  ami                    = data.aws_ami.amazonlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  subnet_id = module.vpc.public_subnets[0]
  tags = local.common_tags
}