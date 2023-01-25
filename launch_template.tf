resource "aws_launch_template" "gladys_asg" {
  name_prefix   = "gladys_asg"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = "mykey"
  tags = {
    Name = "my_instances"
  }
  depends_on = [
aws_key_pair.mykeypair
]
}
resource "aws_key_pair" "mykeypair" {
key_name   = "mykey"
public_key = var.pubssh-key
}
