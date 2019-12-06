
#Create Security Group to allow port 80 to the world
resource "aws_security_group" "my_sg" {
  name   = "allow_http"
  vpc_id = "${aws_vpc.myvpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_sec_group"
  }

}