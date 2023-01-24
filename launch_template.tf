resource "aws_launch_template" "gladys_asg" {
  name_prefix   = "gladys_asg"
  image_id      = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "my_instances"
  }
}