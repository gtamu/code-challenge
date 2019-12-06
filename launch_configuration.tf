# Create Launch Configuration
resource "aws_launch_configuration" "my_launch_conf" {
  name_prefix                 = "terraform-lc-example"
  image_id                    = "${var.image_id}"
  instance_type               = "${var.instance_type}"
  security_groups             = ["${aws_security_group.my_sg.id}"]
  user_data                   = "${file("server-script.sh")}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

