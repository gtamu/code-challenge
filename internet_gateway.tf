#Create Internet Gateway
resource "aws_internet_gateway" "myIGW" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags = {
    Name = "My Internet Gateway"
  }
}