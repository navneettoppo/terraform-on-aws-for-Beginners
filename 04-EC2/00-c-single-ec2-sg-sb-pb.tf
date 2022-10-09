provider "aws" {
  region = "ap-northeast-1"
}

data "aws_security_group" "nav-prome-sg" {
  id = "sg-06b07c04accb8898e"                                                    // your existing security group id
}

resource "aws_instance" "nav-dock-3" {                                           // optional* count of instances  
  ami                         = "ami-0f36dcfcc94112ea1"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0eeb3e9267b2d6bbf"
  associate_public_ip_address = true
  key_name                    = "nav-prometheus"                                 // your bash script

  vpc_security_group_ids = [data.aws_security_group.nav-prome-sg.id]

  tags = {                                                                      // tags for your instances
    Name        = "nav-ubuntu-dock-3"
    Environment = "DEV"
    OS          = "UBUNTU"
    Managed     = "IAC"
  }

  depends_on = [data.aws_security_group.nav-prome-sg]
}
