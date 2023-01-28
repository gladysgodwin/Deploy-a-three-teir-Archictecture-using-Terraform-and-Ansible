/*
resource "aws_launch_template" "gladys_asg" {
  name_prefix   = "gladys_asg"
  image_id      = var.ami
  instance_type = var.instance_type
  tags = {
    Name = "my_instances"
  }
  depends_on = [
aws_key_pair.mykeypair
]
}
variable "key_name" {default="mykey"}
resource "tls_private_key" "privkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "mykeypair" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.privkey.public_key_openssh}"
}
*/
