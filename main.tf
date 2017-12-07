provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_security_group" "sg" {
  name        = "example-terraform"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["${var.vpn_cidr}"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"
  key_name      = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  tags {
    Name = "Example-Terraform"
  }
}