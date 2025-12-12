resource "aws_instance" "linux_vm" {
	ami = var.ami
	instance_type = var.instance_type
	key_name = "terraform-kp"
	security_groups = ["default"]
	tags = {
		Name = "Testing1-server"
	}
}
