variable "tag_ec2" {
  type = list(string)
  default = ["ec21a","ec21b"]
}
                                            
variable "ami" {                   # Creating a Variable for ami
  type = string
}