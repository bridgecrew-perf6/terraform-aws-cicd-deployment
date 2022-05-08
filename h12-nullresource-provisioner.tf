# resource "null_resource" "bastion_config" {

#   connection {
#     type     = "ssh"
#     user     = "ec2-user"
#     private_key = file("private-key/${var.instance_keypair}.pem")
#     host     = module.ec2_public.public_ip
#   }

#   provisioner "file" {
#     source      = "private-key/${var.instance_keypair}.pem"
#     destination = "/tmp/${var.instance_keypair}.pem"
#   }

#   provisioner "remote-exec" {
#     inline = ["sudo chmod 400 /tmp/${var.instance_keypair}.pem"]
#   }

# }