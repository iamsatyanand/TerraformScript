provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "linux_vm" {
  ami             = "ami-0d176f79571d18a8f"
  instance_type   = "t3.micro"
  key_name        = "terraform-kp"
  security_groups = ["default"]
  tags = {
    Name = "Testing-Server"
  }
}