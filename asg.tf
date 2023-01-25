resource "aws_autoscaling_group" "gladys_asg" {
  vpc_zone_identifier = "${element(aws_subnet.love-private-subnt.*.id, count.index)}"
  desired_capacity    = 3
  max_size            = 3
  min_size            = 1
  target_group_arns   = ["${aws_lb_target_group.my-alb-tg.arn}"]

  launch_template {
    id      = aws_launch_template.gladys_asg.id
    version = "$Latest"
  }
}
