resource "aws_security_group" "my_alb_sg" {
  name        = "my_alb_sg"
  description = "Allow inbound traffic to instance"
  vpc_id      = aws_vpc.love_vpc.id

  dynamic "ingress" {
    for_each = var.inbound_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_alb_sg"
  }

}
