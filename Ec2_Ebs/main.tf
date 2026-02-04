provider "aws" {
  region = "us-east-1"
}

module "demoEC2" {
  source = "./modules/Ec2"
  ami    = "ami-0b6c6ebed2801a5cb"
  key    = "Trial_Key"
}

module "DemoEbs" {
  source = "./modules/EBS"
  vol_size          = 5
  volume_type = "gp3"
  availability_zone = module.demoEC2.availability_zone
}

resource "aws_volume_attachment" "attach_ebs" {
  device_name = "/dev/xvdf"
  volume_id   = module.DemoEbs.volume_id
  instance_id = module.demoEC2.instance_id
}