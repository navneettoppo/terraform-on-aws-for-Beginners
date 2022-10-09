provider "aws" {
  region = "us-east-2"
}

data "aws_security_group" "nav-sg" {
  id = "sg-06b07c04accb8898e"                                                    // your existing security group id
}

resource "aws_instance" "example" {
  ami                     =  "ami-0fb653ca2d3203ac1" 
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [data.aws_security_group.nav-prome-sg.id]
  depends_on              = [data.aws_security_group.nav-prome-sg]
  tags                    = {
    Name = "my-server-tf"
  }
}