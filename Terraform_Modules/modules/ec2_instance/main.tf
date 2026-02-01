#learning Teraform Modules 

 provider "aws" {
   region = "us-east-1"
 }

 resource "aws_instance" "exampleInstance" {
   ami = var.ami_value
   instance_type = var.instances_Type
   key_name = var.keyValue
 }