resource "aws_eip" "bastion_eip" {
  depends_on = [    # EIP may reqiure IGW to associate, use depend on.
    module.vpc,
    module.ec2_public
  ]
  instance = module.ec2_public.id
  vpc      = true
  tags = local.common_tags
}