provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./module/ec2"
  ami_id = var.ami_id
  instance_type = lookup(var.instance_type,terraform.workspace,"t2.micro")
  
}