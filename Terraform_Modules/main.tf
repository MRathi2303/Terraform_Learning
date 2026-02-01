provider "aws" {
  region = "us-east-1"
}

module "ec2_instace" {
  source = "./modules/ec2_instance"
  ami_value = "ami-0b6c6ebed2801a5cb"
  instances_Type = "t3.micro"
  keyValue = "Trial_Key"
}