resource "aws_autoscaling_group" "gladys_asg" {
  vpc_zone_identifier =  var.pub-sub-id
  desired_capacity    = 0
  max_size            = 0
  min_size            = 0
  target_group_arns   = ["${aws_lb_target_group.my-alb-tg.arn}"]

  launch_template {
    id      = aws_launch_template.gladys_asg.id
    version = "$Latest"
  }
}
