#Create an ALB target group

resource "aws_lb_target_group" "my-alb-tg" {
  name     = "my-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.love_vpc.id
}
