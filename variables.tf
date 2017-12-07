variable "vpc_id" {
  description = "id of the VPC"
}

variable "vpn_cidr" {
  description = "id of VPN"
}

variable "subnet_id" {
  description = "id of subnet"
}

variable "key_name" {
  description = "name of the key for SSH access"
}

variable "instance_type" {
  description = "Instance type to use"
  default = "t2.micro"
}

variable "aws_region" {
  description = "AWS region"
  default = "us-east-1"
}

variable "ami" {
  description = "AMI to use"
  default = "ami-55ef662f"
}