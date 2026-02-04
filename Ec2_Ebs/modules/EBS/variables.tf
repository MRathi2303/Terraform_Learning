variable "volume_type" {
  description = "Type of ebs volume"
  type = string
}

variable "vol_size" {
  type = number
  description = "Specify the size of EBS volume"
}

variable "availability_zone" {
  type = string
  description = "the availability zone in which we want to setup EBS"
}