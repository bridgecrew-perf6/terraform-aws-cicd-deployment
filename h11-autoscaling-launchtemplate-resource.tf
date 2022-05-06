resource "aws_launch_template" "my_new_lt" {
  depends_on = [        # Wait until VPC is created with NAT gateway and EC2 can be launched
    module.vpc
  ]
  name_prefix = "${local.name}-"
  # name = "my-new-launch-template"
  image_id = data.aws_ami.amazonlinux2.id
  description = "My new Launch Template"
  instance_type = var.instance_type
  
  key_name = var.instance_keypair
  vpc_security_group_ids = [module.private_sg.security_group_id]

  user_data = filebase64("${path.module}/app1-install.sh")

  disable_api_termination = false   # set this to true will impact auto-scaling if the instance is unhealthy
  ebs_optimized = true
  update_default_version = true

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 8
      volume_type = "gp2"
      delete_on_termination = true
    }
  }
  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${local.name}-appserver"
    }
  }


}