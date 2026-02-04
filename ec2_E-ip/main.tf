provider "aws" {
  region = "us-east-1"
}

module "demo01" {
  source = "./modules/ec2"
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"
}
