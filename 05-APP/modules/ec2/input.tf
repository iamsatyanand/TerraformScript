variable "instance_type" {
	description = "ec2-instance"
	default = "t3.micro"

}

variable "ami" {
	description = "amazon vm ami"
	type = string
}
