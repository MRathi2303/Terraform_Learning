provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./module/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  
}