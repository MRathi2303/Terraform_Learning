variable "ami" {
  type = string
  description = "AMI ID for the Ec2 instance"
}

variable "key" {
  description = "key to ssh into EC2"
  type = string
}

