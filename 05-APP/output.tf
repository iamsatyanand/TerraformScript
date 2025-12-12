output "ec2_vm_public_ip" {
  value = module.my_ec2.ec2-vm-public-ip
}

output "ec2_vm_private_ip" {
  value = module.my_ec2.ec2-vm-private-ip
}
