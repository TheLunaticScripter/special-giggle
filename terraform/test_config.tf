provider "aws" {
  access_key = "AKIAIE5N7GQ2CGP3ETFA"
  secret_key = "E2ADryFDi2b2OaMXCbciWhdyRr5+ZZJJNVNt+hqh"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
}
