# Create Auto Scaling Group

resource "aws_autoscaling_group" "bar" {
  name                 = "terraform-asg-example"
  launch_configuration = "${aws_launch_configuration.my_launch_conf.name}"
  min_size             = 3
  max_size             = 5
  desired_capacity     = 3
  target_group_arns    = ["${aws_lb_target_group.mylbtarget.arn}"]
  vpc_zone_identifier  = "${aws_subnet.mysubnet.*.id}"


  lifecycle {
    create_before_destroy = true
  }
}

