# Public Bastion Host
output "ec2_bastin_public_instance_id" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}


output "ec2_bastin_public_ip" {
  description = "List of the public IP"
  value       = resource.aws_eip.bastion_eip.public_ip
}


output "ec2_bastin_connect_url" {
  description = "Bastion Host Connect URL"
  value = "ssh -i ${var.instance_keypair}.pem ec2-user@${resource.aws_eip.bastion_eip.public_ip}"
}

