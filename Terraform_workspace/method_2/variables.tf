variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = map(string)

  default = {
    "dev" = "t3.micro"
    "stag" = "t3.small"
    
  }

}