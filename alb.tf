#Create Load Balancer

resource "aws_lb" "my-alb" {
  count          = "${length(var.subnet_cidrs_public)}"
  
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_alb_sg.id]
  subnets            = aws_subnet.love-public-subnt[count.index]
}

resource "aws_lb_listener" "lb_lst" {
  count          = "${length(var.subnet_cidrs_public)}"
  
  load_balancer_arn = aws_lb.my-alb[count.index]
  #aws_lb.my-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-alb-tg.arn
  }
}

resource "aws_lb_listener_rule" "dom-rule" {
  count          = "${length(var.subnet_cidrs_public)}"
  
  listener_arn = aws_lb_listener.lb_lst[count.index]
#aws_lb_listener.lb_lst.arn
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my-alb-tg.arn
  }

  condition {
    host_header {
      values = ["terraform-test.praestohealth.com.ng"]
    }
  }
}
