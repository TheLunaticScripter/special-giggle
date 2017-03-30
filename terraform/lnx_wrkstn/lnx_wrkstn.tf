provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

data "aws_ami" "ubuntu16" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubt_wrkstn" {
  ami           = "${data.aws_ami.ubuntu16.id}"
  instance_type = "t2.medium"
  key_name = "${var.key_name}"
  tags {
    Name = "jsnow-ubt-wrkstn"
    X-Contact = "jsnow"
  }
}
