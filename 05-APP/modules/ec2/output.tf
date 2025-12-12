
output "ec2-vm-public-ip" {
	value = aws_instance.linux_vm.public_ip
}

output "ec2-vm-private-ip" {
	value = aws_instance.linux_vm.private_ip
}
