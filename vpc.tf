
#Create VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "${var.cidr_block}"

  tags = {
    Name = "FP VPC"
  }
}

#Create Subnet

resource "aws_subnet" "mysubnet" {
  count             = "${length(data.aws_availability_zones.myazs.names)}"
  vpc_id            = "${aws_vpc.myvpc.id}"
  availability_zone = "${element(data.aws_availability_zones.myazs.names, count.index)}"
  cidr_block        = "${element(var.subnet_blocks, count.index)}"

  tags = {
    Name = "Subnet-${count.index + 1}"
  }
}

