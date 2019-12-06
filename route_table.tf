#Create Route table
resource "aws_route_table" "myroutetable" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.myIGW.id}"
  }

  tags = {
    Name = "My Route Table"

  }
}

#Associate above route table to the subnets
resource "aws_route_table_association" "myroutetableassoc" {
  count          = "${length(data.aws_availability_zones.myazs.names)}"
  subnet_id      = "${aws_subnet.mysubnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.myroutetable.id}"
}
