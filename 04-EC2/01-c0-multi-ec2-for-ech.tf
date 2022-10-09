variable "awsprops" {
  type = map(string)
  default = {
    region       = "ap-northeast-1"
    vpc          = "vpc-0221805bfb420dcb5"
    ami          = "ami-0f36dcfcc94112ea1"
    itype        = "t2.micro"
    subnet       = "subnet-0eeb3e9267b2d6bbf"
    publicip     = true
    keyname      = "nav-prometheus"
    secgroupname = "nav-p-sg"
  }
}

provider "aws" {
  region = lookup(var.awsprops, "region")
}

data "aws_security_group" "nav-prome-sg" {
  id = "sg-08f826afca633c2e5"
}

resource "aws_instance" "nav-tf" {
  ami = lookup(var.awsprops, "ami")
  for_each  = {                     # for_each iterates over each key and values
      key1 = lookup(var.awsprops, "itype")             # Instance 1 will have key1 with t2.micro instance type
      key2 = lookup(var.awsprops, "itype")
      key3 = lookup(var.awsprops, "itype")            # Instance 2 will have key2 with t2.medium instance type
        }
        instance_type  = each.value
    key_name       = each.key
    tags =  {
       Name  = each.value
    }
}