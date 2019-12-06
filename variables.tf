
# Variables stored here
variable "cidr_block" {
  default = "10.0.0.0/16"
}

data "aws_availability_zones" "myazs" {
  state = "available"
}

variable "subnet_blocks" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "image_id" {
  default = "ami-0dacb0c129b49f529"
}

variable "instance_type" {
  default = "t2.micro"
}


