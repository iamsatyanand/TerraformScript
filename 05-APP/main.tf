module "my_ec2" {
  source = "./modules/ec2"
  ami    = "ami-0d176f79571d18a8f"
}

module "my_s3" {
  source = "./modules/s3"
}
